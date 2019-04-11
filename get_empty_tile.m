function [item] = get_empty_tile(type)
% creates empty item of given type
% --------------------------------
% Ivo Knittel 2019 Copyright all rights reserved

% general
item.used=0;
item.position=NaN;
item.box_size=[NaN; NaN];
item.error = Inf;
item.cost  = Inf;
item.type=type;
% specific
switch type
case 'none'
  item.data=[];
case 'mean'
  item.data.mean=NaN;
  item.data.std=NaN;
end