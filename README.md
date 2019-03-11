# DBLaTeX magyar kompatibilitás Arch Linux (és más disztrók) + OSX alatt

Mivel volt némi problémám a DBLaTeX "magyarosításával", hogy a lefordított dokumentumok
szebben jelenjenek meg, valamint ne legyenek problémák a karakterkódolással, gondoltam
megosztom a tapasztalataimat. Ezekkel a módosításokkal lényegesen javul a felhasználói
élmény.

Ugyan én személy szerint Arch Linuxot használok, a szkript nagy valószínűséggel működni
fog a többi Arch alapú disztró (Manjaro, Antergos, stb.) alatt is.

# Hogyan futtasd?

```bash
curl https://git.io/fhj4c | sudo bash
sudo ./patch.sh
```

A fenti link csak a https://raw.githubusercontent.com/krook1024/dblatex_hu_on_arch/master/patch.sh rövidítése.

# Kézzel csinálnád?

Ezesetben kérlek olvasd el a [patch-by-hand.md](patch-by-hand.md) dokumentumot.

