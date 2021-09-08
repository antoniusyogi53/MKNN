function [distance] = euclidean_distances(KTrain, KTest)
[readlinetest,~] = size(KTest);
[readlinetrain,~] = size(KTrain);

for i = 1:readlinetrain
    readlinetrainx = KTrain(i:i,:);
    for j = 1:readlinetest
        readlinetestx = KTest(j:j,:);
        distance(i,j) = sqrt((readlinetrainx(1,1:1)-readlinetestx(1,1:1))^2+(readlinetrainx(1,2:2)-readlinetestx(1,2:2))^2+(readlinetrainx(1,3:3)-readlinetestx(1,3:3))^2+(readlinetrainx(1,4:4)-readlinetestx(1,4:4))^2);
    end
end
end