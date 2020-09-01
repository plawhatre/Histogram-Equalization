function [y] = form_mat(v,n)
y=[];
for i=1:length(v)
    num=round(v.*n);
    x=ones(1,num(i))*v(i);
    y=[y,x];
end

