function [norm] = normalisasi(num, txt)
[m,~] = size(num);

for i=1:m
    if isequal(txt{i+1,5},'Mikro') num(i,5)=1;
    elseif isequal(txt{i+1,5},'Kecil') num(i,5)=2;
    elseif isequal(txt{i+1,5},'Menengah') num(i,5)=3;
    end
    if num(i,2)>=0 && num(i,2)<= 50000000 num(i,2)=1;
    elseif num(i,2)> 50000000 && num(i,2)<= 500000000 num(i,2)=2;
    elseif num(i,2)> 500000000 && num(i,2)<= 10000000000 num(i,2)=3;
    end
    if num(i,3)>=0 && num(i,3)<= 300000000 num(i,3)=1;
    elseif num(i,3)> 300000000 && num(i,3)<= 2500000000 num(i,3)=2;
    elseif num(i,3)> 2500000000 && num(i,3)<= 50000000000 num(i,3)=3;
    end
    num(i,4) = 2018 - num(i,4);
end

var = double(num(:,1:end-1));
zcs = zscore(var,[ ],1);

jumlah = (zcs(:,1));
aset = (num(:,2));
omset = (num(:,3));
tahun = (zcs(:,4));
kriteria = num(:,5);
norm = [jumlah aset omset tahun kriteria];

end