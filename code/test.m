clc,clear,close all
addpath('input_img')
%input image
list = {'valley','cameraman','pout'};
[index] = listdlg('ListString',list,'SelectionMode','single');
if index==1
    I=im2double(imread('1.jpg'));
end
if index==2
    I=im2double(imread('cameraman.tif'));
end
if index==3
    I=im2double(imread('pout.tif'));
end
%input format of the function
list = {'histeq(I)','histeq(I,n)','histeq(I,hgram)','histeq(I,I1,verbose_fig)'};
[index] = listdlg('ListString',list,'SelectionMode','single');
if index==1
    [J,T]=histeq_17510056(I);
end
if index==2
    prompt={'n'}
    title='n';
    definput={'200'}
    p=inputdlg(prompt,title,1,definput);
    n=str2num(p{1});
    J=histeq_17510056(I,n);
end
if index==3
    prompt={'hgram'}
    title='hgram';
    definput={'[10 20 30 40 50 60 70 80 90 100 120 140 160 180 200 220 240]'}
    p=inputdlg(prompt,title,1,definput);
    hgram=str2num(p{1});
    J=histeq_17510056(I,hgram);
end
if index==4
    msgbox('provide I1 image')
    list = {'valley','cameraman','pout'};
    [index] = listdlg('ListString',list,'SelectionMode','single');
    if index==1
        I1=im2double(imread('1.jpg'));
    end
    if index==2
        I1=im2double(imread('cameraman.tif'));
    end
    if index==3
        I1=im2double(imread('pout.tif'));
    end
    %%%%
    list = {'verbose_fig=0','verbose_fig=1'};
    [index] = listdlg('ListString',list,'SelectionMode','single');
    if index==1
        verbose_fig=0;
    else
        verbose_fig=1;
    end
    J=histeq_17510056(I,I1,verbose_fig);
end
