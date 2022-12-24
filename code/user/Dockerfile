FROM python:3.8-slim-buster

#
USER root

#
WORKDIR /app

#
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
#
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
#
COPY . .
RUN chmod -R 777 /app
#
EXPOSE 5050
#
CMD [ "python", "-m" , "application", "run", "--host=0.0.0.0"]
