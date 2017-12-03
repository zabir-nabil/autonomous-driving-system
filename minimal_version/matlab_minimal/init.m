function bdevice = init()
% Execute these lines for faster bluetooth communication
bt = Bluetooth('HC-05',1);
fopen(bt);
bdevice = bt;

end