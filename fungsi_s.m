function [label_distance,minim_index] = fungsi_s(KTrain, nilaiK, LabelTrain, distance)
[readlinetrain,~] = size(KTrain);

minim_index = zeros(nilaiK,readlinetrain);
distancet = distance;
n = size(distancet,1);
distancet(1:(n+1):end) = [];
distancet = reshape(distancet,n-1,n);
sortdistance = sort(distancet);
[barisdis1,~] = size(distancet);

for h = 1:nilaiK
    for i = 1:readlinetrain
        for j = 1:readlinetrain
            if distance(j,i) == sortdistance(h,i)
                minim_index(h,i) = j;
            end
        end
    end
end

minim_indexL = length(minim_index);
[readlinelabel,~] = size(LabelTrain);
label_s = zeros(nilaiK,minim_indexL);

for h = 1:nilaiK
    for i = 1:minim_indexL
        for j = 1:readlinelabel
            if minim_index(h,i) == j
                label_s(h,i) = LabelTrain(j,1);
            end
        end
    end
end

labelTR = LabelTrain';
label_size = repmat(labelTR,nilaiK,1);
label_distance = zeros(nilaiK,minim_indexL);

for i = 1:nilaiK
    for j = 1:minim_indexL
        if (label_size(i,j) == label_s(i,j))
            label_distance(i,j) = label_distance(i,j)+1;
        else
            label_distance(i,j) = label_distance(i,j)+0;
        end
    end
end
end