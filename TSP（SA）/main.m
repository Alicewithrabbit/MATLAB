%America TSP SA 
%@Author:alicewitherabbit
%Email:imroxaswc@gmail.com
%release date:2016/9/6

%init the data
close all
INIT;

%plot the city position
plot_city(city)

%get the distancematrix
dm = distancematrix(city);

%configure the settings
start_temperature = 10000;
rate_of_cooling = 0.94;
Iteration_flag = 1;
temperature_flag = 1;
plot_flag=1;

%use the randperm to get the initial route
route = randperm(length(city));

%get the the total distance of the initial route
previous_distance = totaldistance(route,dm);


temperature=start_temperature;

%plot the initial route
plotroute(city, route, previous_distance, temperature)

while temperature > 1
    
    %update the route
    new_route = routeupdate(route,2);
    
    %compute the new distance
    current_distance = totaldistance(new_route,dm);
    
    %compute the diff of the distance
    diff_distance = current_distance - previous_distance;
    
    if(diff_distance < 0  || (rand < exp(-diff_distance/(temperature))))
        
        %accept new route
        route = new_route;         
        previous_distance = current_distance;
        
        % update iterations flag
        temperature_flag = temperature_flag + 1;
        plot_flag = plot_flag + 1;
        Iteration_flag = Iteration_flag + 1;
        
    end
    
     % reduce the temperature every 100 iterations
    if temperature_flag >= 100
       temperature = rate_of_cooling*temperature;
       temperature_flag = 0;
    end
    
    %  plot the current route every 200 iterations
    if plot_flag >= 200
       plotroute(city, route, previous_distance,temperature);
       plot_flag = 0;
    end
end

% plot the final solution
plotroute(city, route, previous_distance,temperature);