# dotfiles

Use [`yadm`](https://yadm.io) for installation.

## Quick Install

```sh
curl -s https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/yadm \
    | bash -s clone https://github.com/erning/dotfiles.git --bootstrap
```
or you have `yadm` installed alreay
```sh
yadm clone https://github.com/erning/dotfiles.git --bootstrap
```

## Securing sensitive data

```sh
# decrypt
gpg -o $SENSITIVE_FILE -d {$SENSITIVE_FILE}.asc

# encrypt
gpg -ase -r zhang@erning.com $SENSITIVE_FILE

# encryption only with symmetric cipher
gpg -asc $SENSITIVE_FILE
```

