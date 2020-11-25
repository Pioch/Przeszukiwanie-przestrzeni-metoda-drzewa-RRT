figure;
rysowanie_przeszkod

for n = length(nowy_ind_poczatkowy):-1:1
    
    plot(tablica_wynik(nowy_ind_poczatkowy(n):nowy_ind_koncowy(n),1), tablica_wynik(nowy_ind_poczatkowy(n):nowy_ind_koncowy(n),2))
    hold on;
    
end
