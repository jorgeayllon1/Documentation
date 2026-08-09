# Debug

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

## Check printer config and logs

```sh
less /etc/cups/printers.conf
tail -f /var/log/cups/*_log
```
