global A1 A2 B1 B2 C1 C2 D1 D2 xMin yMin xMax yMax

plot(A1, A2)
hold on;
plot(B1,B2)
hold on;
plot(C1, C2)
hold on;
plot(D1, D2)

xlim([xMin; xMax]);
ylim([yMin; yMax]);