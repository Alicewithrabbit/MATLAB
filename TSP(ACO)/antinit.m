function startcity = antinit(ant,city)
%INIT THE STARTCITY MATRIX
startcity = [];
for i = 1:ant
    startcity(i) =  ceil(rand*length(city));
end
end