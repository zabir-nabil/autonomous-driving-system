vid = VideoReader('vertex_test.mp4');
detector = vision.CascadeObjectDetector('vertex.xml');
ix = 1;
lastbbe = 1;
nowbbe = 1;
bbarr = zeros(5,4);
while hasFrame(vid)
vf = readFrame(vid);
detectedImg = vf;
bbox = step(detector,vf);
if(isempty(bbox))
    lastbbe = nowbbe;
    nowbbe = 1;
else
    lastbbe = nowbbe;
    nowbbe = 0;
end

if lastbbe==1 && nowbbe == 1
    ix = 1;
end
if(isempty(bbox)==0)
bbox = bbox(1,:);
end
if ix <= 5 && isempty(bbox)==0
    bbarr(ix,:) = bbox;
    ix = ix+1;
end
bratio = 0.00;
if ix > 5 && isempty(bbox)==0
    bbarr(1,:) = bbarr(2,:);
    bbarr(2,:) = bbarr(3,:);
    bratio = bboxOverlapRatio(bbarr(1,:),bbarr(2,:));
    bbarr(3,:) = bbarr(4,:);
    bratio = bratio*bboxOverlapRatio(bbarr(2,:),bbarr(3,:));
    bbarr(4,:) = bbarr(5,:);
    bratio = bratio*bboxOverlapRatio(bbarr(3,:),bbarr(4,:));
    bbarr(5,:) = bbox;
    bratio = bratio*bboxOverlapRatio(bbarr(4,:),bbarr(5,:));
end

if(bratio>0.3)
detectedImg = insertObjectAnnotation(vf,'rectangle',bbox,'Strong Vertex');

%detectedImg = insertObjectAnnotation(vf,'rectangle',bbox,'?????????????????');
end
imshow(detectedImg);
end