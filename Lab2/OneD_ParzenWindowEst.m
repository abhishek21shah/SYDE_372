function [pdf] = OneD_ParzenWindowEst(std_dev, data, xA)

var = std_dev^2;

for y = 1:length(xA)
    sum = 0;
    for x = 1:length(data)
        sum = sum + 1/sqrt(2*pi*var)*exp(((data(x)-xA(y))^2)/(-2*var));
    end
    pdf(y) = sum/length(data);
end

end

