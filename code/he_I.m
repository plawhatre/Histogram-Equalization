function [J,T] = he_I(I)
%number of levels
L=256;
%inbuit-function for comparision
[q,qt]=histeq(I,L);
%for equilisation operation
I=round(255.*I);
%unique intensity values and their count
[ix,iy]=size(I);
t=[I(1,1),0];
nu=0;
% r_k and n_k calculation
for i=1:ix
    for j=1:iy
        a=I(i,j);
        cond=(t(:,1)==a);
        if sum(cond)==0
            t=[t;I(i,j),1];
            nu=nu+1;
        else
            for k=1:length(cond)
                if cond(k)==1
                    break
                end
            end
            t(k,2)=t(k,2)+1;
            nu=nu+1;
        end
    end
end
%sorting
[s1,s2]=bubble_srt(t(:,1));
t(:,1)=t(s2,1);
t(:,2)=t(s2,2);
%p_k
t(:,3)=t(:,2)./(ix.*iy);
%s_k
sum_n=0;
for i=1:length(t(:,3))
    sum_n=sum_n+t(i,3);
    cdf=sum_n*(255);
    t(i,4)=round(cdf); 
end
%bins
b_n=1/(L-1);
mrk=L-2;
bin=[0];
for i=1:mrk
    bin=[bin;b_n*i];
end
bin=[bin;1];
bin=round(255.*bin);
%bin_divider
bd=round((255/(L)):(255/(L)):255);
bd(end)=[];
%bin assignment
for i=1:length(t(:,2))
    vl=t(i,4);
    %%%
    for xi=1:length(bd)
        if vl<bd(xi)
            t(i,5)=bin(xi);
            mrk=0;
            break;
        else
            mrk=1;
        end
    end
    if mrk==1
        t(i,5)=bin(end);
    end
end
%changing pixel value
a=i;
J=I;
for i=1:ix
    for j=1:iy
        b=I(i,j);
        J(i,j)=changePixVal(t,a,b,5)/255;
    end
end
%Gray transformation
T=round(0:1/256:1);
for i=1:length(t(:,1))
    T(t(:,1)+1)=t(:,5)/255;
end
%processed image_inbuilt
subplot(2,2,1)
imshow(q)
title('processed image inbuilt')
%processed image_by_user
subplot(2,2,2)
imshow(J)
title('processed image by user')
%hist_unbuilt
subplot(2,2,3)
[out1(:,1),out1(:,2)]=hist_freq(q);
stem(out1(:,1),out1(:,2),'g')
title('hist unbuilt')
%hist_by_user
subplot(2,2,4)
[out2(:,1),out2(:,2)]=hist_freq(J);
stem(out2(:,1),out2(:,2))
title('hist by user')
% T plot
figure()
subplot(1,2,1)
plot(1:length(T),T,'g')
title('TranformationCurve inbuilt')
subplot(1,2,2)
plot(1:length(qt),qt)
title('TranformationCurve by user')
end

