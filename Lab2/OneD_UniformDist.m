function [pdf] = OneD_UniformDist(min_,max_, data)

for x = 1:length(data)
    pdf(x) = 1/(max_ - min_);
end

