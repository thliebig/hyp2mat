% CSX = hyp_polyvoid(CSX, s)
% Hyperlynx 'POLYVOID' subrecord of 'NET' record. 
% Defines a polygonal hole in a polygon.
% See hyp2mat(1) - convert hyperlynx files to matlab scripts.

% Copyright 2012 Koen De Vleeschauwer.
%
% This file is part of hyp2mat.
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

function CSX = hyp_polyvoid(CSX, s)

  % draw previous polygon, if any
  CSX = hyp_draw_polygon(CSX, s);

  % default values
  if (~isfield(s, 'w'))
    s.w = 0;
  end
  s.polytype = 'polyvoid';

  % look up polygon with same id
  s.l = '';
  % look up layer
  for j = 1:length(CSX.poly_list)
    if (strcmp(CSX.poly_list{j}.id, s.id))
      % inherit layer and width from parent
      s.l = CSX.poly_list{j}.l;
      s.w = CSX.poly_list{j}.w;
    end
  end
  
  % check layer found
  if (strcmp(s.l, ''))
    disp('error: polyvoid unknown id');
  end

  % store current polyvoid
  CSX.poly = s;
  CSX.poly.points = [ ] ;
  CSX.poly.points(1,1) = s.x;
  CSX.poly.points(2,1) = s.y;

end

% not truncated
