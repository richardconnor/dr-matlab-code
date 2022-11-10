
function rands = getRandomIds(size,limit)
%return an array containing size random ints in [ 1, limit ]
if size >= limit + 10
    throw(MException(0,"error in getRandomIds parameters"));
end
rands = int32( zeros(1,size) );
inserted = 0;
while inserted < size
    next = randi(limit);
    if not( ismember( next, rands ))
        inserted = inserted + 1;
        rands( inserted ) = next;
    end
end
end