# minimized Docker image for Serf

## Fetch latest versions and create `rootfs.tar.gz`
```bash
./update.sh
```

## Build it
```bash
docker build -t serf .
```

## Check it
```bash
docker run --rm -ti serf version
Serf v0.6.4
Agent Protocol: 4 (Understands back to: 2)
```

## Run it
```bash
docker run --rm -ti -p 7373:7373 serf
```
