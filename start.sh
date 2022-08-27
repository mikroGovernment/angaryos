apt-get update
apt-get install -y docker.io git

docker swarm init

git clone https://github.com/MikroGovernment/angaryos.git

chmod 777 -R ./angaryos/services/

chmod 600 ./angaryos/services/postgresql/.pgpass
chown 26:26 ./angaryos/services/postgresql/.pgpass

mkdir ./angaryos/services/postgresql/data
chmod 777 -R ./angaryos/services/postgresql/data

docker stack deploy --compose-file ./docker-stack-dev.yml angaryos