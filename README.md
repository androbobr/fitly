# 💪 Fitly – Health & Fitness Tracker

**Fitly** je preprosta, pregledna in funkcionalna spletna aplikacija za sledenje napredku pri vadbi in telesni teži. Uporabnikom omogoča beleženje opravljenih vaj, vnos teže, urejanje profila ter pregled napredka skozi čas. Namenjena je učni uporabi in je bila razvita kot projekt za 4. predmet poklicne mature.

## 🚀 Funkcionalnosti

- ✅ Registracija in prijava uporabnika
- ✅ Urejanje osebnih podatkov (ime, starost, višina, profilna slika)
- ✅ Vnos in beleženje telesne teže
- ✅ Dodajanje in beleženje vaj (seti, ponovitve, kilaža)
- ✅ Pregled opravljenih vaj z možnostjo brisanja
- ✅ Prikaz napredka preko grafa (Chart.js)
- ✅ Prijazna uporabniška izkušnja z modernim izgledom

## 🧰 Tehnologije

| Sloj       | Tehnologije                 |
|------------|-----------------------------|
| **Front-end** | HTML, CSS, JavaScript, Chart.js |
| **Back-end**  | PHP                        |
| **Podatkovna baza** | MySQL (phpMyAdmin)       |
| **Lokalni strežnik** | XAMPP (Apache + MySQL)    |

## 📁 Struktura projekta

```
matura4/
├── belezi_vajo.php
├── pregled_vaj.php
├── teza.php
├── dashboard.php
├── login.php
├── logout.php
├── profil.php
├── css/
│ └── StranCSS.css
├── slike/
│ └── slike vaj + logotip
├── uploads/
│ └── profilne slike
└── db/
└── MySQL baze in tabele
```


## 🛠️ Namestitev

1. Prenesi XAMPP in ga zaženi.
2. Datoteko projekta (mapo `matura4`) kopiraj v `htdocs`.
3. Zaženi **Apache** in **MySQL** v XAMPP nadzorni plošči.
4. Odpri `phpMyAdmin` in uvozi bazo `fitness_tracker.sql`.
5. Odpri spletni brskalnik in obišči:
http://localhost/matura4/login.php


## 🗄️ Tabele v bazi

- `uporabniki` – podatki o uporabniku (ime, geslo, email, avatar itd.)
- `vaje` – podatki o vajah (ime, opis, slika)
- `izvedene_vaje` – povezava uporabnika z vajami, ki jih je opravil
- `teza` – zapis zgodovine uporabnikove teže

## 🧪 Testni uporabnik

- Uporabniško ime: test

- Geslo: test123


## ✨ Vizualni izgled

Aplikacija uporablja zamegljeno (blur) ozadje, zaobljene robove, animirane gumbe in dinamično posodobljene sezname ter grafikone za analizo napredka.

## 👨‍🏫 Zahvala

Posebna zahvala mentorju **Jerneju Kastelicu** za podporo, svetovanje in pomoč pri razvoju aplikacije.

## 📜 Licenca

Ta projekt je namenjen učnim namenom in ni komercialno distribuiran. Vse uporabljene slike so pridobljene s Pexels (brezplačne za uporabo).


