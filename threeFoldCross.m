function [KTrain, KTest, LabelTrain, LabelTest] = threeFoldCross(num, fold)
ukuranData = size(num,2);
jumData = size(num,1);

data = num(1:jumData,1:ukuranData-1);
dataku = data';

class = num(1:jumData,ukuranData);
classku = class';

range = jumData(1)/3;
range = round(range);

if (fold == 1)
    KTrain = dataku(:,range+1:end);
    KTrain = KTrain';
    LabelTrain = classku(range+1:end);
    LabelTrain = LabelTrain';
    
    KTest = dataku(:,1:range);
    KTest = KTest';
    LabelTest = classku(1:range);
    LabelTest = LabelTest';

elseif (fold == 2)
    KTrain = dataku(:,[(1:range) (range*2+1:end)]);
    KTrain = KTrain';
    LabelTrain = classku([(1:range) (range*2+1:end)]);
    LabelTrain = LabelTrain';
    
    KTest = dataku(:,range+1:range*2);
    KTest = KTest';
    LabelTest = classku(range+1:range*2);
    LabelTest = LabelTest';

else
    KTrain = dataku(:,1:range*2);
    KTrain = KTrain';
    LabelTrain = classku(1:range*2);
    LabelTrain = LabelTrain';

    KTest = dataku(:,range*2+1:end);
    KTest = KTest';
    LabelTest = classku(range*2+1:end);
    LabelTest = LabelTest';
end

end