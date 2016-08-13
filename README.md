# QA

#### Easy Run Instructions:

####- Mac OSX: 

 1. Download and install [MySQL Community Server 5.7.14 or later](http://dev.mysql.com/downloads/mysql/)
 
 2. Create User(USERNAME:root;PASSWORD:root) and database(DATABASENAME:QA)
 
 3. Find  System Preferences ➤ MySQL ➤ Start MySQL Server,and start it
 
 4. open /etc/apache2/httpd.conf,find "# LoadModule php5_module libexec/apache2/libphp5.so",and delete "#".

 5. change "AllowOverride None" to "AllowOverride All" for directives that may be placed in .htaccess files.
 
 6. Run command：```sudo apachectl restart```
 
 7. Put the QA folder under： /Library/WebServer/Documents/
 
 8. Download and install [MySQL Workbench 6.3.7 or later](http://dev.mysql.com/downloads/workbench/)
 
 9. Find the QA.sql in QA folder,and Restore it by Data Import/Restore in MySQL Workbench

 10. Browse to [http://localhost/QA](http://localhost/QA)

