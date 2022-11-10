
function D2 = zen( ZI, ZJ )

diffs = ZJ(:,1:end-1) - ZI(:,1:end-1);
diffs = diffs .^ 2;

lasts = ZJ(:,end) .^ 2 + ZI(end) .^ 2;

D2 =  sqrt(sum(diffs,2) + lasts);

end
