clear all
global kold xMin yMin xMax yMax
kold = 1;
xMin=0; xMax=10;
yMin=0; yMax=10;
Init
tworzenie_przeszkod
rysowanie_przeszkod
N = 3000;
x_end = 9;
y_end = 3;
psi_end = 0;
u_end = 0;
v_end = 0;
r_end = 0;
% tablica = zeros(N,N); %wymiary przestrzeni na której bêd¹ generowane punkty
psiMin = -pi; psiMax = pi;
uMin = 0; uMax = 0.8;
vMin = 0; vMax = 0.8;
rMin = 0; rMax = 6;
p0=[0; 0; 0; 0; 0; 0]; %punkt który przekazujemy do ca³ki
punkt = [0 0 0 0 0 0]; %zapisujemy punkty do których dojecha³
punkty_zerowe= [0 0 0 0 0 0];
indeksy_poczatkowe = [];
indeksy_koncowe = [];
i=1;

tic
% plot( [1,1,3,3,1],[1,2,2,1,1]); %przeszkoda
% hold on
while(i<=N)
    
    a_u1 = -5; %-5
    b_u1 = 5; %5
    
    
    u1 = a_u1 + (b_u1-a_u1)*rand; %T
    
    a_u2 = -pi/3;
    b_u2 = pi/3;
    
    u2 = a_u2 + (b_u2-a_u2)*rand; %theta
    
    a_t = 0.1; %0.1
    b_t = 0.25; %0.3
    t_rand = round(a_t+(b_t-a_t)*rand,2)+a_t; %przedzial [a,b]
    
    los = [p0(1); p0(2); p0(3); p0(4); p0(5); p0(6)];
    
    wynik = round(calki([u1; u2; t_rand; los]), 4);
    punktx = wynik(length(wynik),1);
    punkty = wynik(length(wynik),2); %punkt x i y do których dojecha³
    punktpsi = wynik(length(wynik),3);
    punktu = wynik(length(wynik),4);
    punktv = wynik(length(wynik),5);
    punktr = wynik(length(wynik),6);
    
    a_los_x = 0;
    b_los_x = 10;
    
    los_x = a_los_x + (b_los_x - a_los_x)*rand;
    
    a_los_y = 0;
    b_los_y = 10;
    
    los_y = a_los_y + (b_los_y - a_los_y)*rand;
    
    
    for w = 2:length(wynik)
        
        wykryto = wykrywanie_przeszkod([wynik(w-1,1); wynik(w-1,2); wynik(w,1); wynik(w,2)]);
        if wykryto == 1
            
            break;
            
        end
        
    end
    
    if(punktx<=xMax && punkty<=yMax && punktx>=xMin && punkty>=yMin && wykryto == 0)
        punkty_zerowe = [punkty_zerowe; round(los,4)'];
        punkt = [punkt; wynik(length(wynik),1) wynik(length(wynik),2) wynik(length(wynik),3) wynik(length(wynik),4) wynik(length(wynik),5) wynik(length(wynik),6)]; %dopisanie nowego punktu
        
        for j= 1:i
            odleglosc(j) = sqrt((los_x-punkt(j,1))^2 + (los_y-punkt(j,2))^2); %odleglosc 
        end
        
        [odl, k] = min(odleglosc); %minimalna odleglosc od punktu
        
        
        p0=[punkt(k,1); punkt(k,2); punkt(k,3); punkt(k,4); punkt(k,5); punkt(k,6)]; %zmiana punktu na
        
        if(i == 1)
            tablica_wynik = wynik;
        else
            tablica_wynik = [tablica_wynik; wynik];
        end
        
        indeksy_poczatkowe(i) = length(tablica_wynik) - length(wynik)+1;
        indeksy_koncowe(i) = length(tablica_wynik);
        
%         plot(wynik(:,1), wynik(:,2),'k')
%         hold on;
%         plot(punkt(:,1), punkt(:,2),'r*', 'LineWidth', 0.2)
%         hold on;
% %         plot(los_x, los_y, 'g*', 'LineWidth', 3)
% %         hold on;
%         
%         pause(0.1);
    else
        
        for j= 1:i
            odleglosc(j) = sqrt((los_x-punkt(j,1))^2 + (los_y-punkt(j,2))^2); %odleglosc
        end
        
        [odl, k] = min(odleglosc); %minimalna odleglosc od punktu
        
        p0=[punkt(k,1); punkt(k,2); punkt(k,3); punkt(k,4); punkt(k,5); punkt(k,6)]; %zmiana punktu na
%         
%         punkty_zerowe = [punkty_zerowe; round(los,4)'];
%         
%         if i == 1
%             punkt = [punkt];
%             tablica_wynik = wynik;
%         else
% %             p0 = punkt(i-1,:)';
%             punkt = [punkt];
%         end
        i=i-1;
    end
    
%     if abs(punktx - x_end) <= 0.2 && abs(punkty - y_end)<= 0.2 && abs(punktpsi - psi_end) <= 0.2 && abs(punktu - u_end) <= 0.1 && abs(punktv - v_end) <= 0.1 && abs(punktr - r_end) <= 0.1
%         break;
%     end
    
     if abs(punktx - x_end) <= 0.2 && abs(punkty - y_end)<= 0.1 && abs(punktpsi - psi_end) <= 0.1
        break;
    end
    
    
    i=i+1;
end
time = toc;
% In general, you can generate N random numbers in the interval (a,b) with the formula r = a + (b-a).*rand(N,1).
