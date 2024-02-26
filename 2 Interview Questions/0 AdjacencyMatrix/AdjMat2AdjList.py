import select
import sys

def build_adj_list (adj_matrix):
    n = len(adj_matrix)
    adj_list = [[] for _ in range(n)]
    for i in range(n):
        adj_list[i].append(i)
        for j in range(n):
            if (adj_matrix[i][j]=="1"):
                adj_list[i].append(j)
    return adj_list


def main():
    if select.select([sys.stdin, ], [], [], 0.0)[0]:
        list = sys.stdin.readlines()
        nlist = []
        for i in list:
            nlist.append(i.split())
        n=len(nlist)
        adj_list = build_adj_list(nlist)

        print("Input List\n")

        for i in nlist:
            for j in i:
                print("{} ".format(j), end="")
            print()

        print("\nAdjacent List\n")

        for i in adj_list:
            for j in i:
                print("{} ".format(j), end="")
            print()


    else:
        print("Nothing")


if __name__ == "__main__":
    main()
