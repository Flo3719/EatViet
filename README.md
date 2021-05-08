# README

Deployment:

Push to heroku containers using: `heroku container:push web --arg RAILS_MASTER_KEY=xxxSecret123` to pass master.key.

After that `heroku container:release web` to deploy.

# buildx

docker buildx create --name amdbuilder   
docker buildx ls    
docker buildx use amdbuilder     
docker buildx build --platform linux/arm64,linux/amd64 --push -t florianfahrenholz/eatviet:latest . --build-arg RAILS_MASTER_KEY=5163a2b08e128e104b9a1f295e813df3

