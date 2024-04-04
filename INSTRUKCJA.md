# Standalone Intermec label print

Aplikacja do wgrania na drukarkę etykiet Intermec. Testowana na modelu PC23d, ale powinna działać także na innych.

Pozwala na samodzielną pracę drukarki, bez komputera. Do drukarki musi być podłączona klawiatura np. tylko numeryczna.

## Użycie

Drukarka po włączeniu będzie automatycznie uruchamiać aplikację.

Interfejs prezentuje pytanie o cenę która ma być drukowana (po starcie programu wstępnie jest ustawiona cena 15zł - aby wydrukować wystarczy nacisnąć <kbd>Enter</kbd>).

Użytkownik może:

- **Na klawiaturze USB**
  - wpisać cenę np.: `15` - po naciśnięciu klawisza <kbd>Enter </kbd> wydrukuje się etykieta z podaną ceną (nie trzeba kasować poprzedniej wartośći, można od razy wpisać nową)
  - wpisać <ilość>*`<cena>` np.: `5*15`- po naciśnięciu klawisza<kbd>Enter </kbd> wydrukuje się 5 szt. etykiet z podaną ceną  (nie trzeba kasować poprzedniej wartośći, można od razy wpisać nową)
  - kolejne naciśnięcia klawisza <kbd>Enter</kbd> po wydrukowaniu etykiety powodują powtórzenie ostatniego wydruku (niezależnie od wcześniejszej ilości po <kbd>Enter</kbd> drukuje się 1 szt.)
- **Na drukarce**
  - 🏠 - ustawienia
  - ⬇️ - "szybka" kalibracja drukarki
  - 🔙 - wyjście z aplikacji
  - 🧻 - wysuw etykiety
- Ponowne uruchomienie programu
  - 🏠 -> `Programs` -> `Fingerprint Programs` -> `ETYKNEW.PRG`
