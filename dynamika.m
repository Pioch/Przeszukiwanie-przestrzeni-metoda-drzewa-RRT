function wy = dynamika(we)

global zeta1 zeta2 zeta3 zeta4 zeta5 zeta6 zeta7 zeta8

T = we(1);
theta = we(2);
t = we(3);
x = we(4);
y = we(5);
psi = we(6);
u = we(7);
v = we(8);
r = we(9);
%
% if abs(u) >= 1
%     u  = sign(u)*1;
% end
%
% if abs(v) >= 1
%     v  = sign(v)*1;
% end
%
% if abs(r) >= 6
%     r  = sign(r)*6;
% end

% R = [y(4) y(6); y(5) y(7)];
R = [cos(psi) -sin(psi); sin(psi) cos(psi)];

u_prim = zeta1 * sign(u) - zeta2 * u + zeta7 * T * cos(theta) + v * r;
v_prim = zeta3 * sign(v) - zeta4 * v + zeta7 * T * sin(theta) - u * r;
r_prim = zeta5 * sign(r) - zeta6 * r - zeta8 * T * sin(theta);


p_prim = R*[u; v];
psi_d = r;
% R_prim = rotacja_prim(R, r);
% p_prim = predkosc(u, v, R_prim);
%
%
% R_prim1 = R_prim(1);
% R_prim2 = R_prim(2);
% R_prim3 = R_prim(3);
% R_prim4 = R_prim(4);

wy = [p_prim; psi_d; u_prim; v_prim; r_prim];
end