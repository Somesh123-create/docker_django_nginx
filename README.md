# Run the first instance
docker run -d --name amuraa_2 --network testdockerdjango_default --restart always -v D:/DockerPro/TestDockerDjango/TestDockerDjango:/app -v static-data:/vol/static -v media-data:/vol/media -e ENV_FILE=D:/DockerPro/TestDockerDjango/TestDockerDjango/.env -p 8001:8001 -e PORT=8001 amuraa

# Run the second instance
docker run -d --name amuraa_3 --network testdockerdjango_default --restart always -v D:/DockerPro/TestDockerDjango/TestDockerDjango:/app -v static-data:/vol/static -v media-data:/vol/media -e ENV_FILE=D:/DockerPro/TestDockerDjango/TestDockerDjango/.env -p 8002:8002 -e PORT=8002 amuraa

# Run the third instance
docker run -d --name amuraa_4 --network testdockerdjango_default --restart always -v D:/DockerPro/TestDockerDjango/TestDockerDjango:/app -v static-data:/vol/static -v media-data:/vol/media -e ENV_FILE=D:/DockerPro/TestDockerDjango/TestDockerDjango/.env -p 8003:8003 -e PORT=8003 amuraa


