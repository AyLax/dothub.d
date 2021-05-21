# Install BCM.hcd to fix bluetooth not found

```sh
dmesg | grep -i blue
# ....
# .. Patch brcm/BCM.hcd not found
# ....
# hci0 command 0x1003 tx timeout
```

# Download $repo/brcm/BCM43142A0-105b-e065.hcd
[BCM.hcd](https://github.com/winterheart/broadcom-bt-firmware)

```sh
sudo mv BCM43142A0-105b-e065.hcd /lib/firmware/brcm/
reboot
```

