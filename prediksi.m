function [hasil_prediksi,readlinelabel,maxim_index,maxim_indexL] = prediksi(KTest, KTrain, nilaiK, LabelTrain, weight)
[readlinetest,~] = size(KTest);
[readlinetrain,~] = size(KTrain);

maxim_index = zeros(nilaiK,readlinetest);
sortweight = sort(weight,'descend');

for h = 1:nilaiK
    for i = 1:readlinetest
        for j = 1:readlinetrain
            if weight(j,i) == sortweight(h,i)
                maxim_index(h,i) = j;
            end
        end
    end
end

[~,maxim_indexL] = size(maxim_index);
[readlinelabel,~] = size(LabelTrain);
hasil_prediksi = zeros(nilaiK,maxim_indexL);

for h = 1:nilaiK
    for i = 1:maxim_indexL
        for j = 1:readlinelabel
            if maxim_index(h,i) == j
                hasil_prediksi(h,i) = LabelTrain(j,1);
            end
        end
    end
end
end