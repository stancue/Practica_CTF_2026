

# PARTEA 1 — Pregătirea sistemului

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install docker.io git -y
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
reboot
```

După repornire, verifici:
```bash
docker --version
docker run hello-world
git --version
```

# PARTEA 2 — proiectul pe disc

```bash
cd ~/Documents
unzip proiect-stagiu.zip
cd proiect-stagiu
chmod +x scripts/*.sh
find levels -name "setup.sh" -exec chmod +x {} \;
```

# PARTEA 3 — Construim și pornești mediul

```bash
docker build -t proiect-stagiu:v1 .
docker run -d -p 2220:22 --name proiect-stagiu-live proiect-stagiu:v1
docker ps
ssh m01@localhost -p 2220        # parola: alex
```

Verificare completă:
```bash
docker exec -it proiect-stagiu-live bash /opt/scripts/test_environment.sh
```

## PARTEA 4 — Jurnal

```bash
nano jurnal/ziua_02.md
```

## PARTEA 5 — GitHub

```bash
git init
git config --global user.name "Numele Tau"
git config --global user.email "email@exemplu.com"
git add .
git commit -m "Setup initial + primul build funcțional"
git remote add origin https://github.com/<user-ul-tau>/proiect-stancu.git
git branch -M main
git push -u origin main
```



## Resetare mediu

```bash
docker stop proiect-stagiu-live
docker rm proiect-stagiu-live
docker run -d -p 2220:22 --name proiect-stagiu-live proiect-stagiu:v1
```

