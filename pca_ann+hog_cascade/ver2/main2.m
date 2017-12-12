function yy = main2()

%my_bt = init();
url=('http://192.168.43.1:8080/shot.jpg?rnd=350264');

% detectorSt = vision.CascadeObjectDetector('stop_sign.xml');
% ixSt = 1;
% lastbbeSt = 1;
% nowbbeSt = 1;
% bbarrSt = zeros(5,4);


detectorLt = vision.CascadeObjectDetector('left_turn.xml');
ixLt = 1;
lastbbeLt = 1;
nowbbeLt = 1;
bbarrLt = zeros(5,4);


detectorRt = vision.CascadeObjectDetector('right_turn.xml');
ixRt = 1;
lastbbeRt = 1;
nowbbeRt = 1;
bbarrRt = zeros(5,4);

detectorVt = vision.CascadeObjectDetector('vertex.xml');
ixVt = 1;
lastbbeVt = 1;
nowbbeVt = 1;
bbarrVt = zeros(5,4);
hVideoIn = vision.VideoPlayer('Name', 'Final Video');
while(1)
sign_d = 0;

mov = imread(url);
step(hVideoIn,mov);

% mov = gpuArray(readFrame(vidObj));
% 
% [lcorner, rcorner, r, c]=backend(mov);
% 
% mov(r-34:r-5,lcorner:lcorner+3,1) = 255;
% mov(r-34:r-5,lcorner:lcorner+3,2) = 0;
% mov(r-34:r-5,lcorner:lcorner+3,3) = 0;
% mov(r-34:r-5,rcorner-3:rcorner,1) = 255;
% mov(r-34:r-5,rcorner-3:rcorner,2) = 0;
% mov(r-34:r-5,rcorner-3:rcorner,3) = 0;

%imshow(mov);


% bbox = step(detectorSt,mov);
% if(isempty(bbox))
%     lastbbeSt = nowbbeSt;
%     nowbbeSt = 1;
% else
%     lastbbeSt = nowbbeSt;
%     nowbbeSt = 0;
% end
% 
% if lastbbeSt==1 && nowbbeSt == 1
%     ixSt = 1;
% end
% if(isempty(bbox)==0)
% bbox = bbox(1,:);
% end
% if ixSt <= 5 && isempty(bbox)==0
%     bbarrSt(ixSt,:) = bbox;
%     ixSt = ixSt+1;
% end
% bratio = 0.00;
% if ixSt > 5 && isempty(bbox)==0
%     bbarrSt(1,:) = bbarrSt(2,:);
%     bbarrSt(2,:) = bbarrSt(3,:);
%     bratio = bboxOverlapRatio(bbarrSt(1,:),bbarrSt(2,:));
%     bbarrSt(3,:) = bbarrSt(4,:);
%     bratio = bratio*bboxOverlapRatio(bbarrSt(2,:),bbarrSt(3,:));
%     bbarrSt(4,:) = bbarrSt(5,:);
%     bratio = bratio*bboxOverlapRatio(bbarrSt(3,:),bbarrSt(4,:));
%     bbarrSt(5,:) = bbox;
%     bratio = bratio*bboxOverlapRatio(bbarrSt(4,:),bbarrSt(5,:));
% end
% 
% if(bratio>0.3)
% mov = insertObjectAnnotation(mov,'rectangle',bbox,'Strong Vertex');
% sign_d = 1; % stop
% end







bbox = step(detectorLt,mov);
if(isempty(bbox))
    lastbbeLt = nowbbeLt;
    nowbbeLt = 1;
else
    lastbbeLt = nowbbeLt;
    nowbbeLt = 0;
end

if lastbbeLt==1 && nowbbeLt == 1
    ixLt = 1;
end
if(isempty(bbox)==0)
bbox = bbox(1,:);
end
if ixLt <= 5 && isempty(bbox)==0
    bbarrLt(ixLt,:) = bbox;
    ixLt = ixLt+1;
end
bratio = 0.00;
if ixLt > 5 && isempty(bbox)==0
    bbarrLt(1,:) = bbarrLt(2,:);
    bbarrLt(2,:) = bbarrLt(3,:);
    bratio = bboxOverlapRatio(bbarrLt(1,:),bbarrLt(2,:));
    bbarrLt(3,:) = bbarrLt(4,:);
    bratio = bratio*bboxOverlapRatio(bbarrLt(2,:),bbarrLt(3,:));
    bbarrLt(4,:) = bbarrLt(5,:);
    bratio = bratio*bboxOverlapRatio(bbarrLt(3,:),bbarrLt(4,:));
    bbarrLt(5,:) = bbox;
    bratio = bratio*bboxOverlapRatio(bbarrLt(4,:),bbarrLt(5,:));
