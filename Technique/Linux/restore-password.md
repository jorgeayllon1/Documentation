# Tutoriel
Tutoriel pour changer le mot de passe root d'une machine linux.  
Pour ce tutoriel, il faut avoir l'accès au grub.  
Il laisse une marque dans la machine.
# Changement du mot de passe
## Etape 1
Ajouter dans le boot process la valeur :
```
**rd.break** et **enforcing=0**
```
Lancer le boot process, vous arrivez dans un context de ram ou en emergency mode.  
## Etape 2
Remonter le système de fichier en rw et accéder au contexte du filesystem.
```
switch_root:/# mount -o remount,rw /sysroot
switch_root:/# chroot /sysroot
```
## Etape 3
Changer le mot de passe de root.  
Vous pouvez aussi changer le mot de passe de n'importe quel utilisateur.  
```
sh-4.4# passwd
```
# Remise en route de la machine
## Etape 4
Sorter du contexte du filesystem.
```
exit
```
## Etape 5
Remonter le filesystem en ro et continuer le lancement du boot.
```
switch_root:/# mount -o remount,ro /sysroot
switch_root:/# exit
```
## Etape 6
Connectez vous en tant que root.  
Restaurer le contexte du fichier /etc/shadow et le selinux.
```
[root@hostname ~]# restorecon -v /etc/shadow
[root@hostname ~]# setenforce 1
```