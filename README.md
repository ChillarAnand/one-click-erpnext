## One Click ERPNext


### With Docker

Ensure Docker installed.

```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
dockerd-rootless-setuptool.sh install
```

Install ERPNext on your Linux server with just a single command.

```shell
$ git clone https://github.com/chillarAnand/one-click-erpnext
$ cd one-click-erpnext && docker-compose up
```


### Without Docker

```
export DEBIAN_FRONTEND=noninteractive
sudo apt update -y
sudo apt-get install -y mysql-server
sudo mysql_secure_installation

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

sudo systemctl mysql restart


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

```