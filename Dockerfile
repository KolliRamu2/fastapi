# Fourth Version Dockerfile
# build stage
FROM python:3.12-alpine AS builder
RUN apk update && apk upgrade && apk add git
RUN git clone https://github.com/KolliRamu2/fastapi_main.git
WORKDIR /fastapi_main
RUN pip3 install --no-cache-dir -r requirements.txt

# run stage
FROM python:3.12-alpine AS runner
LABEL author="Ramu Kolli" role="Student"
USER nobody
COPY --from=builder /usr/local/lib/python3.12/site-packages/ /usr/local/lib/python3.12/site-packages/
COPY --from=builder /usr/local/bin/uvicorn /usr/local/bin/uvicorn
COPY --chown=nobody --from=builder /fastapi_main /app
WORKDIR /app
EXPOSE 8000
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000","--reload"]

