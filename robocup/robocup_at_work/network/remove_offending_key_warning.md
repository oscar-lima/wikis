

problem: when doing ssh i receive this message:
------------------------------
Warning: the ECDSA host key for 'youbot-brsu-1-pc1' differs from the key for the IP address '192.168.1.111'
Offending key for IP in /home/oscar/.ssh/known_hosts:32
Matching host key in /home/oscar/.ssh/known_hosts:39
Are you sure you want to continue connecting (yes/no)?
------------------------------

information to solve was taken from:

http://superuser.com/questions/421004/how-to-fix-warning-about-ecdsa-host-key

1. Remove the cached key for 192.168.1.111 on the local machine:

		ssh-keygen -R 192.168.1.111

2. Done!

Now you should ssh without the warning
