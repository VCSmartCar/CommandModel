function [index ] = find_nearest( input,  arr )
%FIND_NEAREST Summary of this function goes here
%找出arr中与input的值最相近的元素的索引
len = length(arr);
head = 1;
tail = len;

min = inf;
record = -1;
while head <= tail
    mid = floor((head + tail) / 2);
    sub = arr(mid) - input;
    if (sub > 0)
        tail = mid - 1;
    elseif (sub < 0)
        head = mid + 1;
    else
        index = mid;
        return;
    end
    if (abs(sub) < min)
        min = abs(sub);
        record = mid;
    end
end
index = record;
end

