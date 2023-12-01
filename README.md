---

# MySQL ScheduleDump

ScheduleDump is a very simple script designed to facilitate automated and scheduled backups of MySQL databases. Leveraging the power of mysqldump. It utilizes mysqldump to create backups for specified databases and includes a mechanism to retain a defined number of recent backups while removing older ones.

## Prerequisites

Before using this script, ensure the following prerequisites are met:

- **MySQLdump**: Ensure that `mysqldump` is installed and accessible in the environment where the script will run. This command-line utility is typically included as part of MySQL installations and is necessary for creating database backups.


## Setup

### Database Connection Details

- **HOST**: The IP address of the MySQL server.
- **PORT**: The port number used for MySQL connections.
- **USERNAME**: The username to access the MySQL server.
- **PASSWORD**: The password associated with the username.

### Backup Configuration

- **FILE_NAME_PREFIX**: Prefix for the backup file names.
- **DIR**: Directory where the backups will be stored.
- **DATABASES**: List of databases to be backed up.
- **KEEP_BACKUPS**: Number of recent backups to retain.

## Current Issue

If incorrect database connection details are provided (wrong HOST, PORT, USERNAME, or PASSWORD), the script will create an empty backup file. This can occur if the script is executed with incorrect or invalid connection information.

## Usage

1. Ensure that the script has the necessary permissions to execute (`chmod +x run.sh`).
2. Update the Database Connection details and Backup Configuration sections according to your setup.
3. Run the script (`./run.sh`) to initiate the backup process.

## How It Works

- The script connects to the specified MySQL server and uses `mysqldump` to create individual backups for each database listed.
- Backups are stored in the designated directory with filenames constructed using the provided prefix, database name, and timestamp.
- The script maintains a specified number of recent backups by removing older backup files once the count exceeds the defined limit.

### Notes

- Ensure that mysqldump is installed and accessible in the environment where the script runs.
- Regularly check and adjust the `KEEP_BACKUPS` variable to retain an appropriate number of backups based on your storage capacity and backup frequency.

---