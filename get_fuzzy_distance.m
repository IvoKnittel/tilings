function partition = get_fuzzy_distance(partition_length, is_vertical)
% get fuzzy interval partition
% ----------------------------------------------
% INPUTS:
% OUTPUTS:
% ----------------------------------------------
% Ivo Knittel 2019 Copyright all rights reserved
addpath('C:\Users\IvoKn\time_series_management_system\log')
params.size_max    = 25;
params.type        =  'none';

empty_item = log_empty_item('none');

archive_r   = repmat(empty_item,2, params.size_max);
archive_res = repmat(empty_item,2, params.size_max);
archive_r_vec.used = 0;
archive_res_vec.used = 0;
archive_r_vec.data = archive_r;
archive_res_vec.data = archive_res;

new_item    = empty_item;   

new_item.time_range = double([-2^(-1);2^(-1)]);
new_item.used       = 1;
for j= 1:partition_length
    %general
    new_item.time = double(j);
    [archive_r_vec, archive_res_vec] = log_archive_reverse(archive_r_vec, archive_res_vec, new_item, empty_item);
    archive_r = archive_r_vec.data;
    archive_res = archive_res_vec.data;   
    archive_r_used           = archive_r(logical([archive_r.used]));
    archive_res_used         = archive_res(logical([archive_res.used]));
end
archive        = [archive_r_used archive_res_used];
tile_item      = get_empty_tile('none');
tile_item.used = 1;
partition=[];
for j=1:length(archive)
  % general
  tile_item.position = [archive(j).time; 0];
  if is_vertical
     tile_item.box_size = [1;2*archive(j).time_range(2)];
  else
     tile_item.box_size = [2*archive(j).time_range(2);1];
  end
  partition       = [partition tile_item]; 
end

