# EatViet
Menu Translations for Vietnamese Restaurants.

## The Problem
If you are travelling in Vietnam, you will notice that a lot of the cheaper, local restaurants don't have english menus. The Vietnamese language is hard to translate using a translation app due to the variety of accent letters.

## The Solution: **EatViet**
Where ever you are, just check on EatViet for restaurants close to your location. The Menus are translated to english by local people who are paid by the ads you see.

<hr>

# Deployment:

Push to heroku containers using: `heroku container:push web --arg RAILS_MASTER_KEY=xxxSecret123` to pass master.key.

After that `heroku container:release web` to deploy.

# buildx

docker buildx create --name amdbuilder   
docker buildx ls    
docker buildx use amdbuilder     
docker buildx build --platform linux/arm64,linux/amd64 --push -t florianfahrenholz/eatviet:latest . --build-arg RAILS_MASTER_KEY=5163a2b08e128e104b9a1f295e813df3

# Local development without Docker:

Start Postgres:
`postgres -D /usr/local/var/postgres`

Start Server:
`bundle exec rails s`
