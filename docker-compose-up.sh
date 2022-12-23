set -e

# Build docker image
CONTAINER_NAME="jira_api"
echo "[PROCESS] Start docker $CONTAINER_NAME"
OLD_CONTAINER_ID=$(docker ps -qa --filter name=$CONTAINER_NAME)
OLD_IMAGE_ID=$(docker images --filter=reference=$CONTAINER_NAME --format "{{.ID}}")
if [ ! -z "$OLD_CONTAINER_ID" ]
then
	echo "[PROCESS]Stop old container.."
	docker stop $OLD_CONTAINER_ID
	
	echo "[PROCESS]Remove old container..."
	docker rm $OLD_CONTAINER_ID

	echo "[PROCESS]Remove old image..."
    docker rmi $OLD_IMAGE_ID
fi
docker build -t jira_api api

#Build docker image
CONTAINER_NAME="jira_client"
echo "[PROCESS] Start docker $CONTAINER_NAME"
OLD_CONTAINER_ID=$(docker ps -qa --filter name=$CONTAINER_NAME)
OLD_IMAGE_ID=$(docker images --filter=reference=$CONTAINER_NAME --format "{{.ID}}")
if [ ! -z "$OLD_CONTAINER_ID" ]
then
	echo "[PROCESS]Stop old container.."
	docker stop $OLD_CONTAINER_ID
	
	echo "[PROCESS]Remove old container..."
	docker rm $OLD_CONTAINER_ID

	echo "[PROCESS]Remove old image..."
    docker rmi $OLD_IMAGE_ID
fi
docker build -t jira_client client

#Run docker compose
docker-compose up -d 