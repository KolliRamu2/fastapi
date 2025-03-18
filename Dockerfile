# Third Version Dockerfile
FROM python:3.12-alpine
LABEL author="Ramu Kolli" role="Student"
RUN adduser -D fastapi
ENV HOME=/home/fastapi
RUN mkdir -p $HOME/.local & chown -R fastapi:fastapi $HOME/.local
USER fastapi
COPY --chown=fastapi . /app
WORKDIR /app
EXPOSE 8000
RUN pip3 install --no-cache-dir -r requirements.txt
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000","--reload"]
