clc
clear all
close all

% Load Sample frame
I1_rgb = imread('m111.jpg');
I2_rgb = imread('m222.jpg');
% Convert the sample frame to gray scale
I1 = rgb2gray(I1_rgb);
I2 = rgb2gray(I2_rgb);

% Visualize the original images
figure
subplot(1,2,1)
imshow(I1_rgb) 
title('Original Frame 1')

subplot(1,2,2)
imshow(I2_rgb) 
title('Original Frame 2')
%set(gcf,'position',[x0,y0,width,height])
set(gcf,'position',[150,150,880,420])

% Visualize the Gray scale images
figure
subplot(1,2,1)
imshow(I1) 
title('Grayed Frame 1')

subplot(1,2,2)
imshow(I2) 
title('Grayed Frame 2')
set(gcf,'position',[150,150,880,420])


%Find the Feature.

points1 = detectSURFFeatures(I1)
points2 = detectSURFFeatures(I2)

% Visualize the Features
figure
subplot(1,2,1)
imshow(I1_rgb) 
hold on;
plot(points1)
title('All features Frame 1')
subplot(1,2,2)
imshow(I2_rgb) 
hold on;
plot(points2)
title('All features Frame 2')
set(gcf,'position',[150,150,880,420])

% Find the Specefic Feature
% specfic_feature1 = selectStrongest(points1,200)
% specfic_feature2 = selectStrongest(points2,200)

%'MetricThreshold' => , 1000.0 (default) Strongest feature threshold, To return more blobs, decrease the value of this threshold.
% 'NumOctaves' =>  Number of octaves, 3 (default), Increase this value to detect larger blobs. Recommended values are between 1 and 4.

% Find the Specefic Feature
specfic_feature1 = detectSURFFeatures(I1,'MetricThreshold',2000, 'NumOctaves',1);
specfic_feature2 = detectSURFFeatures(I2, 'MetricThreshold',2000, 'NumOctaves',1);

points1= specfic_feature1;
points2= specfic_feature2;

figure
subplot(1,2,1)
imshow(I1_rgb) 
hold on;
plot(specfic_feature1)
title('Specefic features Frame 1')
subplot(1,2,2)
imshow(I2_rgb) 
hold on;
plot(specfic_feature2)
title('Specefic features Frame 2')
set(gcf,'position',[150,150,880,420])



%Extract the neighborhood features.
[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

figure
subplot(1,2,1)
imshow(I1_rgb) 
hold on;
plot(valid_points1)
title('Extracted features Frame 1')
subplot(1,2,2)
imshow(I2_rgb) 
hold on;
plot(valid_points2)
title('Extracted features Frame 2')
set(gcf,'position',[150,150,880,420])


%Match the features.
indexPairs = matchFeatures(features1,features2);

%Retrieve the locations of the corresponding points for each image.
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

%Visualize the corresponding points. You can see the effect of translation between the two images despite several erroneous matches.
figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,'montage');