end
bratio
if(bratio>0.0050)
mov = insertObjectAnnotation(mov,'rectangle',bbox,'Left Turn');
sign_d = 2; % left
end








bbox = step(detectorRt,mov);
if(isempty(bbox))
    lastbbeRt = nowbbeRt;
    nowbbeRt = 1;
else
    lastbbeRt = nowbbeRt;
    nowbbeRt = 0;
end

if lastbbeRt==1 && nowbbeRt == 1
    ixRt = 1;
end
if(isempty(bbox)==0)
bbox = bbox(1,:);
end
if ixRt <= 5 && isempty(bbox)==0
    bbarrRt(ixRt,:) = bbox;
    ixRt = ixRt+1;
end
bratio = 0.00;
if ixRt > 5 && isempty(bbox)==0
    bbarrRt(1,:) = bbarrRt(2,:);
    bbarrRt(2,:) = bbarrRt(3,:);
    bratio = bboxOverlapRatio(bbarrRt(1,:),bbarrRt(2,:));
    bbarrRt(3,:) = bbarrRt(4,:);
    bratio = bratio*bboxOverlapRatio(bbarrRt(2,:),bbarrRt(3,:));
    bbarrRt(4,:) = bbarrRt(5,:);
    bratio = bratio*bboxOverlapRatio(bbarrRt(3,:),bbarrRt(4,:));
    bbarrRt(5,:) = bbox;
    bratio = bratio*bboxOverlapRatio(bbarrRt(4,:),bbarrRt(5,:));
end

if(bratio>0.005)
mov = insertObjectAnnotation(mov,'rectangle',bbox,'Right Turn');
sign_d = 3; % right
end








bbox = step(detectorVt,mov);
if(isempty(bbox))
    lastbbeVt = nowbbeVt;
    nowbbeVt = 1;
else
    lastbbeVt = nowbbeVt;
    nowbbeVt = 0;
end

if lastbbeVt==1 && nowbbeVt == 1
    ixVt = 1;
end
if(isempty(bbox)==0)
bbox = bbox(1,:);
end
if ixVt <= 5 && isempty(bbox)==0
    bbarrVt(ixVt,:) = bbox;
    ixVt = ixVt+1;
end
bratio = 0.00;
if ixVt > 5 && isempty(bbox)==0
    bbarrVt(1,:) = bbarrVt(2,:);
    bbarrVt(2,:) = bbarrVt(3,:);
    bratio = bboxOverlapRatio(bbarrVt(1,:),bbarrVt(2,:));
    bbarrVt(3,:) = bbarrVt(4,:);
    bratio = bratio*bboxOverlapRatio(bbarrVt(2,:),bbarrVt(3,:));
    bbarrVt(4,:) = bbarrVt(5,:);
    bratio = bratio*bboxOverlapRatio(bbarrVt(3,:),bbarrVt(4,:));
    bbarrVt(5,:) = bbox;
    bratio = bratio*bboxOverlapRatio(bbarrVt(4,:),bbarrVt(5,:));
end

if(bratio>0.0055)
mov = insertObjectAnnotation(mov,'rectangle',bbox,'Stop here...');
sign_d = 4; % vertex
end





% 
% [s,ix,lb,nb,br,bx] = detect(mov,detectorLt,ixLt,lastbbeLt,nowbbeLt,...
%     bbarrLt);
% ixLt = ix;
% lastbbeLt = lb;
% nowbbeLt = nb;
% bbarrLt = br;
% bbox = bx;
% if s==1
% mov = insertObjectAnnotation(mov,'rectangle',bbox,'Left Turn');
% sign_d = 2; % left 2
% end
% 
% [s,ix,lb,nb,br,bx] = detect(mov,detectorRt,ixRt,lastbbeRt,nowbbeRt,...
%     bbarrRt);
% ixRt = ix;
% lastbbeRt = lb;
% nowbbeRt = nb;
% bbarrRt = br;
% bbox = bx;
% if s==1
% mov = insertObjectAnnotation(mov,'rectangle',bbox,'Right Turn');
% sign_d = 3; % right 3
% end
% 
% [s,ix,lb,nb,br,bx] = detect(mov,detectorVt,ixVt,lastbbeVt,nowbbeVt,...
%     bbarrVt);
% ixVt = ix;
% lastbbeVt = lb;
% nowbbeVt = nb;
% bbarrVt = br;
% bbox = bx;
% if s==1
% mov = insertObjectAnnotation(mov,'rectangle',bbox,'Vertex');
% sign_d = 4; % vertex 4
% end

%bt_req_pid(my_bt,lcorner-1,c-rcorner,sign_d);
imshow(mov)

end
end
