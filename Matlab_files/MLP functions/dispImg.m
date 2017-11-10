function dispImg(Img)
%Displayes a passed image from the CIFAR-10 dataset.
figure()
image = uint8(reshape(Img,[32,32,3]));
image = rot90(image,3);
imshow(image);

end