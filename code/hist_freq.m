function [x,y] = hist_freq(A)
a=A(:);
x=unique(a);
y=0.*x;
for i=1:length(a)
    for j=1:length(x)
        if a(i)==x(j)
            y(j)=y(j)+1;
            break
        end
    end
end
end

