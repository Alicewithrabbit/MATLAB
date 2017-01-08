function route = routeupdate(old_route,method)
%ROUTE:update the route with different methods
% route = PERTURB(route_old, method) generate randomly a neighbouring route by
% perturb old route. perturb methods:
%                        ___________            ___________         
%     1. reverse:   [1 2 3 4 5 6 7 8 9] -> [1 2 8 7 6 5 4 3 9]
%                        _         _            _         _
%     2. swap:      [1 2 3 4 5 6 7 8 9] -> [1 2 8 4 5 6 7 3 9]
route=old_route;
%select the city to exchange
city_1 = ceil(length(route)*rand);
city_2 = ceil(length(route)*rand);

%select the exchange method
switch(method)
    case 1
        route([city_1,city_2]) = route([city_2,city_1]);
    case 2
        city_min = min(city_1,city_2);
        city_max = max(city_1,city_2);
        route(city_min:city_max) = route(city_max:-1:city_min);
end
end