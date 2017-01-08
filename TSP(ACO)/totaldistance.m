function tdis = totaldistance(route,distance_matrix)
%TOTALDISTANCE=sum(distance(ij))
%break the cycle
tdis = distance_matrix(route(1),route(end));

for i=1:1:length(route)-1
    
    tdis = tdis + distance_matrix(route(i),route(i+1));
    
end