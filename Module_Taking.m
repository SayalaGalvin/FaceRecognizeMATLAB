%% Taking an Image
clc;
close all;
[fname, path] = uigetfile('.png','Open a Face as input for Training');
fname = strcat(path,fname);
im = imread(fname);
imshow(im);
title('Input Face');
c = input('Enter the class');

%% Feature Extraction
F = FeatureStatistical(im);
try
    load db;
    F=[F c];
    db=[db; F];
    save db.mat db
catch
    db = [F c];
    save db.mat db
end