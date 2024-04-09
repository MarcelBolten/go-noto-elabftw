docker compose -f ./docker/docker-compose.yml up -d
sleep 1
docker exec -it python /bin/bash
