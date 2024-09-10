from pprint import pprint
from typing import Optional, List

def countRegularCrosses(grid: List[List[int]]) -> int:
    cross = 0
    rows=[]
    V=set()
    def rowCross(grid: List[List[int]], row: int, col: int, count: int, value: int, ind: bool) -> int:
        if (
            row in range(len(grid))
            and col in range(len(grid[0]))
        ):
            if grid[row][col] == value:
                return rowCross(grid, row, col + 1, count+1, value, ind)
            elif grid[row][col] != value and ind:
                return rowCross(grid, row, col + 1, count+1, value, False)
            else: return count
        else:
            return count

    def colCross(grid: List[List[int]], row: int, col: int, count: int, value: int, ind: bool) -> int:
        if (
            row in range(len(grid))
            and col in range(len(grid[0]))
            and grid[row][col] == value
            and ind
        ):  
            # print("1>> [",row,",",col,"]","[",grid[row][col],"]","<<",count)
            return colCross(grid, row + 1, col, count+1, value, True)
        elif (
            row in range(len(grid))
            and col in range(len(grid[0]))
            and grid[row][col] != value 
            and count != 0
        ):
            # print("2>> [",row,",",col,"]","[",grid[row][col],"]","<<",count)
            return colCross(grid, row + 1, col, count+1, value, False)
        else:
            # print("3>> [",row,",",col,"]",count)
            return count
    for r in range(len(grid)):
        for c in range(len(grid[0])):
            if (
                rowCross(grid, r, 0, 0, grid[r][0], True) >= (len(grid) - 1) and
                colCross(grid, 0, c, 0, grid[r][c], True) >= (len(grid))
            ):
                V.add((r,c))
                cross+=1
    # print("\nrows:",rows)
    # print(rowCross(grid, 1, 0, 0, grid[1][0], True))
    # for r in rows:
    #     for c in range(len(grid[0])):
    #         if colCross(grid, r, c, 0, grid[r][c], True) >= (len(grid)):
    #             V.add((r,c))
    #             cross += 1
        # print("\n")
    print(V)
    return cross
# Test cases
test_matrices = [
    # ([[1, 2, 1, 2, 1],
    #   [2, 2, 2, 2, 2],
    #   [1, 2, 1, 2, 1],
    #   [2, 2, 2, 2, 2],
    #   [1, 2, 1, 2, 1]], 4),
    # ([[1, 1, 1],
    #   [1, 2, 1],
    #   [1, 1, 1]], 5),
    # ([[1, 2, 3],
    #   [4, 5, 6],
    #   [7, 8, 9]], 0),
    ([[1, 2],
      [2, 1]], 4),
    # ([[1]], 0),
    # ([[1, 1],
    #   [1, 1]], 4),
    # ([[1, 2, 3],
    #   [4, 5, 6]], 0),
    # ([[1, 1, 1, 1],
    #   [2, 2, 2, 2],
    #   [3, 3, 3, 3]], 12),
    # ([[1, 2, 3, 4, 5],
    #   [2, 2, 2, 2, 2],
    #   [3, 2, 3, 2, 3],
    #   [4, 2, 2, 2, 4],
    #   [5, 2, 3, 2, 5]], 1),
    # ([[1, 1, 1],
    #   [1, 2, 1],
    #   [1, 1, 1],
    #   [1, 3, 1]], 6),
    # ([[1, 2, 3, 4],
    #   [5, 6, 7, 8],
    #   [9, 10, 11, 12]], 0),
    # ([[1, 2, 1],
    #   [2, 1, 2],
    #   [1, 2, 1]], 5),
    # ([[1, 1, 1, 1],
    #   [1, 2, 3, 1],
    #   [1, 4, 5, 1],
    #   [1, 1, 1, 1]], 4),
    # ([[1, 2, 3],
    #   [4, 5, 6],
    #   [7, 8, 9],
    #   [10, 11, 12]], 0),
    # (
    #     [
    #         [1, 1, 1, 1, 1],
    #         [2, 2, 2, 2, 2],
    #         [1, 1, 1, 1, 1],
    #         [2, 2, 2, 2, 2],
    #         [1, 1, 1, 1, 1],
    #     ],
    #     0,
    # ),
    #     (
    #     [
    #         [1, 1, 1, 1, 1],
    #         [3, 2, 1, 2, 2],
    #         [1, 1, 1, 1, 1],
    #         [3, 2, 1, 2, 2],
    #         [1, 1, 1, 1, 1],
    #     ],
    #     3,
    # ),
    # ([[1, 2, 3, 4],
    #   [2, 2, 2, 2],
    #   [3, 2, 3, 4],
    #   [4, 2, 4, 4]], 3),
    # ([[1, 2, 1],
    #   [2, 3, 2],
    #   [1, 2, 1]], 1),
    # ([[1]], 0),
    # ([[1, 2, 3, 4, 5],
    #   [6, 7, 8, 9, 10]], 0),
    # ([[1, 1, 1],
    #   [1, 2, 1],
    #   [1, 1, 1],
    #   [1, 1, 1],
    #   [1, 3, 1]], 7),
]

for i, (matrix, expected) in enumerate(test_matrices, 1):
    print("*" * 20, f"Test case {i}", "*" * 20)
    pprint(matrix)
    result = countRegularCrosses(matrix)
    print(f"Expected {expected}, got {result}")
    print("_" * 54)
# failed_tests = []
# for i, (matrix, expected) in enumerate(test_matrices, 1):
#     print(f"\nTest case {i}:")
#     pprint(matrix)
#     try:
#         result = countRegularCrosses(matrix)
#         assert result == expected, f"Expected {expected}, got {result}"
#         print(f"Test case {i} passed!")
#     except AssertionError as e:
#         failed_tests.append((i, str(e)))

# # Print summary of failed tests
# if failed_tests:
#     print("\nFailed tests:")
#     for test_num, error in failed_tests:
#         print(f"Test case {test_num}: {error}")
#     print(f"\nTotal failed tests: {len(failed_tests)}/{len(test_matrices)}")
# else:
#     print("\nAll tests passed successfully!")
