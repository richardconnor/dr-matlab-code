function d = euc(ZI,ZJ)
% ZI is a row vector representing a euclidean coordinate, ZJ is a matrix
% where each row represents a euclidean coordinate of the same dimension
% as Z1, the result is a column vector where each row is the Euclidean
% distance between ZI and the corresponding row of ZJ

diff = ZJ - ZI;
diff = diff .* diff;
d = sqrt(sum(diff,2));

end