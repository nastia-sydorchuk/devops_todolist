# ToDo app in Docker

Docker Hub repository: https://hub.docker.com/repository/docker/stasisydorchuk/todoapp/general

## Build the image

From the project root:

```
docker build -t todoapp .
```

To use a different Python version:

```
docker build --build-arg PYTHON_VERSION=3.10 -t todoapp .
```

## Run the container

```
docker run -d -p 8080:8080 --name todoapp todoapp
```

## Open the app in a browser

- App: http://localhost:8080/
- API: http://localhost:8080/api/

## Push the image to Docker Hub

```
docker login
docker tag todoapp stasisydorchuk/todoapp:1.0.0

docker push stasisydorchuk/todoapp:1.0.0

```
