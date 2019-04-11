function tile_plot(archive, colorstr)
% plots an array of tiles one after one
% ----------------------------------------------
% INPUTS:
% archivex     ... (1,m) array of item type
% archivey     ... (1,m) array of item type
% OUTPUTS:
% ----------------------------------------------
% Ivo Knittel 2019 Copyright all rights reserved

if isempty(archive)
  return
end
archive = archive(logical([archive.used]));

if isempty(archive)
  return
end

position = [archive.position];
box_sizes = [archive.box_size];
len = length(archive);
for j=1:len
    range_x  = [-box_sizes(1,j); box_sizes(1,j)]/2;
    range_y  = [-box_sizes(2,j); box_sizes(2,j)]/2;
    lower_left  =  [ range_x(1) + position(1,j); range_y(1) + position(2,j)];
    lower_right =  [ range_x(2) + position(1,j); range_y(1) + position(2,j)];
    upper_left  =  [ range_x(1) + position(1,j); range_y(2) + position(2,j)];
    upper_right =  [ range_x(2) + position(1,j); range_y(2) + position(2,j)];
    left_edge   = [[lower_left(1) upper_left(1)]; [lower_left(2) upper_left(2)]];
    right_edge  = [[lower_right(1) upper_right(1)]; [lower_right(2) upper_right(2)]];    
    lower_edge  = [[lower_left(1) lower_right(1)]; [lower_left(2) lower_right(2)]];    
    upper_edge  = [[upper_left(1) upper_right(1)]; [upper_left(2) upper_right(2)]];
    edges={left_edge, right_edge, lower_edge, upper_edge};
    for k=1:4
        edge = edges{k};
        plot(edge(1,:),edge(2,:),colorstr);
    end
end
