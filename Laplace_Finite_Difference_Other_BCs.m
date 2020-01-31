region_size = 50;

BCleft = 1;
BCright = 1;
BCtop = 0;
BCbot = 0;

iterations = 100;

potential = zeros(region_size, region_size);

[X, Y] = meshgrid(1:1:region_size, 1:1:region_size);

figure;

for it = 1:iterations

for i = 1:region_size
    
    for j = 1:region_size
        
        if (i == 1 && j ~= 1 && j ~= region_size)
            
           potential(i, j) = (potential(i + 1, j) + potential(i, j - 1) + potential(i, j + 1) + BCleft)/4;
        
        elseif (i == 1 && j == 1)
            
           potential(i, j) = (potential(i + 1, j) + potential(i, j + 1) + BCleft + BCtop)/4;
           
        elseif (i == 1 && j == region_size)
            
           potential(i, j) = (potential(i + 1, j) + potential(i, j - 1) + BCleft + BCbot)/4; 
           
        elseif(i == region_size && j ~= 1 && j ~= region_size)
            
           potential(i, j) = (potential(i - 1, j) + potential(i, j - 1) + potential(i, j + 1) + BCright)/4;
           
        elseif(i == region_size && j == 1)
            
           potential(i, j) = (potential(i - 1, j) + potential(i, j + 1) + BCright + BCtop)/4;
           
        elseif(i == region_size && j == region_size)
            
           potential(i, j) = (potential(i - 1, j) + potential(i, j - 1) + BCright + BCbot)/4;
           
        elseif(j == 1 && i ~= 1 && i ~= region_size)
            
           potential(i, j) = (potential(i + 1, j) + potential(i - 1, j) + potential(i, j + 1) + BCtop)/4;
           
        elseif(j == region_size && i ~= 1 && i ~= region_size)
            
           potential(i, j) = (potential(i + 1, j) + potential(i - 1, j) + potential(i, j - 1) + BCbot)/4;
           
        else
            
           potential(i, j) = (potential(i + 1, j) + potential(i - 1, j) + potential(i, j - 1) + potential(i, j + 1))/4;
            
        end
        
    end
    
end

surf(potential);
pause(0.001);

end

[dx, dy] = gradient(potential);
quiver(X, Y, -dx, -dy);




