 1787  rosparam get /space_nav_message_router/default 
 1788  rostopic list
 1789  rostopic echo /spacenav/joy 
 1790  ls
 1791  cd emorobot_common/emorobot_3dmouse_control/
 1792  ls
 1793  cd ros/
 1794  ls
 1795  cd config/
 1796  ls
 1797  nano 3dmouse_router_config.yaml 
 1798  cd ..
 1799  ls
 1800  rostopic echo /joy/base 
 1801  ls
 1802  cd ..
 1803  ls
 1804  cd ..
 1805  ls
 1806  cd emorobot_
 1807  cd emorobot_bringup/
 1808  ls
 1809  cd ros/
 1810  ls
 1811  cd launch/
 1812  ls
 1813  nano jonny.launch 
 1814  cd ..
 1815  ls
 1816  cd ..
 1817  ls
 1818  cd emorobot_3dmouse_control/
 1819  ls
 1820  cd ros/
 1821  ls
 1822  sudo updatedb
 1823  rostopic echo /cmd_vel 
 1824  /etc/
 1825  cd /etc/
 1826  ls
 1827  sudo nano hosts
 1828  cd
 1829  roscd
 1830  cd ../src/emorobot-ros-pkg/
 1831  ls
 1832  cd emorobot_common/
 1833  ls
 1834  cd emorobot_3dmouse_control/
 1835  ls
 1836  cd ros/
 1837  ls
 1838  cd config/
 1839  ls
 1840  nano 3dmouse_router_config.yaml 
 1841  rosrun rqt_graph rqt_graph 
 1842  nano .bashrc 
 1843  bash
 1844  ping volksbot
 1845  rostopic list
 1846  rosrun tf view_frames frames
 1847  rosrun tf view_frames
 1848  evince frames.pdf 
 1849  roscd
 1850  cd ..
 1851  ls
 1852  cd src/
 1853  ls
 1854  git clone git@bitbucket.org:shehzi001/emorobot-ros-pkg.git
 1855  git clone https://shehzi001@bitbucket.org/shehzi001/emorobot-ros-pkg.git
 1856  ls
 1857  cd emorobot-ros-pkg/
 1858  ls
 1859  cd ..
 1860  catkin_make 
 1861  ls
 1862  cd devel/
 1863  ls
 1864  cd lib/
 1865  ls
 1866  cd ..
 1867  ls
 1868  cd build/
 1869  ls
 1870  cd ..
 1871  ls
 1872  cd src/
 1873  ls
 1874  cd emorobot-ros-pkg/
 1875  ls
 1876  cd ..
 1877  cd src/
 1878  ls
 1879  cd emorobot-ros-pkg/
 1880  ls
 1881  cd emorobot_
 1882  cd emorobot_common/
 1883  ls
 1884  cd emorobot_
 1885  cd emorobot_bringup/
 1886  ls
 1887  cd ros/
 1888  ls
 1889  cd launch/
 1890  ls
 1891  roslaunch jonny.launch 
 1892  sudo apt-get install ros-hydro-spacenav-node 
 1893  roslaunch jonny.launch 
 1894  find 3dmouse_router_config.yaml
 1895  locate 3dmouse_router_config.yaml
 1896  cd ..
 1897  ls
 1898  cd ..
 1899  ls
 1900  cd ..
 1901  ls
 1902  cd emorobot_3dmouse_control/
 1903  ls
 1904  cd ros/
 1905  ls
 1906  cd launch/
 1907  ls
 1908  cd ..
 1909  ls
 1910  cd config/
 1911  ls
 1912  nano 3dmouse_router_config.yaml 
 1913  cd ..
 1914  ls
 1915  cd launch/
 1916  ls
 1917  roslaunch 3dmouse.launch 
 1918  roscd
 1919  cd ..
 1920  ls
 1921  cd src/
 1922  ls
 1923  cd emorobot-ros-pkg/
 1924  ls
 1925  cd emorobot_common/
 1926  ls
 1927  cd ..
 1928  ls
 1929  git branch
 1930  git remote -v
 1931  git remote add upstream https://shehzi001@bitbucket.org/emorobot/emorobot-ros-pkg.git
 1932  git remote -v
 1933  git pull upstream develop
 1934  rostopic list 
 1935  nano bashrc
 1936  nano .bashrc 
 1937  rosrun rqt_graph rqt_graph 
 1938  nano .bashrc 
 1939  source ~/.bashrc 
 1940  rosrun emorobot_rqt emorobot_rqt 
 1941  apt-cache search katana
 1942  ls
 1943  roscd
 1944  ls
 1945  cd .
 1946  cd ..
 1947  ls
 1948  cd src/
 1949  ls
 1950  git clone git@github.com:mfueller/katana_driver.git
 1951  ls
 1952  cd ..
 1953  cd src/
 1954  ls
 1955  cd katana_driver/
 1956  ls
 1957  git branch 
 1958  git checkout hydro_dev 
 1959  git branch 
 1960  git status
 1961  ls
 1962  cd katana_arm_gazebo/
 1963  ls
 1964  roscd
 1965  cd ..
 1966  catkin_make
 1967  ls
 1968  roscd katana_msgs
 1969  cd ..
 1970  ls
 1971  cd katana_msgs/
 1972  ls
 1973  cd msg/
 1974  ls
 1975  cd ..
 1976  catkin_make --pkg katana_msgs
 1977  rosrun emorobot_rqt emorobot_rqt 
 1978  roscd
 1979  cd ..
 1980  catkin_make --pkg katana_msgs
 1981  roscd katana_msgs/
 1982  ls
 1983  nano package.xml 
 1984  cd ..
 1985  cd
 1986  roscd
 1987  cd ..
 1988  catkin_make clean
 1989  catkin_make
 1990  ls
 1991  roslaunch emorobot_bringup jonny.launch 
 1992  source ~/.bashrc 
 1993  roslaunch emorobot_bringup jonny.launch 
 1994  cd
 1995  nano .bashrc 
 1996  source ~/.bashrc 
 1997  cd ros_ws/
 1998  ls
 1999  cd hydro/
 2000  ks
 2001  ls
 2002  cd rm
 2003  cd emo_robot/
 2004  ls
 2005  catkin_make
 2006  ls
 2007  cd src/
 2008  ls
 2009  cd emorobot-ros-pkg/
 2010  ls
 2011  cd ..
 2012  ls
 2013  cd emorobot-ros-pkg/
 2014  ls
 2015  cd emorobot_rqt/
 2016  ls
 2017  cd src/
 2018  ls
 2019  cd emorobot_rqt/
 2020  ls
 2021  cd ..
 2022  ls
 2023  cd ..
 2024  ls
 2025  nano CMakeLists.txt 
 2026  cd
 2027  cd ros_ws/hydro/emo_robot/
 2028  ls
 2029  catkin_make
 2030  ls
 2031  cd src/emorobot-ros-pkg/
 2032  ls
 2033  cd emorobot_rqt/
 2034  ls
 2035  nano CMakeLists.txt 
 2036  cd ..
 2037  catkin_make
 2038  ls
 2039  cd src/
 2040  ls
 2041  git clone git@github.com:mfueller/katana_driver.git
 2042  cd ..
 2043  catkin_make
 2044  catkin_make clean 
 2045  catkin_make
 2046  ls
 2047  rm -rf build/ devel/
 2048  ls
 2049  catkin_make
 2050  l
 2051  ls
 2052  cd src/
 2053  ls
 2054  cd katana_driver/
 2055  ls
 2056  git branch 
 2057  git fetch origin 
 2058  git branch 
 2059  git fetch origin hydro_dev:hydro_dev
 2060  git branch 
 2061  git checkout hydro_dev 
 2062  cd ..
 2063  catkin_make
 2064  catkin_make --pkg katana_msgs
 2065  cd
 2066  nano .bashrc 
 2067  source ~/.bashrc 
 2068  rosrun emorobot_rqt emorobot_rqt 
 2069  history >> jhonnysetup.md
