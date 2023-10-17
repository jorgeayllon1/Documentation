# Units
Il existe 4 types de units :
- **Socket** : Ne démarre pas de deamon, peut être utile pour enclencher une action lors de son utilisation
- **Service** : Garantie l'execution d'une tâche
- **Timer** : Utilisé pour la gestion du temps
- **Target** : Utile pour lancer des process dans un certain ordre

## Localisation des units
Par default : ``/usr/lib/systemd/system``
Customiser : ``/etc/systemd/system``

## Commandes pour les units
Afficher : ``systemctl cat atd``
Modifier : ``systemctl edit atd``
Masquer : ``systemctl mask atd``