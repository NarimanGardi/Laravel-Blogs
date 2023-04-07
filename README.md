
# Laravel Blog

  

## Description

  

A simple blog management system using Laravel is a web application that allows users to create, edit, and manage blog posts. Laravel is a popular PHP framework that provides a robust set of tools and features for building web applications. With Laravel, developers can create powerful and scalable web applications with ease. This blog management system built on Laravel is designed to be easy to use and flexible, allowing users to focus on creating great content without worrying about technical details. It includes features such as user authentication, post creation and editing, categorization.

 
  

## Installation

  

* Clone the repository:

	```
	git init
	git clone https://github.com/NarimanGardi/Laravel-Blogs
	```

* Change into the project directory:

	```
	cd Laravel-Blogs
	```

* Install the dependencies:

	```
	composer install
	```

* Create a new `.env` file by copying the `.env.example` file:

	```
	cp .env.example .env
	```

* Update the `DB_` variables in the `.env` file with your database credentials.

* Generate a new application key:

	```
	php artisan key:generate
	```

  

* Link storage folder to public. `required`

	```
	php artisan storage:link
	```

* Migrate the database with seeders `required`

	```
	php artisan migrate --seed
	```

* Serve the application:

	```
	php artisan serve
	```

  



## Unit Testing

  
* Create new database for testing and configure it in `.env` file. `required`
	```
	DB_HOST_TESTING=127.0.0.1
	DB_PORT_TESTING=3306
	DB_DATABASE_TESTING=your_testing_db_name
	DB_USERNAME_TESTING=your_testing_db_username
	DB_PASSWORD_TESTING=your_testing_db_password
	```

* Run Migration For the test database. `required`
	```
	php artisan migrate --database=testing
	```
* Run (Role And Permission) Seeder For the test database. `required`
	```
	php artisan db:seed --class=RolesAndPermissionsSeeder --database=testing
	```

* Run the Test

	```
	php artisan test
	```

  

This will execute all of the tests in the `/tests/Feature` directory and generate a report of the results. If any tests fail, the report will indicate which tests failed and provide details on the nature of the failure.