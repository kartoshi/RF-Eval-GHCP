# Robot Framework Project

This project is designed to automate testing using Robot Framework. It includes reusable keywords, variables, and test suites to ensure efficient and maintainable test automation.

## Project Structure

- **Resources/**: Contains reusable resources such as keywords and variables.
  - `common.robot`: Common keywords for reuse across test cases.
  - `keywords.robot`: Custom keywords for specific actions or checks.
  - `variables.robot`: Variables for better maintainability.

- **TestCases/**: Contains test suites that utilize the resources.
  - `test_suite_1.robot`: The first test suite with a series of test cases.
  - `test_suite_2.robot`: The second test suite with additional test cases.

- **requirements.txt**: Lists the dependencies required for the project.

## Setup Instructions

1. Install Robot Framework and any other dependencies listed in `requirements.txt`.
2. Run the test suites using the Robot Framework command line interface.

## Usage Guidelines

- Use the keywords defined in the `Resources/keywords.robot` file to create test cases.
- Maintain variables in `Resources/variables.robot` for easy updates and management.
- Organize test cases logically within the `TestCases/` directory.