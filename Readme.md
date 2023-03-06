Please pip install before you run the application:

~~~
pip install -r requirments.txt 
~~~

Run the following MYSQL Container 

~~~
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mydatabase  yanivomc/spring-mysql:latest
~~~


Once the container is running,
you'll be able to run the application.
