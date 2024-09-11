from pprint import pprint
from typing import Optional, List

def countRegularCrosses(grid: List[List[int]]) -> int:
    cross = 0
    rows=[]
    V=set()

    Indices=[]
    def rowCross2(grid: List[List[int]], row: int, col: int, check:bool, A: Optional[List[tuple]] , B: Optional[List[tuple]]) -> Optional[List[tuple]]:
        # print("1, check: ",check, "GRID", grid[row][col], "A", A, "B", B)
        # print("2, check: ",check, "GRID", grid[row][col], "A", A, "B", B)
        # print("3, check: ",check, "GRID", grid[row][col], "A", A, "B", B)
        # print("4, check: ",check, "GRID", grid[row][col], "A", A, "B", B)
        # print("5, check: ",check, "GRID", grid[row][col], "A", A, "B", B)
        # print("6, check: ",check, "GRID", grid[row][col], "A", A, "B", B)
        if (
            row in range(len(grid))
            and col in range(len(grid[0]))
        ):
            if A: n=grid[A[-1][0]][A[-1][1]]
            if (check and not A): A.append((row,col,grid[row][col]))
            elif (check and grid[row][col]==n): A.append((row,col,n))
            elif check and grid[row][col]!=n:
                if len(A)==1: B.append(A[-1])
                A[:] = [(row, col, n)]
                check=False
            elif not check and grid[row][col]!=A[-1][2]:
                if len(A)==1: 
                    # A[:] = [(A[-1][0], A[-1][1], B[-1][2])]
                    if B: B.clear()
                    return A
            elif not check and grid[row][col]==A[-1][2]:
                check=True
                A.append((row,col,grid[row][col]))
            else: return B
            return rowCross2(grid, row, col + 1, check, A, B)
        else:
            if len(B)==1 and len(A)>1: return B
            else: return A 

    # def colCross2 (grid: List[List[int]], row: int, col: int, check:bool):
    #     if (
    #         row in range(len(grid))
    #         and col in range(len(grid[0]))
    #     ):
            

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
        # print("1>> [",row,",",col,"]","[",grid[row][col],"]","<<",count)
        # print("2>> [",row,",",col,"]","[",grid[row][col],"]","<<",count)
        # print("3>> [",row,",",col,"]",count)
        if (
            row in range(len(grid))
            and col in range(len(grid[0]))
            and grid[row][col] == value
            and ind
        ):  
            return colCross(grid, row + 1, col, count+1, value, True)
        elif (
            row in range(len(grid))
            and col in range(len(grid[0]))
            and grid[row][col] != value 
            and count != 0
        ):
            return colCross(grid, row + 1, col, count+1, value, False)
        elif (
            row in range(len(grid))
            and col in range(len(grid[0]))
            and grid[row][col] == value
            and not ind
        ):
            return count-2
        else:
            return count-1
    # print(rowCross(grid, 0, 0, 0, grid[0][0], True))
    # print(colCross(grid, 0, 2, 0, grid[0][2], True))
    # print("\n")
    # print(colCross(grid, 0, 1, 0, grid[0][1], True))
    for r in range(len(grid)):
        Indices.extend(rowCross2(grid, r, 0, True, [], []))
        print(Indices)
        # for c in range(len(grid[0])):
            # if colCross(grid, 0, c, 0, grid[0][c], True) >= (len(grid[0]) - 1):
                # print([r,c])
                # cross+=1
        # for c in range(len(grid[0])):
        #     if (
        #         rowCross(grid, r, 0, 0, grid[r][0], True) >= (len(grid) - 1) 
        #         and colCross(grid, 0, c, 0, grid[0][c], True) >= (len(grid[0]) - 1)
        #     ):
        #         print([r,c])
        #         # rows.append(r)
        #         # V.add((r,c))
        #         cross+=1
        # print("\n")
    # print("\nrows:",rows)
    # print(V)
    return cross
# Test cases
test_matrices = [
    # ([[1, 1, 1],
    #   [1, 2, 1],
    #   [1, 1, 1]], 5),
    # ([[2, 1, 1, 1, 3, 4, 5, 1],
    ([[2, 1, 1, 1],
      [1, 2, 1, 1],
      [1, 1, 2, 1],
      [1, 1, 1, 2]
      ], 1000),
    # ([[1, 2],
    #   [2, 1]], 4),
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
    # ([[1, 2, 1, 2, 1],
    #   [2, 2, 2, 2, 2],
    #   [1, 2, 1, 2, 1],
    #   [2, 2, 2, 2, 2],
    #   [1, 2, 1, 2, 1]], 4),
    # ([[1, 2, 3],
    #   [4, 5, 6],
    #   [7, 8, 9]], 0),
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
