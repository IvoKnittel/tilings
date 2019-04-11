function test_empty_box_tiling()
addpath('C:\Users\IvoKn\time_series_management_system\log');
fighandle = 8;
figure(fighandle);cla; hold on;axis equal

box_size=[45 67];

partition_x = get_fuzzy_distance(box_size(1),false);
partition_y = get_fuzzy_distance(box_size(2),true);

tiling_plot(partition_x, partition_y);
tile_plot(partition_x, 'r');
hallo=1;
%get_empty_box_tiling(size, boxes)