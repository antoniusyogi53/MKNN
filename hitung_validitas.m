function [validity] = hitung_validitas(label_distance, nilaiK)

for i = 1:length(label_distance)
    readlinevalidity = label_distance(:,i:i);
    validity(i,:) = ((1/nilaiK)*sum(readlinevalidity));
end
end