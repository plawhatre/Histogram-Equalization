function [J] = he_I_x_vrb(I,x,verbose_fig)
%number of levels
L=256;
%unique intensity values and their count
[ix,iy]=size(I);
%%%%%%%%%%%%%%%%%
t1=gen_bin(I,L);
%%%%%%%%%%%%%%%%%
t2=gen_bin(x,L);
%%%%%%%%%%%%%%%%%
y1=t1(:,5);
y2=t2(:,5);
% %changing pixel value
a=length(t1(:,1));
J=I;
for i=1:ix
    for j=1:iy
        
        b=I(i,j);
        temp1=b;
        temp2=changePixVal(t1,a,b,5);
        temp3=(y2==temp2);
        temp4=[];
        for k=1:length(temp3)
            if temp3(k)==1
                temp4=[temp4,k];
            end
        end
        if sum(temp3)==0
            mn=min(abs(t2(:,5)-temp2));
            temp4o=(mn==abs(t2(:,5)-temp2));
            for k=1:length(temp4o)
                if temp4o(k)==1
                    break
                end
            end
            temp4=k;
        end
        temp5=(min(abs(t2(temp4,1)-temp1))==abs(t2(temp4,1)-temp1));
        %temp5=max(t2(temp4,2))==t2(temp4,2);
        for k=1:length(temp5)
            if temp5(k)==1
                temp6=temp4(k);
                break
            end
        end
        J(i,j)=t2(temp6,1);
    end
end
if verbose_fig==1
    %hist_source
    subplot(1,3,1)
    [out1(:,1),out1(:,2)]=hist_freq(x);
    stem(out1(:,1),out1(:,2))
    title('hist source')
    %hist_target
    subplot(1,3,2)
    [out2(:,1),out2(:,2)]=hist_freq(I);
    stem(out2(:,1),out2(:,2))
    title('hist target')
    %hist_result
    subplot(1,3,3)
    [out3(:,1),out3(:,2)]=hist_freq(J);
    stem(out3(:,1),out3(:,2))
    title('hist result')
end
end

