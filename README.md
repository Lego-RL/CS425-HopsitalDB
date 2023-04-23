## Preparing the database

- In *MYSQL Workbench* create a new connection, noting the user and password for later.
- Connect to the connection
- Navigate to **Server -> Data Import**
- Under **Import Options**, select **Import from Self-Contained File** and set the file to the `hospital_db.sql` file in this repository.
- For **Default Target Schema**, click "New" and call is **hospitalDatabase**.
- Finally, click on the **Import Progress** tab and click **Start Import**.

## Using the program

- Make sure to have Python 3.10 or higher installed.
- In a terminal in the directory for this project, run `python -m pip install -r requirements.txt` to install the necessary packages.
- Python is prepared. Lastly, create a file in this project's directory called `.env`.
- Open `.env` in a text editor and input database credentials like so:

```
USER=myDatabaseUsername
PASSWORD=myDatabasePassword
```

- Finally, you may run the program using the command `python main.py`.