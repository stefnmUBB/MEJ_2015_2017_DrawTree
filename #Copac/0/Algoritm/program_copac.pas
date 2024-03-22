uses pentru_copac;
begin

sterge_tot;
scrie('Apasa tasta X pentru a inchide');

repeat

deschide_fisierul('copac1.txt');

deseneaza_copacul;

inchide_fisierul;

asteapta(50);



deschide_fisierul('copac2.txt');

deseneaza_copacul;

inchide_fisierul;

asteapta(50);



deschide_fisierul('copac3.txt');

deseneaza_copacul;

inchide_fisierul;

asteapta(50);



deschide_fisierul('copac4.txt');

deseneaza_copacul;

inchide_fisierul;

asteapta(50);

until este_apasata_tasta_X;

end.
