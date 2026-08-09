# Config a printer

## Search printer
```sh
ippfind
```

## Add printer
```sh
lpadmin -p MY-PRINTER -E -v ipp://192.168.1.X/ipp/print -m everywhere
systemctl restart cups
```

## Remove printer
```sh
lpadmin -x PRINTER
```

## List currents jobs (started just from the local machine)
```sh
lpq -a
```

## Remove currents jobs
```sh
cancel -a
```

## Check printer config and logs

```sh
less /etc/cups/printers.conf
tail -f /var/log/cups/*_log
```

# Config a scanner

## Search scanner
```sh
scanimage -L
```

## Edit /etc/sane.d/airscan.conf
```conf
[devices]
"My Scanner" = http://192.168.1.X:8080/eSCL/
```
#### Nothing to reload or restart


## Start scan
```sh
scanimage -d "airscan:e0:My Scanner" --format=pdf -o result-test.pdf
```