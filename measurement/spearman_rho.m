function rho = spearman_rho(deltas,zetas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% switch the data (probably outcome of pdist) to columns
% and sort on the first column
sorted = sortrows([ deltas' zetas' ]);

%this is not very efficient but proves the point, should
% be (linspace(1,size(deltas,2),size(deltas,2))'
% [dum,zeds] = sortrows( sorted,1 );

% because the zeds are ordered
zeds = (linspace(1,size(deltas,2),size(deltas,2)))';

% now zedhats is the rank order of the second column
[~,zedhats] = sortrows( sorted,2 );

f1 = (zeds - zedhats);
f2 = sum(f1 .* f1);
t = size(deltas,2);

rho =1 -  ((6 * f2) / ( t * t * t - t));
end
