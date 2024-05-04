# PyReqInstaller

PyReqInstaller is a Bash script that allows you to automatically install Python dependencies for projects based on the list of imported libraries from a specified Python file.

## How to Use

1. **Installation**: Clone the repository or download the `pyreqinstaller.sh` script.

2. **Execution**: Open a terminal and navigate to the directory containing the script. Then execute the following command:
    ```bash
    bash pyreqinstaller.sh
    ```

3. **Enter the Path to the Python File**: The script will prompt you to enter the path to the Python file that uses libraries.

4. **Choose an Action**: The script will automatically detect missing libraries and offer you three action options:
    - Install all missing libraries in the current Python environment.
    - Create a new virtual environment and install missing libraries in it.
    - Cancel the operation.

5. **Act on Your Choice**: Choose one of the provided actions and follow the on-screen instructions.

## Adding to Commands

To add this script to your commands and invoke it from anywhere in the terminal, follow these steps:

1. **Move the Script to the `bin` Directory**: Copy the `pyreqinstaller.sh` script to the `bin` directory of your system. Typically, this is `/usr/local/bin`, but it may vary depending on your configuration.

    ```bash
    sudo cp pyreqinstaller.sh /usr/local/bin/pyreqinstaller
    ```

2. **Grant Execution Permissions**: Ensure that the script has execution permissions.

    ```bash
    sudo chmod +x /usr/local/bin/pyreqinstaller
    ```

Now you can call the script from anywhere in the terminal by simply typing `pyreqinstaller`.
