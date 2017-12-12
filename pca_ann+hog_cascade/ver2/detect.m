function [sign,ixR,lastbbeR,nowbbeR,bbarrR,bx] = detect(img,detector,...
    ixS,lastbbeS,nowbbeS,bbarrS)
sign = 0;
ixR = ixS;
bx = [0 0 0 0];
lastbbeR = lastbbeS;
nowbbeR = nowbbeS;
bbarrR = bbarrS;

vf = img;
bbox = step(detector,vf);
if(isempty(bbox))
    lastbbeR = nowbbeR;
    nowbbeR = 1;
else
    lastbbeR = nowbbeR;
    nowbbeR = 0;
end

if lastbbeR==1 && nowbbeR == 1
    ixR = 1;
end
if(isempty(bbox)==0)
bbox = bbox(1,:);
else
ixR = 1;
end

if ixR <= 5 && isempty(bbox)==0
    bbarr(ixR,:) = bbox;
    ixR = ixR+1;
end
bratio = 0.00;
if ixR > 5 && isempty(bbox)==0
    bbarrR(1,:) = bbarrR(2,:);
    bbarrR(2,:) = bbarrR(3,:);
    bratio = bboxOverlapRatio(bbarrR(1,:),bbarrR(2,:));
    bbarrR(3,:) = bbarrR(4,:);
    bratio = bratio*bboxOverlapRatio(bbarrR(2,:),bbarrR(3,:));
    bbarr(4,:) = bbarr(5,:);
    bratio = bratio*bboxOverlapRatio(bbarrR(3,:),bbarrR(4,:));
    bbarr(5,:) = bbox;
    bratio = bratio*bboxOverlapRatio(bbarrR(4,:),bbarrR(5,:));
end

if(bratio>0.3)
sign = 1;
bx = bbox;
end


end

