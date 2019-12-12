%%Test Face
clc;
close all;
[fname, path] = uigetfile('.png','Provide a face for testing');
fname = strcat(path,fname);
im = imread(fname);
imshow(im);
title('Test Face');
%%Find out the class
Ftest = FeatureStatistical(im);
%%Compare
load db.mat
Ftrain = db(:,1:2);
Ctrain = db(:,3);
for(i=1:size(Ftrain,1))
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
m = find(dist==min(dist),1);
det_class=Ctrain(m);
msgbox(strcat('Detected Class=' , num2str(det_class)));