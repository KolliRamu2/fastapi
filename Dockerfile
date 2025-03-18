# Third Version Dockerfile
FROM python:3.12-alpine
LABEL author="Ramu Kolli" role="Student"
USER nobody
ENV HOME=/home/nobody
RUN mkdir -p $HOME/.local && chown -R nobody:nobody $HOME/.local
COPY --chown=nobody . /app
WORKDIR /app
EXPOSE 8000
RUN pip3 install -r requirements.txt
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000","--reload"]
