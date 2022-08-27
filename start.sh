apt-get update
apt-get install -y docker.io git

docker swarm init

git clone https://github.com/MikroGovernment/angaryos.git

cd angaryos/

chmod 777 -R ./services/
chmod 777 -R angaryos/services/ftpserver/

chmod 600 ./services/postgresql/.pgpass
chown 26:26 ./services/postgresql/.pgpass

mkdir ./services/postgresql/data
chmod 777 -R ./services/postgresql/data

docker stack deploy --compose-file ./docker-stack-dev.yml angaryos