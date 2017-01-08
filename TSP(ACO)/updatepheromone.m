function pheromone = updatepheromone(city,ant,pheromone,rho,delta)
%UPDATE THE PHEROMONE MATRIX
len = length(city);
len1 = ant;
for i = 1:1:len
    for j = 1:1:len
        pheromone(i,j) = pheromone(i,j)*(1 - rho);
    end
end
for i = 1:1:len
    for j = 1:1:len
        for k = 1:1:len1
             pheromone(i,j) = pheromone(i,j) + delta(i,j,k);
        end
    end
end
end