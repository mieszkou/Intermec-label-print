# Intermec PC23d

## Przygotowanie drukarki

Przy pierwszy uruchomieniu:

- Wybieramy język `English`
- Command Language `Fingerprint`
- Run other wizards - `NO`

Dalsza konfiguracja:

- Settings
  - System Settings
    - General
      - (...)
      - Time - ustaw czas
      - Date - ustaw datę
      - (...)
      - Unit of Measure - ustaw jednostkę na `mm`
    - Manage I/O
      - Virtual COM - ustaw `Enable`
  - Printing
    - Media
      - (...)
      - Media Width - ustaw szerokość `35mm`
      - Media Length - ustaw długość `25.25` - domyślna wartość jest ok
      - (...)
      - Media Calibration Mode - ustaw `Fast` (tu nie jestem do końca pewien jak to działa)
      - (...)
      - Power Up Action - ustaw `No Action`

Następnie restartujemy drukarkę.

Po ponownym uruchomieniu w systemie powinien być widoczny port COM.
Łączym się z drukarką np. przez `putty` (prędkość 115200).

W oknie puuty wklejamy zawartość pliku [etykieta_35x25.PRG](etykieta_35x25.PRG).
Jeśli wszystko poszło ok drukark zrestartuje się i po restarcie powinna wczytać aplikację.
