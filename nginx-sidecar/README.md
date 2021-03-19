# nginx-sidecar

This image is used to ensure that the connection between an ECS
service and the ALB is encrypted. It does this by accepting
connections over HTTPS on a specific port (8443), and forwarding those
requests to the main service over an insecure connection (thereby
terminating SSL).

This image contains blackfynn server certificates that enable
encrypted connection between the ALB and an ECS task.

## Usage

This image is meant to be run alongside another service in ECS as a
'sidecar'. It is configurable using the following environment variables:

- `LISTEN_PORT`: The port on which the server should listen for https connections
- `SERVICE_NAME`: The hostname of the service to which the server
  should forward requests
- `SERVICE_PORT`: The port to which the server should forward requests

## Test

The `docker-compose.yml` file contains a simple test case that can be
used to test both https and wss connections using this image.

### 1. Start the test server

```bash
docker-compose up --build nginx-sidecar-test
```

### 2. Ensure the server responds to https requests

```bash
$ curl -k https://localhost:8443
Success!
```

### 3. Ensure the server responds to wss requests

The websocket route is a simple echo server that should reverse your
messages. This test requires
[websocat](https://github.com/vi/websocat).

```bash
$ websocat -k wss://localhost:8443/ws
success?
?sseccus
```
