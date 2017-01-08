function h = plot_city(city)
% PLOTCITIES
% h = PLOTCITIES(province, border, city) draw the map of America, and return 
% the route handle.

global h;

h = plot(NaN, NaN, 'b-', 'linewidth', 1);

% plot cities as green dots
plot(city(2:end,1), city(2:end,2), 'o', 'markersize', 3, ...
                              'MarkerEdgeColor','b','MarkerFaceColor','g');
% plot Beijing as a red pentagram
plot(city(1,1),city(1,2),'p','markersize',6, ...
                              'MarkerEdgeColor','k','MarkerFaceColor','g');
