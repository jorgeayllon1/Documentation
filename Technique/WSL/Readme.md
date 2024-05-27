# Installation personnelle d'une wsl Alma Linux 9
1. Installer AlmaLinux Linux 9.
2. Placer le fichier de configuration wsl.
```sh
./configure-wsl-alma 1 (Unix user name)
```
Redémarrer la wsl pour le prendre en compte.
```pwsh
wsl --shutdown
```
3. L'installation se fait en 2 parties.
```sh
./configure-wsl-alma 2
```
Redémarrer le terminal, puis :
```sh
./configure-wsl-alma 3
```