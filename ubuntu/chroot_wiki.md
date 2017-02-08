chroot commands
===============

1) install dependencies:

        sudo apt−get install debootstrap schroot

2) create jail folder:

        sudo mkdir /chroot-precise

3) install ubuntu required distribution on jail folder:

        sudo debootstrap precise /chroot-precise http://de.archive.ubuntu.com/ubuntu/

4) configure chroot:

        sudo nano /etc/schroot/schroot.conf

add:
        [precise]
        description=Ubuntu12.04Precise
        type=directory
        directory=/chroot-precise
        users=oscar

5) acces your chroot environment:

        schroot -c precise

6) If your home folder is not writable, do:

        chmod -R u+w /home/oscar

7) add sources:

        sudo apt-get install nano
        sudo nano /etc/apt/source.list


deb h t t p : / / m i r r o r . n e t c o l o g n e . de / ubuntu / p r e c i s e m u l t i v e r s e
deb−s r c h t t p : / / m i r r o r . n e t c o l o g n e . de / ubuntu / p r e c i s e m u l t i v e r s e
deb h t t p : / / m i r r o r . n e t c o l o g n e . de / ubuntu / p r e c i s e −u p d a t e s m u l t i v e r s e
deb−s r c h t t p : / / m i r r o r . n e t c o l o g n e . de / ubuntu / p r e c i s e −u p d a t e s
multiverse
deb h t t p : / / m i r r o r . n e t c o l o g n e . de / ubuntu / p r e c i s e −b a c k p o r t s main
restricted universe multiverse
deb−s r c h t t p : / / m i r r o r . n e t c o l o g n e . de / ubuntu / p r e c i s e −b a c k p o r t s main
restricted universe multiverse
deb h t t p : / / s e c u r i t y . ubuntu . com/ ubuntu p r e c i s e −s e c u r i t y main
restricted
deb−s r c h t t p : / / s e c u r i t y . ubuntu . com/ ubuntu p r e c i s e −s e c u r i t y main
restricted
deb h t t p : / / s e c u r i t y . ubuntu . com/ ubuntu p r e c i s e −s e c u r i t y u n i v e r s e
deb−s r c h t t p : / / s e c u r i t y . ubuntu . com/ ubuntu p r e c i s e −s e c u r i t y u n i v e r s e
deb h t t p : / / s e c u r i t y . ubuntu . com/ ubuntu p r e c i s e −s e c u r i t y m u l t i v e r s e
deb−s r c h t t p : / / s e c u r i t y . ubuntu . com/ ubuntu p r e c i s e −s e c u r i t y
multiverse
deb h t t p : / / a r c h i v e . c a n o n i c a l . com/ ubuntu p r e c i s e p a r t n e r
deb−s r c h t t p : / / a r c h i v e . c a n o n i c a l . com/ ubuntu p r e c i s e p a r t n e r
deb h t t p : / / e x t r a s . ubuntu . com/ ubuntu p r e c i s e main
deb−s r c h t t p : / / e x t r a s . ubuntu . com/ ubuntu p r e c i s e main