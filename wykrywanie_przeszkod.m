function wy = wykrywanie_przeszkod(we)

global s

wykryto = 0;

x0 = we(1);
y0 = we(2);
x = we(3);
y = we(4);

% field_numbers = numel(fieldnames(s)); %liczba pol w strukturze

names = fieldnames(s); %nazwy
% name_values = getfield(s, names{1}); %wartosci kazdej nazwy w strukturze

for n = 1:2:length(names)
    
    val_x = getfield(s, names{n});
    val_y = getfield(s, names{n+1});
    
    for l = 1:length(val_x)-1
        
        if (val_x(l) == val_x(l+1)) && y >= min(val_y(l), val_y(l+1)) && y <= max(val_y(l), val_y(l+1))
            
            if (x0 <= val_x(l) && x >= val_x(l)) || (x0 >= val_x(l) && x <= val_x(l))
                
                wykryto = 1;
                break;
                %                 [val_x(l) val_x(l+1); val_y(l) val_y(l+1)];
                
            end
            
        end
        
        if (val_y(l) == val_y(l+1)) && x >= min(val_x(l), val_x(l+1)) && x <= max(val_x(l), val_x(l+1))
            
            if (y0 <= val_y(l) && y >= val_y(l)) || (y0 >= val_y(l) && y <= val_y(l))
                
                wykryto = 1;
                break;
                %                 [val_x(l) val_x(l+1); val_y(l) val_y(l+1)];
                
            end
            
        end
        
        
        if val_y(l) ~= val_y(l+1)
            
            a = (val_y(l+1) - val_y(l))/(val_x(l+1) - val_x(l));
            b = val_y(l) - a*val_x(l);
            
            if a*x0 + b - y0 <= 0 && a*x + b - y >= 0 && (x >= min(val_x(l), val_x(l+1)) && x <= max(val_x(l), val_x(l+1))) && (y >= min(val_y(l), val_y(l+1)) && y <= max(val_y(l), val_y(l+1)))
                
                wykryto = 1;
                break;
                %                  [val_x(l) val_x(l+1); val_y(l) val_y(l+1)];
                
            end
            
            if a*x0 + b - y0 >= 0 && a*x + b - y <= 0 && (x >= min(val_x(l), val_x(l+1)) && x <= max(val_x(l), val_x(l+1))) && (y >= min(val_y(l), val_y(l+1)) && y <= max(val_y(l), val_y(l+1)))
                
                wykryto = 1;
                break;
                %                  [val_x(l) val_x(l+1); val_y(l) val_y(l+1)];
                
            end
            
        end
        
    end
    
    
end

wy = wykryto;

end