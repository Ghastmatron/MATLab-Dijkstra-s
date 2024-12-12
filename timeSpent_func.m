function[timeSpent] = timeSpent_func(distance);
%the point of this function, is to call it when a speed needs figuring out
if distance <= 5;
    timeSpent = distance/5;
elseif distance >5 && distance <= 10;
    timeSpent = distance/20;
else
    timeSpent = distance/30;
end
end


   
     
       