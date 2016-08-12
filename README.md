# QA

#### Easy Run Instructions:

####- Mac OSX: 

 1. Download and install [MySQL Community Server 5.7.14 or later](http://dev.mysql.com/downloads/mysql/)
 
 2. Create User(USERNAME:root;PASSWORD:root) and database(DATABASENAME:QA)
 
 3. Find  System Preferences ➤ MySQL ➤ Start MySQL Server,and start it
 
 4. open /etc/apache2/httpd.conf,find "# LoadModule php5_module libexec/apache2/libphp5".so,and delete "#".

 5. change "AllowOverride None" to "AllowOverride All" for directives may be placed in .htaccess files.
 
 6. Run command：```sudo apachectl restart```
 
 7. Put the QA folder under： /Library/WebServer/Documents/
 
 8. Download and install [MySQL Workbench 6.3.7 or later](http://dev.mysql.com/downloads/workbench/)
 
 9. Find the QA.sql database in QA folder,and Restore it by Data Import/Restore in MySQL Workbench

 10. Open qa-config.php,insert the MySQL details at the top as following:
 
   define('QA_MYSQL_HOSTNAME', '127.0.0.1');  
   define('QA_MYSQL_USERNAME', 'root');  
   define('QA_MYSQL_PASSWORD', 'root');  
   define('QA_MYSQL_DATABASE', 'QA');  
 11. Browse to [http://localhost/QA](http://localhost/QA)
 
 12. Use the super administrator to log in:

   Username:aliber  
   Password:aliber  
   Email address:jack80342@outlook.com
