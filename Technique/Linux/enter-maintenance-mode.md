# Forçage de la maintenance sur Linux
Pour ce tutoriel, il faut avoir l'accès au grub.  
## Etape 1
Interrompez le démarrage du système puis éditez le grub.
Ajoutez une interruption du système avant la fonction "initrd":
```sh
rd.break
```
Puis lancer **Ctrl+X**.  
Le boot process est lancé, vous arrivez dans un contexte de ram ou en emergency mode.  
## Etape 2
Remontez le système de fichier en read-write.
```
switch_root# mount -o remount,rw /sysroot
switch_root# chroot /sysroot
```
## Etape 3
Vous avez un accès total root sur la machine, faite l'opération de maintenance.
## Etape 4
Une fois terminé, crée le fichier pour lancer un nouvel étiquetage SELinux.
```
sh# touch /.autorelabel
sh# exit
switch_root# exit
```
Ensuite la machine va terminer son démarrage.
