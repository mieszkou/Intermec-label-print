# Standalone Intermec label print

Aplikacja do wgrania na drukarkę etykiet Intermec. Testowana na modelu PC23d, ale powinna działać także na innych.

Pozwala na samodzielną pracę drukarki, bez komputera. Do drukarki musi być podłączona klawiatura np. tylko numeryczna.

## Użycie

Drukarka po włączeniu będzie automatycznie uruchamiać aplikację.

Interfejs prezentuje pytanie o cenę która ma być drukowana.

Użytkownik może:

- wpisać cenę np.: `15` - po naciśnięciu klawisza <kbd>Enter </kbd> wydrukuje się etykieta z podaną ceną
- wpisać <ilość>*`<cena>` np.: `5*15`- po naciśnięciu klawisza<kbd>Enter </kbd> wydrukuje się 5 szt. etykiet z podaną ceną
- wpidać <kbd>/</kbd> i <kbd>Enter</kbd> - zamknięcie aplikacji
- kolejne naciśnięcia klawisza <kbd>Enter</kbd> po wydrukowaniu etykiety powodują powtórzenie wydruku

## Prezentacja video

[![Standalone Intermec label print](https://i3.ytimg.com/vi/xSQjKm4JLUc/hqdefault.jpg)](https://www.youtube.com/watch?v=xSQjKm4JLUc "Standalone Intermec label print")

## Przygotowanie drukarki

Przy pierwszy uruchomieniu:

- Wybieramy język `English`
- Command Language `Fingerprint - YES`
- Run other wizards - `YES`
- Calibration
  - Media
  - Label Taken Sensor
  - Date&Time
    - UTC +1
    - Time zone: `Berlin`
    - DTS Adjust: `Enable`

Dalsza konfiguracja:

- Settings
  - System Settings
    - General
      - (...)
      - Unit of Measure - ustaw jednostkę na `mm`
    - Manage I/O
      - Virtual COM - ustaw `Enable`
  - Printing
    - Media
      - (...)
      - Media Width - ustaw szerokość `35mm`
      - Media Length - ustaw długość `25.50` - domyślna wartość jest ok
      - (...)
      - Print Mode - `Tear Off`
      - (...)
      - Label Rest Adjust (mm) - `3`
      - (...)
      - Media Calibration Mode - ustaw `Fast` (tu nie jestem do końca pewien jak to działa)
      - (...)
      - Power Up Action - ustaw `No Action`

Następnie restartujemy drukarkę.

## Instalacja

Po ponownym uruchomieniu w systemie powinien być widoczny port COM.
Łączym się z drukarką np. przez `putty` (prędkość 115200).

W oknie puuty wklejamy zawartość pliku [etykieta_35x25.PRG](etykieta_35x25.PRG).
Jeśli wszystko poszło ok drukark zrestartuje się i po restarcie powinna wczytać aplikację.

## Konfiguracja vscode

```
"InsertLineNumber.formats": [

    {
      "align": "right",
      "width": "alignToLast"
    },
    {
      "width": "alignToLast"
    },
    {
      "start": "current",
      "align": "right",
      "padding": "zero",
      "width": 3,
      "prefix": "",
      "suffix": " "
    }
  ]
```
