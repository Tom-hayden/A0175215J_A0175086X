function sucessRateTesting = networkTesting(net,data,target)
% tests the network on the test batch.
x = data';
t = target';
y = net(x);
e = gsubtract(t,y);
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
plotConf(t,y)
sucessRateTesting = 1- percentErrors

end
