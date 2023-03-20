# springbootdemo

This demo app was created with Spring Initializer: https://start.spring.io/

## Build and run the application locally

### Configure Maven Wrapper
```
mvn -N wrapper:wrapper
```

### Run the image
```
./mvnw spring-boot:run
```

### Test the application
http://localhost:8080/greeting?name=test

## Build and run the application as a docker container

Build the image using Podman:
```
podman build -t springbootdemo . 
```

Run the container:
```
podman run -p 8080:8080 springbootdemo
```
