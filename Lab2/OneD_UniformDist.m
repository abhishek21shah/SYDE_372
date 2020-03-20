function [pdf] = OneD_UniformDist(min_,max_, data)
%ONED_UNIFORMDIST Summary of this function goes here
%   Detailed explanation goes here
for x = 1:length(data)
    pdf(x) = 1/(max_ - min_);
end

