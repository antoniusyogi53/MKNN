function [weight] = hitung_weight(KTest, KTrain, validitas, distance)
[readlinetest,~] = size(KTest);
[readlinetrain,~] = size(KTrain);

for i = 1:readlinetest
    for k = 1:readlinetrain
        weight(k,i) = ((validitas(k,1))*(1/(distance(k,i)+0.5)));
    end
end
end