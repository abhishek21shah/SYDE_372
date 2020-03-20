function [mean1, mean2, var1, var2] = OneD_paraGaus(data)

mean_1 = 0;
mean_2 = 0;
var1 = 0;
var2 = 0;

for x = 1:length(data.a)
    mean_1 = mean_1 + data.a(x);
end
mean1 = mean_1/length(data.a);

for xv = 1:length(data.a)
    var1 = var1 + (data.a(xv) - mean1)^2;
end
var1 = var1/(length(data.a));

for y = 1:length(data.b)
    mean_2 = mean_2 + data.b(y);
end
mean2 = mean_2/length(data.b);

for yv = 1:length(data.b)
    var2 = var2 + (data.b(yv) - mean2)^2;
end
var2 = var2/(length(data.b));

end