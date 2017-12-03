function x = bt_req_pid(bt, ldiff, rdiff,ssign)
x = (ldiff + rdiff)*0;
response = 1;


if ldiff > rdiff 
    response = 2;
end
if ldiff < rdiff
    response = 3;
end

if ssign == 1 
    response = 4;
end

fwrite(bt,response);

is_obs = fscanf(bt,'%d');

x = x + is_obs;

end