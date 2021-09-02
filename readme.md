# Parking Solution
#### How To Set Up And Run On System

1. Install MySql Workbench, Tomcat, Java JDK on your machine.
2. Download our source code zip file.
3. Unzip this folder and run the sql-files(ParkingSolution-schema.sql and ParkingSolution-data.sql) on the workbench, which will create the schema and data data to your local instance of database.
4. After setting up the database, the tomcat would have to be configured.
5. For setting and starting up tomcat, start console/terminal and go to apache-tomcat-x.xx/bin, and run sh startup.sh(mac) and startup.bat (windows) to start tomcat server on your machine.
6. To verify if tomcat is running, go to http://localhost:8080/ to check if tomcat is running. If the tomcat started successfully, then you should see the home page.
7. After successfully running, two approaches can be used:
8. Deploying the war file to tomcat(war file can be found at CS157A-section9-team4/CS157A-section9-team4.war).
9. Placing the application folder(unzipped folder) in the ROOT folder in the tomcat directory.
10.After deploying the war file, and deploying it go to the web-browser, or moving the folder to ROOT directory, sgo to http://localhost:8080/CS157A-section9-team4/home.jsp.
11. The application home page would be displayed and the 3-tier application is now running on your local machine.


