# Tutoriel
Tutoriel pour changer le mot de passe root d'une machine linux.  
Pour ce tutoriel, il faut avoir l'accès au grub.  
Il laisse une marque dans la machine.
# Changement du mot de passe
## Etape 1
Interrompez le lancement du boot et désactivez le SELinux :
```
**rd.break** et **enforcing=0**
```
Lancez le boot process, vous arrivez dans un context de ram ou en emergency mode.  
## Etape 2
Remontez le système de fichier en read-write et accédez au contexte du filesystem.
```
switch_root:/# mount -o remount,rw /sysroot
switch_root:/# chroot /sysroot
```
## Etape 3
Changez le mot de passe de root.  
Vous pouvez aussi changez le mot de passe de n'importe quel utilisateur présent sur la machine.  
```
sh-4.4# passwd
```
# Remise en route de la machine
## Etape 4
Sortez du contexte du filesystem.
```
exit
```
## Etape 5
Remontez le filesystem en read-only et continuez le lancement du boot.
```
switch_root:/# mount -o remount,ro /sysroot
switch_root:/# exit
```
## Etape 6
Connectez vous en tant que root.  
Restaurez le contexte du fichier /etc/shadow et le SELinux.
```
[root@hostname ~]# restorecon -v /etc/shadow
[root@hostname ~]# setenforce 1
```