POC
===

This application was generated using Spring Roo. Spring MVC is included, and also a RESTful web service supporting Json.

How to create this project from scratch?


1. Download and install the latest Spring Roo.
2. Add Maven and Roo's bin directories to the "PATH" environment variable.
3. Open the command prompt. Create a new local directory for the new project. (mkdir newProject)
4. Switch to Roo shell (command "roo").
5. run the roo commands in the file log.roo.
6. quit roo shell.  (command "quit")
7. find the src/main/resources/META-INF/spring/applicationContext-security.xml, modify the following and save.
    -- add this line: <intercept-url pattern="/locations/**" access="hasRole('ROLE_ADMIN')" />
    -- comment out this line: <password-encoder hash="sha-256" />
    -- change password of user "admin" to "x" or any password you like.

8. run command "mvn tomcat:run"

Prerequisite: This application uses MongoDB as the database so you have to install it.
When running the application, please make sure MongoDB is up and running.
Modify the src/main/resources/META-INF/spring/database.properties if your mongoDB is running on a different port than default 27017.

It's recommended to install the Spring Tool Suite (based on Eclipse) IDE, which has an embedded Roo shell inside.





