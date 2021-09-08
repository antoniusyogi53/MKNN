clc;
clear all;

batasBawah = 1;
batasAtas = 1;
x = 1;

[num,txt,~] = xlsread('awal_datacleaning');

% boxplot and legend
number = num(:,4);
choose = boxplot(number, 'Label',' ', 'Colors','b', 'Width',0.5);
y = ylabel('Tahun Berdiri');
set(y, 'position', get(y, 'position') - [0.02,0,0]);
% set(gca,'xtick',[])
% legend([choose(3,1)], {'Jumlah Karyawan'})
% legend('Location','southoutside')

% % % % imputasi knn
% % pilih = num(:,1);
% % bobot = 1;
% % nilaik = 1;
% % [row, col] = find(isnan(pilih));
% % % kolom 1
% % variabel_b = num(:,2:end);
% % % % kolom 2
% % % satu = num(:,1);
% % % dua = num(:,3:end);
% % % variabel_b = [satu, dua];
% % % % kolom 3
% % % satu = num(:,1:2);
% % % dua = num(:,4);
% % % variabel_b = [satu, dua];
% % % % kolom 4
% % % variabel_b = num(:,1:3);
% % 
% % [jumlah,~] = size(row);
% % [baris,kolom] = size(variabel_b);
% % for i = 1:jumlah
% %     for j = 1:baris
% %         if row(i,1) == j
% %             variabel_a(i,1:kolom) = variabel_b(j,1:kolom);
% %         end
% %     end
% % end
% % euclidean = pdist2(variabel_a,variabel_b,'euclidean')';
% % euclidean(euclidean == 0) = NaN;
% % euclidean(any(isnan(euclidean),2),:) = [];
% % sortdistance = sort(euclidean);
% % nilaibobot = num(:,bobot);
% % nilaibobot(any(isnan(nilaibobot),2),:) = [];
% % 
% % [barisjarak,~] = size(euclidean);
% % [readlinetest,~] = size(variabel_a);
% % [readlinetrain,~] = size(nilaibobot);
% % for i = 1:readlinetest
% %     for j = 1:readlinetrain
% %         weight(j,i) = (1/(euclidean(1,i)^2))*(nilaibobot(j,1))/(1/(euclidean(1,i)^2));
% %     end
% % end
% % for i = 1:readlinetest
% %     for j = 1:barisjarak
% %         jarak(j,i) = (1/(euclidean(j,i)^2));
% %         wme(j,i) = (weight(j,i)*jarak(j,i));
% %     end
% % end
% % for h = 1:nilaik
% %     for i = 1:readlinetest
% %         for j = 1:barisjarak
% %             if euclidean(j,i) == sortdistance(h,i)
% %                 index(h,i) = j;
% %             end
% %         end
% %     end
% % end
% % for h = 1:nilaik
% %     for i = 1:jumlah
% %         for j = 1:barisjarak
% %             if index(h,i) == j
% %                 nilai(h,i) = weight(j,1);
% %                 hasilwme(h,i) = wme(j,1);
% %                 hasiljarak(h,i) = jarak(j,1);
% %             end
% %         end
% %     end
% % end
% % total_1 = sum(hasilwme);
% % total_2 = sum(hasiljarak);
% % [bar,kol] = size(total_1);
% % for i = 1:bar
% %     for j = 1:kol
% %         imputasi(i,j) = (total_1(i,j)/total_2(i,j));
% %     end
% % end
% % if nilaik == 1
% %     hasil = nilai(1,:)';
% %     hasiltable = num(:,bobot);
% %     ind = isnan(hasiltable);
% %     hasiltable(ind) = nilai(1:nnz(ind));
% % else
% %     hasil = imputasi(1,:)';
% %     hasiltable = num(:,bobot);
% %     ind = isnan(hasiltable);
% %     hasiltable(ind) = imputasi(1:nnz(ind));
% % end
% % hasilimputasi = [row, hasil];
% 
% % [m,~] = size(num);
% % for i=1:m
% %     if isequal(txt{i+1,5},'Mikro') num(i,5)=1;
% %     elseif isequal(txt{i+1,5},'Kecil') num(i,5)=2;
% %     elseif isequal(txt{i+1,5},'Menengah') num(i,5)=3;
% %     end
% % end
% % rand = num(randperm(size(num,1)), :);
% % norm = normalisasi(rand,txt);
% 
% norm = normalisasi(num,txt);
% 
% class = norm(:,5);
% hh0 = class;
% mikro(hh0(:,1) == 1, :) = 1;
% mikro(mikro(:,1) == 0, :) = [];
% [jumlah_1,~] = size(mikro);
% kecil(hh0(:,1) == 2, :) = 2;
% kecil(kecil(:,1) == 0, :) = [];
% [jumlah_2,~] = size(kecil);
% menengah(hh0(:,1) == 3, :) = 3;
% menengah(menengah(:,1) == 0, :) = [];
% [jumlah_3,~] = size(menengah);
% b = [jumlah_1 jumlah_2 jumlah_3];
% figure, bar(b), title('Grafik data')
% xlabel('Kelas')
% ylabel('Jumlah')
% 
% for nilaiK = batasBawah:batasAtas
% [KTrain1, KTest1, LabelTrain1, LabelTest1] = threeFoldCross(norm, 1);
% 
% hh1 = LabelTest1;
% mikro1(hh1(:,1) == 1, :) = 1;
% mikro1(mikro1(:,1) == 0, :) = [];
% [jumlah_1a,~] = size(mikro1);
% kecil1(hh1(:,1) == 2, :) = 2;
% kecil1(kecil1(:,1) == 0, :) = [];
% [jumlah_1b,~] = size(kecil1);
% menengah1(hh1(:,1) == 3, :) = 3;
% menengah1(menengah1(:,1) == 0, :) = [];
% [jumlah_1c,~] = size(menengah1);
% c = [jumlah_1a jumlah_1b jumlah_1c];
% figure, bar(c), title('Fold 1')
% xlabel('Kelas')
% ylabel('Jumlah')
% 
% euclidean_train1 = pdist2(KTrain1,KTrain1,'euclidean');
% label_euclidean1 = fungsi_s(KTrain1, nilaiK, LabelTrain1, euclidean_train1);
% validity1 = hitung_validitas(label_euclidean1, nilaiK);
% euclidean1 = pdist2(KTrain1,KTest1,'euclidean');
% weight1 = hitung_weight(KTest1, KTrain1, validity1, euclidean1);
% hasil_prediksi1 = prediksi(KTest1, KTrain1, nilaiK, LabelTrain1, weight1);
% output1 = label_prediksi(KTest1, nilaiK, hasil_prediksi1);
% confusion1 = confusionmat(LabelTest1,output1);
% akurasiK1 = (sum(diag(confusion1))/sum(sum(confusion1)))*100;
% 
% print1 = sprintf('Akurasi fold 1 yang didapatkan adalah %g persen',akurasiK1);
% disp(print1)
% 
% [KTrain2, KTest2, LabelTrain2, LabelTest2] = threeFoldCross(norm, 2);
% 
% hh2 = LabelTest2;
% mikro2(hh2(:,1) == 1, :) = 1;
% mikro2(mikro2(:,1) == 0, :) = [];
% [jumlah_2a,~] = size(mikro2);
% kecil2(hh2(:,1) == 2, :) = 2;
% kecil2(kecil2(:,1) == 0, :) = [];
% [jumlah_2b,~] = size(kecil2);
% menengah2(hh2(:,1) == 3, :) = 3;
% menengah2(menengah2(:,1) == 0, :) = [];
% [jumlah_2c,~] = size(menengah2);
% d = [jumlah_2a jumlah_2b jumlah_2c];
% figure, bar(d), title('Fold 2')
% xlabel('Kelas')
% ylabel('Jumlah')
% 
% euclidean_train2 = pdist2(KTrain2,KTrain2,'euclidean');
% label_euclidean2 = fungsi_s(KTrain2, nilaiK, LabelTrain2, euclidean_train2);
% validity2 = hitung_validitas(label_euclidean2, nilaiK);
% euclidean2 = pdist2(KTrain2,KTest2,'euclidean');
% weight2 = hitung_weight(KTest2, KTrain2, validity2, euclidean2);
% hasil_prediksi2 = prediksi(KTest2, KTrain2, nilaiK, LabelTrain2, weight2);
% output2 = label_prediksi(KTest2, nilaiK, hasil_prediksi2);
% confusion2 = confusionmat(LabelTest2,output2);
% akurasiK2 = (sum(diag(confusion2))/sum(sum(confusion2)))*100;
% 
% print2 = sprintf('Akurasi fold 2 yang didapatkan adalah %g persen',akurasiK2);
% disp(print2)
% 
% [KTrain3, KTest3, LabelTrain3, LabelTest3] = threeFoldCross(norm, 3);
% 
% hh3 = LabelTest3;
% mikro3(hh3(:,1) == 1, :) = 1;
% mikro3(mikro3(:,1) == 0, :) = [];
% [jumlah_3a,~] = size(mikro3);
% kecil3(hh3(:,1) == 2, :) = 2;
% kecil3(kecil3(:,1) == 0, :) = [];
% [jumlah_3b,~] = size(kecil3);
% menengah3(hh3(:,1) == 3, :) = 3;
% menengah3(menengah3(:,1) == 0, :) = [];
% [jumlah_3c,~] = size(menengah3);
% e = [jumlah_3a jumlah_3b jumlah_3c];
% figure, bar(e), title('Fold 3')
% xlabel('Kelas')
% ylabel('Jumlah')
% 
% euclidean_train3 = pdist2(KTrain3,KTrain3,'euclidean');
% label_euclidean3 = fungsi_s(KTrain3, nilaiK, LabelTrain3, euclidean_train3);
% validity3 = hitung_validitas(label_euclidean3, nilaiK);
% euclidean3 = pdist2(KTrain3,KTest3,'euclidean');
% weight3 = hitung_weight(KTest3, KTrain3, validity3, euclidean3);
% hasil_prediksi3 = prediksi(KTest3, KTrain3, nilaiK, LabelTrain3, weight3);
% output3 = label_prediksi(KTest3, nilaiK, hasil_prediksi3);
% confusion3 = confusionmat(LabelTest3,output3);
% akurasiK3 = (sum(diag(confusion3))/sum(sum(confusion3)))*100;
% 
% print3 = sprintf('Akurasi fold 3 yang didapatkan adalah %g persen',akurasiK3);
% disp(print3)
% 
% % jumlah akurasi
% JmlHasil = akurasiK1+akurasiK2+akurasiK3;
% akurasiKF(x) = (JmlHasil/3);
% x = x+1;
% print4 = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% disp(print4)
% end
% 
% % [~,value]=maxk(akurasiKF,1);
% % nn=[batasBawah:batasAtas];
% % key=nn(:,value);
% % 
% % akurasiTertinggi = max(akurasiKF);
% % % jumlah = [akurasiKF];
% % % figure, plot(jumlah,'o--r'), xlabel('K'), ylabel('Akurasi'), title('Grafik Akurasi')
% % % axis([batasBawah batasAtas 0 100])
% % y=[batasBawah:batasAtas];
% % z=[akurasiKF];
% % plot(y,z,'-bo','linewidth',1,'markeredgecolor','k','markerfacecolor','k')
% % grid on
% % 
% % for nilaiK = batasBawah:batasAtas
% % [KTrain1, KTest1, LabelTrain1, LabelTest1] = fiveFoldCross(norm, 1);
% % euclidean_train1 = pdist2(KTrain1,KTrain1,'euclidean');
% % label_euclidean1 = fungsi_s(KTrain1, nilaiK, LabelTrain1, euclidean_train1);
% % validity1 = hitung_validitas(label_euclidean1, nilaiK);
% % euclidean1 = pdist2(KTrain1,KTest1,'euclidean');
% % weight1 = hitung_weight(KTest1, KTrain1, validity1, euclidean1);
% % hasil_prediksi1 = prediksi(KTest1, KTrain1, nilaiK, LabelTrain1, weight1);
% % output1 = label_prediksi(KTest1, nilaiK, hasil_prediksi1);
% % 
% % confusion1 = confusionmat(LabelTest1,output1);
% % akurasiK1 = (sum(diag(confusion1))/sum(sum(confusion1)))*100;
% % print1 = sprintf('Akurasi fold 1 yang didapatkan adalah %g persen',akurasiK1);
% % disp(print1)
% % 
% % [KTrain2, KTest2, LabelTrain2, LabelTest2] = fiveFoldCross(norm, 2);
% % euclidean_train2 = pdist2(KTrain2,KTrain2,'euclidean');
% % label_euclidean2 = fungsi_s(KTrain2, nilaiK, LabelTrain2, euclidean_train2);
% % validity2 = hitung_validitas(label_euclidean2, nilaiK);
% % euclidean2 = pdist2(KTrain2,KTest2,'euclidean');
% % weight2 = hitung_weight(KTest2, KTrain2, validity2, euclidean2);
% % hasil_prediksi2 = prediksi(KTest2, KTrain2, nilaiK, LabelTrain2, weight2);
% % output2 = label_prediksi(KTest2, nilaiK, hasil_prediksi2);
% % 
% % confusion2 = confusionmat(LabelTest2,output2);
% % akurasiK2 = (sum(diag(confusion2))/sum(sum(confusion2)))*100;
% % print2 = sprintf('Akurasi fold 2 yang didapatkan adalah %g persen',akurasiK2);
% % disp(print2)
% % 
% % [KTrain3, KTest3, LabelTrain3, LabelTest3] = fiveFoldCross(norm, 3);
% % euclidean_train3 = pdist2(KTrain3,KTrain3,'euclidean');
% % label_euclidean3 = fungsi_s(KTrain3, nilaiK, LabelTrain3, euclidean_train3);
% % validity3 = hitung_validitas(label_euclidean3, nilaiK);
% % euclidean3 = pdist2(KTrain3,KTest3,'euclidean');
% % weight3 = hitung_weight(KTest3, KTrain3, validity3, euclidean3);
% % hasil_prediksi3 = prediksi(KTest3, KTrain3, nilaiK, LabelTrain3, weight3);
% % output3 = label_prediksi(KTest3, nilaiK, hasil_prediksi3);
% % 
% % confusion3 = confusionmat(LabelTest3,output3);
% % akurasiK3 = (sum(diag(confusion3))/sum(sum(confusion3)))*100;
% % print3 = sprintf('Akurasi fold 3 yang didapatkan adalah %g persen',akurasiK3);
% % disp(print3)
% % 
% % [KTrain4, KTest4, LabelTrain4, LabelTest4] = fiveFoldCross(norm, 4);
% % euclidean_train4 = pdist2(KTrain4,KTrain4,'euclidean');
% % label_euclidean4 = fungsi_s(KTrain4, nilaiK, LabelTrain4, euclidean_train4);
% % validity4 = hitung_validitas(label_euclidean4, nilaiK);
% % euclidean4 = pdist2(KTrain4,KTest4,'euclidean');
% % weight4 = hitung_weight(KTest4, KTrain4, validity4, euclidean4);
% % hasil_prediksi4 = prediksi(KTest4, KTrain4, nilaiK, LabelTrain4, weight4);
% % output4 = label_prediksi(KTest4, nilaiK, hasil_prediksi4);
% % 
% % confusion4 = confusionmat(LabelTest4,output4);
% % akurasiK4 = (sum(diag(confusion4))/sum(sum(confusion4)))*100;
% % print4 = sprintf('Akurasi fold 4 yang didapatkan adalah %g persen',akurasiK4);
% % disp(print4)
% % 
% % [KTrain5, KTest5, LabelTrain5, LabelTest5] = fiveFoldCross(norm, 5);
% % euclidean_train5 = pdist2(KTrain5,KTrain5,'euclidean');
% % label_euclidean5 = fungsi_s(KTrain5, nilaiK, LabelTrain5, euclidean_train5);
% % validity5 = hitung_validitas(label_euclidean5, nilaiK);
% % euclidean5 = pdist2(KTrain5,KTest5,'euclidean');
% % weight5 = hitung_weight(KTest5, KTrain5, validity5, euclidean5);
% % hasil_prediksi5 = prediksi(KTest5, KTrain5, nilaiK, LabelTrain5, weight5);
% % output5 = label_prediksi(KTest5, nilaiK, hasil_prediksi5);
% % 
% % confusion5 = confusionmat(LabelTest5,output5);
% % akurasiK5 = (sum(diag(confusion5))/sum(sum(confusion5)))*100;
% % print5 = sprintf('Akurasi fold 5 yang didapatkan adalah %g persen',akurasiK5);
% % disp(print5)
% % 
% % % % jumlah akurasi
% % % JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5;
% % % akurasiKF = (JmlHasil/5);
% % % print6 = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% % % disp(print6)
% % 
% % % jumlah akurasi
% % JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5;
% % akurasiKF(x) = (JmlHasil/5);
% % x = x+1;
% % print6 = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% % disp(print6)
% % end
% % 
% % [~,value]=maxk(akurasiKF,1);
% % nn=[batasBawah:batasAtas];
% % key=nn(:,value);
% % 
% % akurasiTertinggi = max(akurasiKF);
% % % jumlah = [akurasiKF];
% % % figure, plot(jumlah,'o--r'), xlabel('K'), ylabel('Akurasi'), title('Grafik Akurasi')
% % % axis([batasBawah batasAtas 0 100])
% % y=[batasBawah:batasAtas];
% % z=[akurasiKF];
% % plot(y,z,'-b*','linewidth',2,'markeredgecolor','r')
% % 
% % 
% % % for nilaiK = batasBawah:batasAtas
% % % [KTrain1, KTest1, LabelTrain1, LabelTest1] = fiveFoldCross(norm, 1);
% % % euclidean_train1 = pdist2(KTrain1,KTrain1,'euclidean');
% % % label_euclidean1 = fungsi_s(KTrain1, nilaiK, LabelTrain1, euclidean_train1);
% % % validity1 = hitung_validitas(label_euclidean1, nilaiK);
% % % euclidean1 = pdist2(KTrain1,KTest1,'euclidean');
% % % weight1 = hitung_weight(KTest1, KTrain1, validity1, euclidean1);
% % % hasil_prediksi1 = prediksi(KTest1, KTrain1, nilaiK, LabelTrain1, weight1);
% % % output1 = label_prediksi(KTest1, nilaiK, hasil_prediksi1);
% % % 
% % % confusion1 = confusionmat(LabelTest1,output1);
% % % akurasiK1 = (sum(diag(confusion1))/sum(sum(confusion1)))*100;
% % % print1 = sprintf('Akurasi fold 1 yang didapatkan adalah %g persen',akurasiK1);
% % % disp(print1)
% % % 
% % % [KTrain2, KTest2, LabelTrain2, LabelTest2] = fiveFoldCross(norm, 2);
% % % euclidean_train2 = pdist2(KTrain2,KTrain2,'euclidean');
% % % label_euclidean2 = fungsi_s(KTrain2, nilaiK, LabelTrain2, euclidean_train2);
% % % validity2 = hitung_validitas(label_euclidean2, nilaiK);
% % % euclidean2 = pdist2(KTrain2,KTest2,'euclidean');
% % % weight2 = hitung_weight(KTest2, KTrain2, validity2, euclidean2);
% % % hasil_prediksi2 = prediksi(KTest2, KTrain2, nilaiK, LabelTrain2, weight2);
% % % output2 = label_prediksi(KTest2, nilaiK, hasil_prediksi2);
% % % 
% % % confusion2 = confusionmat(LabelTest2,output2);
% % % akurasiK2 = (sum(diag(confusion2))/sum(sum(confusion2)))*100;
% % % print2 = sprintf('Akurasi fold 2 yang didapatkan adalah %g persen',akurasiK2);
% % % disp(print2)
% % % 
% % % [KTrain3, KTest3, LabelTrain3, LabelTest3] = fiveFoldCross(norm, 3);
% % % euclidean_train3 = pdist2(KTrain3,KTrain3,'euclidean');
% % % label_euclidean3 = fungsi_s(KTrain3, nilaiK, LabelTrain3, euclidean_train3);
% % % validity3 = hitung_validitas(label_euclidean3, nilaiK);
% % % euclidean3 = pdist2(KTrain3,KTest3,'euclidean');
% % % weight3 = hitung_weight(KTest3, KTrain3, validity3, euclidean3);
% % % hasil_prediksi3 = prediksi(KTest3, KTrain3, nilaiK, LabelTrain3, weight3);
% % % output3 = label_prediksi(KTest3, nilaiK, hasil_prediksi3);
% % % 
% % % confusion3 = confusionmat(LabelTest3,output3);
% % % akurasiK3 = (sum(diag(confusion3))/sum(sum(confusion3)))*100;
% % % print3 = sprintf('Akurasi fold 3 yang didapatkan adalah %g persen',akurasiK3);
% % % disp(print3)
% % % 
% % % [KTrain4, KTest4, LabelTrain4, LabelTest4] = fiveFoldCross(norm, 4);
% % % euclidean_train4 = pdist2(KTrain4,KTrain4,'euclidean');
% % % label_euclidean4 = fungsi_s(KTrain4, nilaiK, LabelTrain4, euclidean_train4);
% % % validity4 = hitung_validitas(label_euclidean4, nilaiK);
% % % euclidean4 = pdist2(KTrain4,KTest4,'euclidean');
% % % weight4 = hitung_weight(KTest4, KTrain4, validity4, euclidean4);
% % % hasil_prediksi4 = prediksi(KTest4, KTrain4, nilaiK, LabelTrain4, weight4);
% % % output4 = label_prediksi(KTest4, nilaiK, hasil_prediksi4);
% % % 
% % % confusion4 = confusionmat(LabelTest4,output4);
% % % akurasiK4 = (sum(diag(confusion4))/sum(sum(confusion4)))*100;
% % % print4 = sprintf('Akurasi fold 4 yang didapatkan adalah %g persen',akurasiK4);
% % % disp(print4)
% % % 
% % % [KTrain5, KTest5, LabelTrain5, LabelTest5] = fiveFoldCross(norm, 5);
% % % euclidean_train5 = pdist2(KTrain5,KTrain5,'euclidean');
% % % label_euclidean5 = fungsi_s(KTrain5, nilaiK, LabelTrain5, euclidean_train5);
% % % validity5 = hitung_validitas(label_euclidean5, nilaiK);
% % % euclidean5 = pdist2(KTrain5,KTest5,'euclidean');
% % % weight5 = hitung_weight(KTest5, KTrain5, validity5, euclidean5);
% % % hasil_prediksi5 = prediksi(KTest5, KTrain5, nilaiK, LabelTrain5, weight5);
% % % output5 = label_prediksi(KTest5, nilaiK, hasil_prediksi5);
% % % 
% % % confusion5 = confusionmat(LabelTest5,output5);
% % % akurasiK5 = (sum(diag(confusion5))/sum(sum(confusion5)))*100;
% % % print5 = sprintf('Akurasi fold 5 yang didapatkan adalah %g persen',akurasiK5);
% % % disp(print5)
% % % 
% % % % % jumlah akurasi
% % % % JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5;
% % % % akurasiKF = (JmlHasil/5);
% % % % print6 = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% % % % disp(print6)
% % % 
% % % % jumlah akurasi
% % % JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5;
% % % akurasiKF(x) = (JmlHasil/5);
% % % x = x+1;
% % % print6 = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% % % disp(print6)
% % % end
% % % 
% % % [~,value]=maxk(akurasiKF,1);
% % % nn=[batasBawah:batasAtas];
% % % key=nn(:,value);
% % % 
% % % akurasiTertinggi = max(akurasiKF);
% % % % jumlah = [akurasiKF];
% % % % figure, plot(jumlah,'o--r'), xlabel('K'), ylabel('Akurasi'), title('Grafik Akurasi')
% % % % axis([batasBawah batasAtas 0 100])
% % % y=[batasBawah:batasAtas];
% % % z=[akurasiKF];
% % % plot(y,z,'--r*','linewidth',2,'markeredgecolor','g')
% % 
% % % for nilaiK = batasBawah:batasAtas
% % % [KTrain1, KTest1, LabelTrain1, LabelTest1] = sevenFoldCross(norm, 1);
% % % euclidean_train1 = pdist2(KTrain1,KTrain1,'euclidean');
% % % label_euclidean1 = fungsi_s(KTrain1, nilaiK, LabelTrain1, euclidean_train1);
% % % validity1 = hitung_validitas(label_euclidean1, nilaiK);
% % % euclidean1 = pdist2(KTrain1,KTest1,'euclidean');
% % % weight1 = hitung_weight(KTest1, KTrain1, validity1, euclidean1);
% % % hasil_prediksi1 = prediksi(KTest1, KTrain1, nilaiK, LabelTrain1, weight1);
% % % output1 = label_prediksi(KTest1, nilaiK, hasil_prediksi1);
% % % 
% % % confusion1 = confusionmat(LabelTest1,output1);
% % % akurasiK1 = (sum(diag(confusion1))/sum(sum(confusion1)))*100;
% % % print1 = sprintf('Akurasi fold 1 yang didapatkan adalah %g persen',akurasiK1);
% % % disp(print1)
% % % 
% % % [KTrain2, KTest2, LabelTrain2, LabelTest2] = sevenFoldCross(norm, 2);
% % % euclidean_train2 = pdist2(KTrain2,KTrain2,'euclidean');
% % % label_euclidean2 = fungsi_s(KTrain2, nilaiK, LabelTrain2, euclidean_train2);
% % % validity2 = hitung_validitas(label_euclidean2, nilaiK);
% % % euclidean2 = pdist2(KTrain2,KTest2,'euclidean');
% % % weight2 = hitung_weight(KTest2, KTrain2, validity2, euclidean2);
% % % hasil_prediksi2 = prediksi(KTest2, KTrain2, nilaiK, LabelTrain2, weight2);
% % % output2 = label_prediksi(KTest2, nilaiK, hasil_prediksi2);
% % % 
% % % confusion2 = confusionmat(LabelTest2,output2);
% % % akurasiK2 = (sum(diag(confusion2))/sum(sum(confusion2)))*100;
% % % print2 = sprintf('Akurasi fold 2 yang didapatkan adalah %g persen',akurasiK2);
% % % disp(print2)
% % % 
% % % [KTrain3, KTest3, LabelTrain3, LabelTest3] = sevenFoldCross(norm, 3);
% % % euclidean_train3 = pdist2(KTrain3,KTrain3,'euclidean');
% % % label_euclidean3 = fungsi_s(KTrain3, nilaiK, LabelTrain3, euclidean_train3);
% % % validity3 = hitung_validitas(label_euclidean3, nilaiK);
% % % euclidean3 = pdist2(KTrain3,KTest3,'euclidean');
% % % weight3 = hitung_weight(KTest3, KTrain3, validity3, euclidean3);
% % % hasil_prediksi3 = prediksi(KTest3, KTrain3, nilaiK, LabelTrain3, weight3);
% % % output3 = label_prediksi(KTest3, nilaiK, hasil_prediksi3);
% % % 
% % % confusion3 = confusionmat(LabelTest3,output3);
% % % akurasiK3 = (sum(diag(confusion3))/sum(sum(confusion3)))*100;
% % % print3 = sprintf('Akurasi fold 3 yang didapatkan adalah %g persen',akurasiK3);
% % % disp(print3)
% % % 
% % % [KTrain4, KTest4, LabelTrain4, LabelTest4] = sevenFoldCross(norm, 4);
% % % euclidean_train4 = pdist2(KTrain4,KTrain4,'euclidean');
% % % label_euclidean4 = fungsi_s(KTrain4, nilaiK, LabelTrain4, euclidean_train4);
% % % validity4 = hitung_validitas(label_euclidean4, nilaiK);
% % % euclidean4 = pdist2(KTrain4,KTest4,'euclidean');
% % % weight4 = hitung_weight(KTest4, KTrain4, validity4, euclidean4);
% % % hasil_prediksi4 = prediksi(KTest4, KTrain4, nilaiK, LabelTrain4, weight4);
% % % output4 = label_prediksi(KTest4, nilaiK, hasil_prediksi4);
% % % 
% % % confusion4 = confusionmat(LabelTest4,output4);
% % % akurasiK4 = (sum(diag(confusion4))/sum(sum(confusion4)))*100;
% % % print4 = sprintf('Akurasi fold 4 yang didapatkan adalah %g persen',akurasiK4);
% % % disp(print4)
% % % 
% % % [KTrain5, KTest5, LabelTrain5, LabelTest5] = sevenFoldCross(norm, 5);
% % % euclidean_train5 = pdist2(KTrain5,KTrain5,'euclidean');
% % % label_euclidean5 = fungsi_s(KTrain5, nilaiK, LabelTrain5, euclidean_train5);
% % % validity5 = hitung_validitas(label_euclidean5, nilaiK);
% % % euclidean5 = pdist2(KTrain5,KTest5,'euclidean');
% % % weight5 = hitung_weight(KTest5, KTrain5, validity5, euclidean5);
% % % hasil_prediksi5 = prediksi(KTest5, KTrain5, nilaiK, LabelTrain5, weight5);
% % % output5 = label_prediksi(KTest5, nilaiK, hasil_prediksi5);
% % % 
% % % confusion5 = confusionmat(LabelTest5,output5);
% % % akurasiK5 = (sum(diag(confusion5))/sum(sum(confusion5)))*100;
% % % print5 = sprintf('Akurasi fold 5 yang didapatkan adalah %g persen',akurasiK5);
% % % disp(print5)
% % % 
% % % [KTrain6, KTest6, LabelTrain6, LabelTest6] = sevenFoldCross(norm, 6);
% % % euclidean_train6 = pdist2(KTrain6,KTrain6,'euclidean');
% % % label_euclidean6 = fungsi_s(KTrain6, nilaiK, LabelTrain6, euclidean_train6);
% % % validity6 = hitung_validitas(label_euclidean6, nilaiK);
% % % euclidean6 = pdist2(KTrain6,KTest6,'euclidean');
% % % weight6 = hitung_weight(KTest6, KTrain6, validity6, euclidean6);
% % % hasil_prediksi6 = prediksi(KTest6, KTrain6, nilaiK, LabelTrain6, weight6);
% % % output6 = label_prediksi(KTest6, nilaiK, hasil_prediksi6);
% % % 
% % % confusion6 = confusionmat(LabelTest6,output6);
% % % akurasiK6 = (sum(diag(confusion6))/sum(sum(confusion6)))*100;
% % % print6 = sprintf('Akurasi fold 6 yang didapatkan adalah %g persen',akurasiK6);
% % % disp(print6)
% % % 
% % % [KTrain7, KTest7, LabelTrain7, LabelTest7] = sevenFoldCross(norm, 7);
% % % euclidean_train7 = pdist2(KTrain7,KTrain7,'euclidean');
% % % label_euclidean7 = fungsi_s(KTrain7, nilaiK, LabelTrain7, euclidean_train7);
% % % validity7 = hitung_validitas(label_euclidean7, nilaiK);
% % % euclidean7 = pdist2(KTrain7,KTest7,'euclidean');
% % % weight7 = hitung_weight(KTest7, KTrain7, validity7, euclidean7);
% % % hasil_prediksi7 = prediksi(KTest7, KTrain7, nilaiK, LabelTrain7, weight7);
% % % output7 = label_prediksi(KTest7, nilaiK, hasil_prediksi7);
% % % 
% % % confusion7 = confusionmat(LabelTest7,output7);
% % % akurasiK7 = (sum(diag(confusion7))/sum(sum(confusion7)))*100;
% % % print7 = sprintf('Akurasi fold 7 yang didapatkan adalah %g persen',akurasiK7);
% % % disp(print7)
% % % 
% % % % % jumlah akurasi
% % % % JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5;
% % % % akurasiKF = (JmlHasil/5);
% % % % print6 = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% % % % disp(print6)
% % % 
% % % % jumlah akurasi
% % % JmlHasil = akurasiK1+akurasiK2+akurasiK3+akurasiK4+akurasiK5+akurasiK6+akurasiK7;
% % % akurasiKF(x) = (JmlHasil/7);
% % % x = x+1;
% % % printer = sprintf('Hasil akurasi yang didapatkan adalah %g persen',akurasiKF);
% % % disp(printer)
% % % end
% % % 
% % % [~,value]=maxk(akurasiKF,1);
% % % nn=[batasBawah:batasAtas];
% % % key=nn(:,value);
% % % 
% % % akurasiTertinggi = max(akurasiKF);
% % % % jumlah = [akurasiKF];
% % % % figure, plot(jumlah,'o--r'), xlabel('K'), ylabel('Akurasi'), title('Grafik Akurasi')
% % % % axis([batasBawah batasAtas 0 100])
% % % y=[batasBawah:batasAtas];
% % % z=[akurasiKF];
% % % plot(y,z,'--r*','linewidth',2,'markeredgecolor','g')
% % % 
% % 
% % % % uji data tunggal
% % % bukaTunggal=norm;
% % % ukuranDataT = size(bukaTunggal,2); %hitung jumlah kolom
% % % jumDataT = size(bukaTunggal,1);
% % % tunggal = jumDataT;
% % % dataTunggal = bukaTunggal(1:tunggal,1:ukuranDataT-1);
% % % totalDataTunggal = dataTunggal;
% % % 
% % % classTunggal = bukaTunggal(1:tunggal,ukuranDataT);
% % % totalClassTunggal = classTunggal;
% % % 
% % % jumlah = 5;
% % % aset = 215000000;
% % % omset = 1800000000;
% % % tahun = 2006;
% % % dataUji = [jumlah aset omset tahun];
% % % 
% % % [m,~] = size(dataUji);
% % % for i=1:m
% % % %aset
% % % if dataUji(i,2)>=0 && dataUji(i,2)<= 50000000 dataUji(i,2)=1;
% % % elseif dataUji(i,2)> 50000000 && dataUji(i,2)<= 500000000 dataUji(i,2)=2;
% % % elseif dataUji(i,2)> 500000000 && dataUji(i,2)<= 10000000000 dataUji(i,2)=3;
% % % end
% % % %omset
% % % if dataUji(i,3)>=0 && dataUji(i,3)<= 300000000 dataUji(i,3)=1;
% % % elseif dataUji(i,3)> 300000000 && dataUji(i,3)<= 2500000000 dataUji(i,3)=2;
% % % elseif dataUji(i,3)> 2500000000 && dataUji(i,3)<= 50000000000 dataUji(i,3)=3;
% % % end
% % % % jdlamaberdiri
% % % dataUji(i,4) = 2018 - dataUji(i,4);
% % % end
% % % 
% % % nyobo = double(num(:,1:end-1));
% % % mn1 = mean(nyobo(:,1));
% % % st1 = std(nyobo(:,1));
% % % satu = (nyobo(:,1)-mn1)/(st1);
% % % 
% % % mn4 = mean(nyobo(:,4));
% % % st4 = std(nyobo(:,4));
% % % empat = (nyobo(:,4)-mn4)/(st4);
% % % 
% % % % normalisasi z-score
% % % xjumlah = (dataUji(:,1)-mn1)/(st1);
% % % xaset = (dataUji(:,2));
% % % xomset = (dataUji(:,3));
% % % xtahun = (dataUji(:,4)-mn4)/(st4);
% % % xnorm = [xjumlah xaset xomset xtahun];
% % % 
% % % % ukurData = size(xnorm,2);
% % % % jumlahData = size(xnorm,1);
% % % % datafix = xnorm(1:jumlahData,1:ukurData);
% % % 
% % % euclidean_train6 = pdist2(totalDataTunggal,totalDataTunggal,'euclidean');
% % % label_euclidean6 = fungsi_s(totalDataTunggal, key, totalClassTunggal, euclidean_train6);
% % % validity6 = hitung_validitas(label_euclidean6, key);
% % % euclidean6 = pdist2(totalDataTunggal,xnorm,'euclidean');
% % % weight6 = hitung_weight(xnorm, totalDataTunggal, validity6, euclidean6);
% % % hasil_prediksi6 = prediksi(xnorm, totalDataTunggal, key, totalClassTunggal, weight6);
% % % output6 = label_prediksi(xnorm, key, hasil_prediksi6);
% % % idd = mode(output6);
% % % 
% % % if(idd==1)
% % %     mikro=char('mikro');
% % %     disp(['Output klasifikasi = ',mikro]);
% % % elseif(idd==2)
% % %     kecil=char('kecil');
% % %     disp(['Output klasifikasi = ',kecil]);
% % % elseif(idd==3)
% % %     menengah=char('menengah');
% % %     disp(['Output klasifikasi = ',menengah]);
% % % end