function meanClass= meanCalc(class) 
meanX= mean(class(:,1)); 
meanY= mean(class(:,2)); 
meanClass= [meanX; meanY]; 
end
