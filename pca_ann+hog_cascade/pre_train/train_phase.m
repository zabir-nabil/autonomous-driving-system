positive_ins = vertex_roi;

pos_dir = fullfile('R:\3-2 Project\ML_Approach\Dataset\vertex');

addpath(pos_dir);

neg_dir = fullfile('R:\3-2 Project\ML_Approach\Dataset\vertex_neg');

trainCascadeObjectDetector('vertex.xml',positive_ins,neg_dir,...
    'NumCascadeStages',12,'FeatureType','HOG','FalseAlarmRate',0.0001);