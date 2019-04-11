function tiling_plot(archivex, archivey)
% plots a tiling partition without any data (so far 1D only) 
% ----------------------------------------------
% INPUTS:
% archivex     ... (1,m) array of item type
% archivey     ... (1,m) array of item type
% OUTPUTS:
% ----------------------------------------------
% Ivo Knittel 2019 Copyright all rights reserved

if isempty(archivex)||isempty(archivey)
  return
end
archive_usedx = archivex(logical([archivex.used]));
archive_usedy = archivey(logical([archivey.used]));
if isempty(archive_usedx) || isempty(archive_usedy) 
  return
end

[pltx, ptsx]= get_plot_points1d(archive_usedx);
[~, ptsy]= get_plot_points1d(archive_usedy);
colorstr='k';
heights = diff([0 ptsy]);
offsets = [0 ptsy];
for j=1:length(ptsy)
    len=length(ptsx);
    plty = reshape([zeros(1,len); heights(j)*ones(1,len); NaN(1,len)],1,3*len) +offsets(j);
    plot(pltx,plty, colorstr);
    plot([ptsx(1) ptsx(end)], offsets(j)*[1 1], colorstr);
    plot([ptsx(1) ptsx(end)], offsets(j)*[1 1]+heights(j), colorstr);
end
function [plt, pts]= get_plot_points1d(archive)
positions = [archive.position];
[x_positions, sort_idx] = sort(positions(1,:));
box_sizes = [archive.box_size];
ranges= [-box_sizes(1,:)/2; box_sizes(1,:)/2]; 
ranges = ranges(:, sort_idx);
startpts=ranges(1,:)+x_positions;
endpts=ranges(2,:)+x_positions;
pts = [startpts endpts(end)]; 
plt = reshape([pts; pts; NaN(1,(length(x_positions)+1))],1,3*(length(x_positions)+1));   
