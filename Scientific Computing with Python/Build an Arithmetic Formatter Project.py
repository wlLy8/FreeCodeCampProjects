def arithmetic_arranger(problems, show_answers=False):
    # Error handling
    if len(problems) > 5:
        return "Error: Too many problems."

    # Initialize lists for each row
    first_row = []
    second_row = []
    dashes_row = []
    answer_row = []

    for problem in problems:
        num1, operator, num2 = problem.split()

        # Validate inputs
        if operator not in ["+", "-"]:
            return "Error: Operator must be '+' or '-'."
        if not (num1.isdigit() and num2.isdigit()):
            return "Error: Numbers must only contain digits."
        if len(num1) > 4 or len(num2) > 4:
            return "Error: Numbers cannot be more than four digits."

        # Calculate width and result
        width = max(len(num1), len(num2)) + 2
        result = str(eval(problem))

        # Format each line
        first_row.append(num1.rjust(width))
        second_row.append(operator + num2.rjust(width - 1))
        dashes_row.append("-" * width)
        answer_row.append(result.rjust(width))

    # Join rows with 4 spaces between problems
    arranged_problems = (
        "    ".join(first_row)
        + "\n"
        + "    ".join(second_row)
        + "\n"
        + "    ".join(dashes_row)
    )

    if show_answers:
        arranged_problems += "\n" + "    ".join(answer_row)

    return arranged_problems


print(f'\n{arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"])}')
