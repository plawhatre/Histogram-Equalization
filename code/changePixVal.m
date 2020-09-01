function [out] = changePixVal(t,a,b,c)
for k=1:a
    if t(k,1)==b
        break
    end
end
out=t(k,c);
end

