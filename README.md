
# web-coding-challenge-laravel
** Download the files directly using the following command.**<br />
	`$ git clone https://github.com/as-link/web-coding-challenge-laravel.git`

** Go to the project's directory using**<br />
	`$ cd PROJECTDIRECTORYNAME/`
	
** Install the dependencies**<br />
	`$ composer install`
	
** Import the database using phpmyadmin or the following command line**<br />
	`$ mysql -u username -p databasename < shops.sql`
	
** If you can't see the .env file use the folowing command to create it**<br />
	`$ cp .env.example .env`
	
** The Generate a new key for the application**<br />
	`$ php artisan key:generate`
	
** Setup your database in your .env file.**<br />
```
	DB_CONNECTION=mysql
	DB_HOST=127.0.0.1
	DB_PORT=3306
	DB_DATABASE=DBNAME
	DB_USERNAME=USERNAME
	DB_PASSWORD=PASSWORD 
```
	
** Use following command generate Passport encryption keys  needed to generate secure access tokens.**<br />
	`$ php artisan passport:install`
	
** Create a virtual host**<br />
 ```
 <VirtualHost *:80>
  ServerName shops.loc
  ServerAlias www.shops.loc
  DocumentRoot "${INSTALL_DIR}/path/to/the/public/directory/of/the/project"
  ErrorLog logs/error.log
  CustomLog logs/access.log common
  <Directory "${INSTALL_DIR}/path/to/the/public/directory/of/the/project">
    Options +Indexes +Includes +FollowSymLinks +MultiViews
    AllowOverride All
    Require local
  </Directory>
</VirtualHost>
```
** Update hosts file. Add the following line**<br />
   `$ 127.0.0.1 shops.loc www.shops.loc`

** Restart the server**