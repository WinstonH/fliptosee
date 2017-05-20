x=unidrnd(101,1)-1; %生成0-100的随机整数
n=0; %定义计数变量
i=0; %定义初始变量
while i~=x
    i=input('Input the num：');
    n=n+1;
    if i>x
        disp('High')
    elseif i<x
        disp('Low')
    else
        disp('You won')
        break %答案正确，则跳出循环
    end
    if n==7;
        fprintf('The corret answer is %i\n', x); %输出正确答案
        disp('You have tried 7 times!') %嘲讽一下玩家
        break %次数届满，则跳出循环
    end
end
