docker stop meu-decus
docker rm meu-decus
docker rmi decus
docker build -t decus .
docker run -it -d -p 8000:80 --name meu-decus decus
