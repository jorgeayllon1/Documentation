# Installation personnelle d'une wsl
1. Installer AlmaLinux
2. Placer le fichier de configuration wsl.
```sh
./configure-wsl.sh 1 (Unix user name)
```
Redémarrer la wsl pour le prendre en compte.
```pwsh
wsl --shutdown
```
3. L'installation se fait en 2 parties.
```sh
./configure-wsl.sh 2
```
Redémarrer le terminal, puis :
```sh
./configure-wsl.sh 3
```