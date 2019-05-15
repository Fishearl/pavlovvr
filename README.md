# pavlovvr

Docker container which runs a PavlovVR Server

docker build -t pavlov:1.0 .

docker run -it --user steam pavlov:1.0
docker run -it --user steam -p 7000:7000 -p 7200:7200 -p 7777:7777 pavlov:1.0
