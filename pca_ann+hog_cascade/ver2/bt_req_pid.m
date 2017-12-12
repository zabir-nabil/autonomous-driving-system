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

if ssign == 2 
    response = 5;
end

if ssign == 3 
    response = 6;
end

if ssign == 4 
    response = 7;
end

fwrite(bt,response);

end