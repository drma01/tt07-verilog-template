<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works
Sklop radi tako da se na ulazu dovede 8 bitova, od kojih su 4 prva bita prvi broj, a zadnja 4 bita drugi broj. Sklop na izlazu daje rezultat zbrajanja ta dva dovedena broja na prva četiri izlaza, a na zadnjem izlazu se javlja prijenos ukoliko postoji.

## How to test
Na sklop se dovedu dva broja u binarnom zapisu od po četiri znamenke (ukoliko je riječ o brojevima 4 i 6 onda bi se na ulazu pojavili bitovi 01000110). Na prva četiri izlazna pina ide rezultat zbrajanja (u navedenom primjeru tu je 10, tj. binarno 1010), iduća tri pina su nekorištena te su njihove zadane vrijednosti 0, a zadnji bit je prijenos (koji je u navedenom primjeru 0).

## External hardware

Nema ih.
