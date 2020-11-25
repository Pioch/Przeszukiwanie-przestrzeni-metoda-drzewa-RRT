for n = 1:length(indeksy_poczatkowe)
    
    punkty_poczatkowe(n,:) = tablica_wynik(indeksy_poczatkowe(n),:);
    
    
end

for n = 1:length(indeksy_koncowe)
    
    punkty_koncowe(n,:) = tablica_wynik(indeksy_koncowe(n),:);
    
    
end

p = 1;
nowy_ind_koncowy(p) = indeksy_koncowe(length(indeksy_koncowe));
nowy_ind_poczatkowy(p) = indeksy_poczatkowe(length(indeksy_poczatkowe));
nowy_punkt_koncowy = tablica_wynik(nowy_ind_poczatkowy(p),:);

while nowy_punkt_koncowy ~= tablica_wynik(1,:)

    fin = find(punkty_koncowe(:,1) == nowy_punkt_koncowy(1) & punkty_koncowe(:,2) == nowy_punkt_koncowy(2) & punkty_koncowe(:,3) == nowy_punkt_koncowy(3) & punkty_koncowe(:,4) == nowy_punkt_koncowy(4) & punkty_koncowe(:,5) == nowy_punkt_koncowy(5) & punkty_koncowe(:,6) == nowy_punkt_koncowy(6));

    nowy_ind_koncowy(p+1) = indeksy_koncowe(fin);

    for n = 1:length(indeksy_poczatkowe)
    
        if indeksy_poczatkowe(n) < nowy_ind_koncowy(p+1)
        
            roznica(n) = nowy_ind_koncowy(p+1) - indeksy_poczatkowe(n);
        else
            roznica(n) = inf;
        
        end
    
    end

    min_roznica  = min(roznica);
    nowy_ind_poczatkowy(p+1) = nowy_ind_koncowy(p+1) - min_roznica;
    nowy_punkt_koncowy = tablica_wynik(nowy_ind_poczatkowy(p+1),:);
    
    p = p + 1;

end
