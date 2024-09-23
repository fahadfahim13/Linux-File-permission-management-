### **Automated File Permission Management Script**

### **Project Overview:**
Create a bash script that scans a directory and automatically applies specific file permissions based on file types (e.g., read-only for configuration files, executable for scripts). The script should also generate a log of all changes made to file permissions for auditing purposes.

---

### **Requirements:**

#### 1. **Functional Requirements:**
   - The script must identify different file types (e.g., `.conf`, `.sh`, `.txt`, etc.) and apply predefined permissions for each type:
     - `.conf` files: Read-only (`r--r--r--`).
     - `.sh` files: Executable (`rwxr-xr-x`).
     - Other file types: Customizable (e.g., `.txt` files as read-write for the owner, read-only for others).
   - The script must handle subdirectories recursively.
   - A log file should be generated with details of:
     - Date and time of the change.
     - File name and path.
     - Previous permissions and updated permissions.
   - The script must allow the user to specify the directory to scan.
   - It should include an option to preview the changes without applying them (dry run mode).

#### 2. **Non-Functional Requirements:**
   - The script should be modular and easy to modify (allowing changes to file type rules).
   - The script should perform error handling (e.g., missing directory, invalid permissions).
   - The script must run efficiently on directories containing large numbers of files.

---

### **Action Plan:**

#### **Step 1: Project Setup**
   - **Objective**: Set up the basic structure for the project and ensure the environment is ready.
   - **Tasks**:
     - Choose a working directory.
     - Create the main bash script file (`permission_manager.sh`).
     - Set up a logging directory `logs` and create an initial log file (`permission_changes.log`).
   - **Deliverables**:
     - Basic project structure with script and log file created.

#### **Step 2: Define Permission Rules**
   - **Objective**: Define the permission rules for different file types and set them in the script.
   - **Tasks**:
     - Define rules for the following file types:
       - `.conf`: `chmod 444` (read-only).
       - `.sh`: `chmod 755` (executable).
       - `.txt`: `chmod 644` (read-write for owner, read-only for others).
     - Create a function to handle permission setting based on file extensions.
   - **Deliverables**:
     - A bash function that applies correct permissions to files based on their type.

#### **Step 3: Implement Directory Scanning**
   - **Objective**: Implement functionality to recursively scan directories for target file types.
   - **Tasks**:
     - Use `find` command to recursively scan the directory for files with specific extensions (e.g., `.conf`, `.sh`).
     - Create a function that processes each file and applies the predefined permission rules.
   - **Deliverables**:
     - Directory scanning functionality with file type identification.

#### **Step 4: Apply Permissions and Logging**
   - **Objective**: Modify file permissions and log changes in the log file.
   - **Tasks**:
     - For each identified file:
       - Capture current permissions using the `stat` command.
       - Apply the new permissions using `chmod`.
       - Log the changes (old permissions, new permissions, file name, and timestamp) into `permission_changes.log`.
   - **Deliverables**:
     - Permission modification and logging implementation.

#### **Step 5: Implement Dry Run Mode**
   - **Objective**: Provide an option to preview changes without applying them.
   - **Tasks**:
     - Add a flag for "dry run" mode.
     - In dry run mode, the script should display the potential changes without actually modifying the file permissions.
   - **Deliverables**:
     - Dry run mode functionality.

#### **Step 6: Error Handling**
   - **Objective**: Ensure the script handles common errors.
   - **Tasks**:
     - Add error handling for:
       - Invalid directories (e.g., non-existent or inaccessible).
       - Files that cannot be modified due to lack of permissions.
     - Log errors in a separate error log file (`error_log.log`).
   - **Deliverables**:
     - Robust error handling and logging for errors.

#### **Step 7: Testing and Validation**
   - **Objective**: Test the script under different scenarios.
   - **Tasks**:
     - Test on various directories with different file types to ensure the correct permissions are applied.
     - Test edge cases (e.g., files with no extensions, missing directories, files already having the correct permissions).
     - Validate that logs are accurate and capture all changes.
   - **Deliverables**:
     - Tested script with all functionalities working as expected.

---

### **Key Commands and Tools**:
- **File identification**: `find`, `basename`
- **Permission modification**: `chmod`, `chown`, `chgrp`
- **Permission reading**: `stat`
- **Logging**: Use `echo` to append logs to a file
- **Error handling**: Check for directory existence, file permissions (`-w`, `-r` flags)

---

### **Final Deliverables**:
1. **permission_manager.sh**: The main script that automates file permission changes.
2. **permission_changes.log**: A log file detailing permission changes.
3. **error_log.log**: A log file for errors encountered during execution.
4. **Test Cases**: Test cases that confirm the script works in various scenarios (different directories, file types, etc.).

---

### **Run the Project**:
```shell
>> chmod +x permission-manager.sh
>> ./permission-manager.sh
```
