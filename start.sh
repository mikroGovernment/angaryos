apt-get update
apt-get install -y docker.io git

docker swarm init

git clone https://github.com/MikroGovernment/angaryos.git

chmod 777 -R ./angaryos/services/

chmod 600 ./angaryos/services/postgresql/.pgpass
chown 26:26 ./angaryos/services/postgresql/.pgpass

mkdir ./angaryos/services/postgresql/data
chmod 777 -R ./angaryos/services/postgresql/data

day=$(date +"%Y-%m-%d")
logfiledaily="./angaryos/services/ftpserver/data/angaryos/logs/laravel-$day.log"
touch $logfiledaily
chmod 777 $logfiledaily

logfile="./angaryos/services/ftpserver/data/angaryos/logs/laravel.log"
touch $logfile
chmod 777 $logfile

docker stack deploy --compose-file ./angaryos/docker-stack-dev.yml angaryos

read -p "Enter new host address (ex: 192.168.3.50, bulut.omersavas.com): "  hostAdress
echo $hostAdress > ./angaryos/.host 
echo 'served at https://'"$hostAdress"'/'

chmod 777 -R ./angaryos/services/ftpserver/data/