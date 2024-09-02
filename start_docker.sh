docker compose -f ./docker/docker-compose.yml up -d --build
sleep 1
docker exec -it go-noto-elabftw /bin/bash
