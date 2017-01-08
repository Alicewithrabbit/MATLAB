%TSP£¨ACO£©
%@Author£ºalicewithrabbit
%email£ºimroxaswc@gmail.com
%release date£º2016/9/8
%init the data
close all
INIT;

%plot the city position
plot_city(city)

%get the distancematrix
dm = distancematrix(city);

%configure the settings
alpha = 3;
beta = 5;
Ant = 30;
rho = 0.95;
Iterations = 150;
Q = 1;
p1 = 0.1;



%init the start settings
lencity = length(city);
delta_pheromone = zeros(lencity,lencity,Ant);
bestroute = [];
route = zeros(1,lencity,Ant);
startcity = [];

pheromone = zeros(lencity,lencity);
pheromone(:,:) = p1;


current_distance = inf;


while Iterations > 1
    
    %init the ants
    total_distance = zeros(1,Ant);
    startcity = antinit(Ant,city);
    allowedCities = zeros(1,lencity,Ant);
    
    %init the allowedcity list
    for i = 1:Ant
        allowedCities(1,:,i) = 1:lencity;
    end
    
    %remove the startcity from the allowedcity list
    for i = 1:Ant
        for j = 1:lencity
            if(startcity(i)==allowedCities(1,j,i))
                allowedCities(1,j,i) = 0;
            end
        end
        route(1,1,i) = startcity(i);        
    end
    
    %update the currentcity
    currentcity = startcity;
    
    
    for i = 1:1:Ant
        
        for j = 1:1:(lencity-1)
            
            %compute the possibility matrix
            sum = 0;
            P = zeros(1,lencity);
            m = size(allowedCities);
            for s = 1:1:m(2)
                if(allowedCities(1,s,i)~=0)
                    sum = sum + pheromone(currentcity(i),allowedCities(1,s,i))^alpha*...
                        (dm(currentcity(i),allowedCities(1,s,i)))^(-beta);
                end
            end
            
            for s = 1:1:lencity
                for t = 1:1:m(2)
                    if(s == allowedCities(1,t,i))
                        P(s) = pheromone(currentcity(i),allowedCities(1,s,i))^alpha*...
                    (dm(currentcity(i),allowedCities(1,s,i)))^(-beta)/sum;          
                    end       
                end    
            end
    
            %select the next city
            pt = rand;
            sum1 = 0;
            ss=1;
            for pp=1:1:lencity
                sum1 = sum1 + P(pp);
                if(sum1 >= pt&&ss==1)
                    selectcity = pp;
                    ss = 0;
                end
            end
            %remove the nextcity from the allowedcity list
            for s = 1:1:length(allowedCities)
                if (allowedCities(1,s,i) == selectcity)
                    allowedCities(1,s,i) = 0;
                end
            end
            
            %update the current city
            currentcity(i) = selectcity;
            route(1,j+1,i) = selectcity;
        end
    end
    
    %compute the totaldistance
    for i = 1:Ant
        for j = 1:lencity    
            total_distance(1, i) = totaldistance(route(1,:,i),dm);
        end
    end
    
    %update the delta pheromone matrix
    for i = 1:Ant
        for j = 1:1:(lencity-1)
            delta_pheromone(route(1,j,i),route(1,j+1,i),i) = Q/total_distance(1, i);
        end   
    end
    
    %update the Iterations
    Iterations = Iterations - 1;
    
    %find the current min route
    [p] = find(total_distance==min(total_distance));
    
    %compare the current min route with previous min route
    if(min(total_distance)<current_distance)
        current_distance = min(total_distance);
        bestroute = route(1,:,p);
        pheromone = updatepheromone(city,Ant,pheromone,rho,delta_pheromone);
    end
    
    %plot the current min route
    plotroute(city, bestroute, current_distance, Iterations);
end

%plot the current min route
plotroute(city, bestroute, current_distance, Iterations)
