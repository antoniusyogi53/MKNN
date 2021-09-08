function [KTrain, KTest, LabelTrain, LabelTest] = fiveFoldCross(num, fold)
ukuranData = size(num,2);
jumData = size(num,1);

data = num(1:jumData,1:ukuranData-1);
dataku = data';

class = num(1:jumData,ukuranData);
classku = class';

range = jumData(1)/5;
range = round(range);

if (fold == 1)
    KTrain = dataku(:,[(range+1:range*2) (range*2+1:range*3) (range*3+1:range*4) (range*4+1:jumData(1))]);
    KTrain = KTrain';
    LabelTrain = classku([(range+1:range*2) (range*2+1:range*3) (range*3+1:range*4) (range*4+1:jumData(1))]);
    LabelTrain = LabelTrain';
    
    KTest = dataku(:,1:range);
    KTest = KTest';
    LabelTest = classku(1:range);
    LabelTest = LabelTest';

elseif (fold == 2)
    KTrain = dataku(:,[(1:range) (range*2+1:range*3) (range*3+1:range*4) (range*4+1:jumData(1))]);
    KTrain = KTrain';
    LabelTrain = classku([(1:range) (range*2+1:range*3) (range*3+1:range*4) (range*4+1:jumData(1))]);
    LabelTrain = LabelTrain';
    
    KTest = dataku(:,range+1:range*2);
    KTest = KTest';
    LabelTest = classku(range+1:range*2);
    LabelTest = LabelTest';
    
elseif (fold == 3)
    KTrain = dataku(:,[(1:range) (range+1:range*2) (range*3+1:range*4) (range*4+1:jumData(1))]);
    KTrain = KTrain';
    LabelTrain = classku([(1:range) (range+1:range*2) (range*3+1:range*4) (range*4+1:jumData(1))]);
    LabelTrain = LabelTrain';
    
    KTest = dataku(:,range*2+1:range*3);
    KTest = KTest';
    LabelTest = classku(range*2+1:range*3);
    LabelTest = LabelTest';
    
elseif (fold == 4)
    KTrain = dataku(:,[(1:range) (range+1:range*2) (range*2+1:range*3) (range*4+1:jumData(1))]);
    KTrain = KTrain';
    LabelTrain = classku([(1:range) (range+1:range*2) (range*2+1:range*3) (range*4+1:jumData(1))]);
    LabelTrain = LabelTrain';
    
    KTest = dataku(:,range*3+1:range*4);
    KTest = KTest';
    LabelTest = classku(range*3+1:range*4);
    LabelTest = LabelTest';

else
    KTrain = dataku(:,[(1:range) (range+1:range*2) (range*2+1:range*3) (range*3+1:range*4)]);
    KTrain = KTrain';
    LabelTest = classku(range*4+1:jumData(1));
    LabelTest = LabelTest';
    
    KTest = dataku(:,range*4+1:jumData(1));
    KTest = KTest';
    LabelTrain = classku([(1:range) (range+1:range*2) (range*2+1:range*3) (range*3+1:range*4)]);
    LabelTrain = LabelTrain';
end

end