# Scheduling a GO script inside Docker Container via Cron

## Building the image
```
docker build -t mycron .
```

### Running the container
```
docker run -d --name mycron mycron
```

### Checking Logs
```
docker exec -it mycron /bin/sh

tail -100 /var/log/script.log
```