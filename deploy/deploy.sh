echo "copy docker-compose file"
if [[ "$ENV" == "develop" ]]; then
  echo "SENTRY_DSN=$SENTRY_DSN_DEVELOP" >> .env
  scp $SSH_OPT ./docker-compose.stage.yml $1@$2:/data/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/docker-compose.yml;
elif [[ "$ENV" == "master" ]]; then
  echo "SENTRY_DSN=$SENTRY_DSN_MASTER" >> .env
  scp $SSH_OPT ./docker-compose.master.yml $1@$2:/data/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/docker-compose.yml;
fi

echo "copy .env file"
scp ./.env $1@$2:/data/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/.env


echo "pull images"
ssh $1@$2 "cd /data/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/ && docker-compose pull"


echo "migrate..."
ssh $1@$2 "cd /data/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/ && docker-compose run --rm server bash -c \"python manage.py migrate --noinput\""


echo "start services"
ssh $1@$2 "cd /data/$CI_PROJECT_NAMESPACE/$CI_PROJECT_NAME/ && docker-compose up -d"


echo "remove none docker images"
ssh $1@$2 'docker image prune -a -f'