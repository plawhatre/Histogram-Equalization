function [J,T] = histeq_17510056(I,x,verbose_fig)
%I is the image
%x can either be number of bins (n) or it can be (hgram)
%verbose_fig for histograms,labels and title
if nargin==1
    %histeq(I)
    [J,T]=he_I(I);
end
if nargin==2
    if numel(x)==1
        %histeq(I,n)
        J=he_I_n(I,x);
    else
        %histeq(I,hgram)
        J=he_I_hgram(I,x);
    end
end
if nargin==3
    %histeq(I,I1,verbose_fig)
    J=he_I_x_vrb(I,x,verbose_fig);
end
end

