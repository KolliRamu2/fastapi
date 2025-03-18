# First Version Dockerfile
FROM python:3.12
LABEL author="Ramu Kolli" role="Student"
COPY . /app
WORKDIR /app
EXPOSE 8000
RUN pip3 install -r requirements.txt
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000","--reload"]
