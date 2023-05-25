#!/bin/sh

if [ -d "work" ]; then
  sudo rm -fr work
fi

echo "Create database volume..."
mkdir -p work/data
sudo chcon -Rt container_file_t work
podman unshare chown -R 27:27 work



# TODO Add podman run for mysql image here
podman run -d --name mysql -p 30306:3306 -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=r00tpa55 -v $PWD/work/data:/var/lib/mysql/data:Z registry.redhat.io/rhel8/mysql-80:1

sleep 9

# TODO Add podman run for todonodejs image here
podman run -d --name todoapi -p 30080:30080 -e MYSQL_DATABASE=items -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 localhost/do180/todonodejs

