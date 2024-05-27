# Installation personnelle d'une wsl Alma Linux 9
1. Installer AlmaLinux Linux 9.
2. Placer le fichier de configuration wsl.
```sh
./configure-wsl-alma.sh 1 (Unix user name)
```
Redémarrer la wsl pour le prendre en compte.
```pwsh
wsl --shutdown
```
3. L'installation se fait en 2 parties.
```sh
./configure-wsl-alma.sh 2
```
Redémarrer le terminal, puis :
```sh
./configure-wsl-alma.sh 3
```
# Installation personnelle d'une wsl Debian
1. Installer AlmaLinux Linux 9.
```pwsh
wsl --install Debian
```
2. Placer le fichier de configuration wsl.
```sh
./configure-wsl-debian.sh 1
```
Redémarrer la wsl pour le prendre en compte.
```pwsh
wsl --shutdown
```
3. L'installation se fait en 2 parties.
```sh
./configure-wsl-debian.sh 2
```
Redémarrer le terminal, puis :
```sh
./configure-wsl-debian.sh 3
```