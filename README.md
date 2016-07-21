# What for ?
This container brings zeronet AND tor as client.
I know that we should split but, for simplicity and quick install.

# Prerequisites
Create a file named *zeronet.conf* in your data folder on the host with contents as below:
```
    [global]
    ui_password = password_you_want
```

# How to use this image
    $ docker run -d -v <local_data_folder>:/home/zeronet/ZeroNet/data \
           -p 15441:15441 \
           -p 43110:43110 \
           binerf/zeronet_tor

Then access to URL http://HOST_IP:43110/
(possibility to configure an nginx instance as proxy in front of your zeronet container) 

# Special
* a specific user (*zeronet*) is created to run zeronet process and not root 
