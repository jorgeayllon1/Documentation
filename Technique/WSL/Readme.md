# Installation personnelle d'une wsl
1. Installer AlmaLinux
2. Placer le fichier de configuration wsl.
```
./configure-wsl.sh 1 (Unix user name)
```
Redémarrer la wsl pour le prendre en compte.
```
wsl --shutdown
```

3. L'installation se fait en 2 parties.
```
./configure-wsl.sh 2
```
Redémarrer le terminal, puis :
```
./configure-wsl.sh 3
```