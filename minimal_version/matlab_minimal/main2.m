function yy = main2()
btcmd = 1;
my_bt = init();
url=('http://192.168.43.1:8080/shot.jpg?rnd=350264');
cnt = 1;
    hVideoIn = vision.VideoPlayer('Name', 'Final Video');
    while(1)
        %step(hVideoIn,ss)
        mov = imread(url);
        
        
[mov, keyt, lcorner, rcorner, r, c]=backend(mov);


mov(r-34:r-5,lcorner:lcorner+3,1) = 255;
mov(r-34:r-5,lcorner:lcorner+3,2) = 0;
mov(r-34:r-5,lcorner:lcorner+3,3) = 0;
mov(r-34:r-5,rcorner-3:rcorner,1) = 255;
mov(r-34:r-5,rcorner-3:rcorner,2) = 0;
mov(r-34:r-5,rcorner-3:rcorner,3) = 0;

obs_det = 0;
if btcmd == 0
   obs_det = bt_req_pid(my_bt,lcorner-1,c-rcorner,1);
end

if btcmd == 1
    obs_det = bt_req_pid(my_bt,lcorner-1,c-rcorner,0);
end

if obs_det == 1
    mov = insertText(mov,[1 80;1 80],'Obstacle found. Stopped...',...
    'FontSize',20,'BoxColor',{'red'},'BoxOpacity',0.3,...
    'TextColor','white');
end

imshow(mov)

if(keyt==1)
    disp('Yield Sign')
    disp(cnt);
    cnt = cnt+1;
elseif(keyt==2)
    disp('Stop Sign')
    disp(cnt);
    cnt = cnt+1;
    if cnt == 15
        btcmd = 0;
    end
        
end
    end
    

end