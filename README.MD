# FastAPI docker template
Simple docker image allowing for simple usage of fastAPI as webserver.

## Usage
### Production
```shell
docker build --target production -t tojestkrzysio/fastapi:1.0.0 .
docker run -p 80:8000 -d tojestkrzysio/fastapi:1.0.0
```

### Development
```shell
docker build --target base -t tojestkrzysio/fastapi-base:1.0.0 .
```

```yaml
version: "3"
services:
  fastapi:
    image: tojestkrzysio/fastapi-base:1.0.0
    volumes:
      - ./src/:/app/
    ports:
      - "80:8000"
    command: ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
```
