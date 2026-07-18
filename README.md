# Hello World Knative Function

A simple Hello World program for Knative Functions using Python.

## Overview

This is a basic CloudEvent handler that returns a greeting message. It demonstrates the core concepts of Knative Functions:
- Event-driven architecture
- CloudEvents protocol
- Function deployment

## Files

- `func.yaml` - Function configuration and metadata
- `func.py` - Main function handler
- `requirements.txt` - Python dependencies
- `Dockerfile` - Container image definition

## Local Development

### Prerequisites
- Python 3.11+
- Knative Functions CLI (kn-func)
- Docker (for containerization)

### Deploy Locally

1. Deploy the function:
```bash
func run
```

The function will start on `http://localhost:8080`

2. Test with a CloudEvent:
```bash
curl -X POST http://localhost:8080 \
  -H "ce-specversion: 1.0" \
  -H "ce-type: com.example.string" \
  -H "ce-source: https://example.com/source" \
  -H "ce-id: A234-1234-1234" \
  -H "content-type: application/json" \
  -d '{"name": "Knative"}'
```

Expected response:
```json
{"message": "Hello Knative from Knative Functions!"}
```

## Deploy to Knative

1. Build and push the container image:
```bash
func build --image <registry>/hello-world:latest
```

2. Deploy to your Knative cluster:
```bash
func deploy --image <registry>/hello-world:latest
```

## Customize

To modify the greeting, edit the `handle()` function in `func.py`:
- Change the default greeting message
- Add custom logic to process the CloudEvent
- Handle different event types

## CloudEvents Format

The function receives CloudEvents in the following format:
```
{
  "specversion": "1.0",
  "type": "com.example.string",
  "source": "https://example.com/source",
  "id": "A234-1234-1234",
  "data": {"name": "Value"}
}
```

## References

- [Knative Functions Documentation](https://knative.dev/docs/functions/)
- [CloudEvents Specification](https://cloudevents.io/)
- [Python CloudEvents Library](https://github.com/cloudevents/sdk-python)
