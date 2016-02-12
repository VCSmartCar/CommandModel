function [ new_dist_min ] = disteusq_min( input1, input2, dist_min )
%DISTEUSQ_MIN Summary of this function goes here
%   Detailed explanation goes here
new_dist_min = 0;
for i = 1:length(input1)
    new_dist_min = new_dist_min + (input1(i) - input2(i))^2;
    if (new_dist_min >= dist_min)
        new_dist_min = dist_min;
        return;
    end
end

