# export DEBIAN_FRONTEND=noninteractive
# sudo apt update -y
# sudo debconf-set-selections <<< 'maria-db-server-10.6 mysql-server/root_password password admin'
# sudo debconf-set-selections <<< 'maria-db-server-10.6 mysql-server/root_password_again password admin'
# sudo apt-get install -y mariadb-server-10.6

# sudo debconf-set-selections <<< 'maria-db-server mysql-server/root_password password admin'
# sudo debconf-set-selections <<< 'maria-db-server mysql-server/root_password_again password admin'
# sudo apt-get install -y mariadb-server

wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
sudo apt-get update
sudo apt-cache policy mysql-server
sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*


export DEBIAN_FRONTEND=noninteractive
sudo apt update -y
cat <<EOF > ~/.my.cnf
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4
EOF

sudo tee -a /etc/mysql/my.cnf > /dev/null <<EOF
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4
EOF


# sudo apt install software-properties-common
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
# sudo apt-get install -y mysql-server


sudo apt install -y redis-server


curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install 16
npm install -g yarn


sudo apt install -y python3-pip python3-venv python3-dev
sudo pip install frappe-bench

bench init default-bench
cd default-bench
bench new-site demo.localhost --admin-password admin --mariadb-root-password admin
bench get-app erpnext
bench --site demo.localhost install-app erpnext
