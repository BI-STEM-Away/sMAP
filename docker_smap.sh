
sudo apt-get update
sudo apt-get install     ca-certificates     curl     gnupg     lsb-release

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ubuntu

sudo docker info
sudo docker run --rm -d -p 80:80 samuelbharti/smap:latest




