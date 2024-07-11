import pandas as pd
import time
import queue
from selenium import webdriver
from fake_headers import Headers
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from termcolor import colored
from selenium.common.exceptions import WebDriverException
import threading

header = Headers(
    browser="chrome",
    os="win",
    headers=False 
)

customUserAgent = header.generate()['User-Agent']

def parse_title(title):
    if title is None:
        return None, None
    parts = title.split('.', 1)
    if len(parts) == 2:
        return parts[0].strip(), parts[1].strip()
    return None, title.strip()

def scrape_url(driver, url, total, processed, max_retries=10):
    for attempt in range(max_retries):
        try:
            driver.get(f"{url}/description/")
            title_element = WebDriverWait(driver, 100).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "a.no-underline.truncate[href*='/problems/']"))
            )
            title = title_element.text
            print(f"{colored('✓', 'green')} {colored(f'{url}', 'grey')} [{processed}/{total}]")
            return parse_title(title)
        except Exception as e:
            print(f"Attempt {attempt + 1} failed for {url}")
            if attempt == max_retries - 1:
                print(f"{colored('✗', 'red')} {colored(f'{url}', 'grey')} [{processed}/{total}]")
                return None, None
            time.sleep(10)

def worker(driver, url_queue, results, total):
    while True:
        try:
            url, processed = url_queue.get(block=False)
        except queue.Empty:
            break
        result = scrape_url(driver, url, total, processed)
        results.append((url, result))
        time.sleep(10)  
        url_queue.task_done()

def main_scraper(urls):
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument(f"user-agent={customUserAgent}")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    service = Service(ChromeDriverManager().install())
    
    total = len(urls)
    results = []
    url_queue = queue.Queue()

    for i, url in enumerate(urls):
        url_queue.put((url, i+1))   

    drivers = [webdriver.Chrome(service=service, options=chrome_options) for _ in range(5)]
    threads = []

    try:
        for driver in drivers:
            thread = threading.Thread(target=worker, args=(driver, url_queue, results, total))
            thread.start()
            threads.append(thread)

        for thread in threads:
            thread.join()

    finally:
        for driver in drivers:
            driver.quit()

    return [result for _, result in sorted(results, key=lambda x: urls.index(x[0]))]

input_file = "urls.xlsx"
output_file = "output_titles.xlsx" 

df = pd.read_excel(input_file)
urls = df.iloc[:, 0].tolist()
titles = main_scraper(urls)
numbers, names = zip(*titles)
result_df = pd.DataFrame({
    "URL": urls, 
    "Number": numbers, 
    "Problem Name": names
})
result_df.to_excel(output_file, index=False)

print("Titles have been fetched and saved to", output_file)
