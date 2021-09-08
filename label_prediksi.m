function output = label_prediksi(KTest, nilaiK, hasil_prediksi)
[readlinetest,~] = size(KTest);

maxim_index = zeros(nilaiK,readlinetest);
[~,maxim_indexL] = size(maxim_index);
Label1 = zeros(1,maxim_indexL);
Label2 = zeros(1,maxim_indexL);
Label3 = zeros(1,maxim_indexL);
label_prediksi = zeros(maxim_indexL,1);

for i = 1:nilaiK
    for j = 1:maxim_indexL
        if hasil_prediksi(i,j) == 1
            Label1(1,j) = Label1(1,j)+1;
        elseif hasil_prediksi(i,j) == 2
            Label2(1,j) = Label2(1,j)+1;
        elseif hasil_prediksi(i,j) == 3
            Label3(1,j) = Label3(1,j)+1;
        end
    end
end

for j = 1:maxim_indexL
    if Label1(1,j)>Label2(1,j) && Label1(1,j)>Label3(1,j)
        label_prediksi(j,1) = 1;
    elseif Label2(1,j)>Label1(1,j) && Label2(1,j)>Label3(1,j)
        label_prediksi(j,1) = 2;
    elseif Label3(1,j)>Label1(1,j) && Label3(1,j)>Label2(1,j)
        label_prediksi(j,1) = 3;
    end
end

output = label_prediksi;
end