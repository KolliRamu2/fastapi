# Fourth Version Dockerfile
# build stage
FROM python:3.12 AS builder
RUN git clone https://github.com/KolliRamu2/fastapi.git
WORKDIR /fastapi
RUN pip3 install --no-cache-dir -r requirements.txt

# run stage
FROM python:3.12-alpine AS runner
LABEL author="Ramu Kolli" role="Student"
#RUN adduser -D fastapi
#ENV HOME=/home/fastapi
#ENV PATH=$HOME/.local/bin:$PATH
#RUN mkdir -p $HOME/.local && chown -R fastapi:fastapi $HOME/.local
USER nobody
COPY --chown=nobody --from=builder /usr/local/lib/python3.12/site-packages/ /usr/local/lib/python3.12/site-packages/
COPY --chown=nobody --from=builder /usr/local/bin/uvicorn /usr/local/bin/uvicorn
COPY --chown=nobody --from=builder /fastapi /app
WORKDIR /app
EXPOSE 8000
RUN pip3 install --no-cache-dir -r requirements.txt
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000","--reload"]

