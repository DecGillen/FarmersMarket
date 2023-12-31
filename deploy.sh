CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")

if [ -n "$CURRENT_INSTANCE" ]; then 
  sudo docker stop "$CURRENT_INSTANCE"
  sudo docker rm "$CURRENT_INSTANCE"
fi

sudo docker pull "$IMAGE_NAME"

CONTAINER_EXISTS=$(sudo docker ps -a | grep "$CONTAINER_NAME")
if [ -n "$CONTAINER_EXISTS" ]; then 
  sudo docker rm "$CONTAINER_NAME"
fi

sudo docker run -p 3000:3000 -d --name "$CONTAINER_NAME" "$IMAGE_NAME"
