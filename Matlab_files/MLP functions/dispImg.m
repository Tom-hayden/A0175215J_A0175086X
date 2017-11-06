function dispImg(Img)

figure()
image = uint8(reshape(Img,[32,32,3]));
image = rot90(image,3);
imshow(image);

end