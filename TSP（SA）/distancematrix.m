function dis = distancematrix(city)
% DISTANCEMATRIX
% dis = DISTANCEMATRIX(city) return the distance matrix, dis(i,j) is the 
% distance between city_i and city_j
numberofcities = length(city);
for i = 1:numberofcities
    for j = i+1:numberofcities
        dis(i,j) = distance(city(i,1), city(i,2), ...
                            city(j,1), city(j,2));
        dis(j,i) = dis(i,j);
    end
end