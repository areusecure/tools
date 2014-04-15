#!/bin/sh
# Searches for Heartbleed heart-beat-packets, drops and logs attempts to exploit the vulnerability
# By Jonathan James (jj@areusecure.se)
# Educational only. ONLY use if you know what you are doing. Areusecure AB or Jonathan James accepts no responsibility whatsoever.
iptables=`which iptables`
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 -m string --hex-string "|180300|" --algo bm --tcp-flags SYN,ACK,FIN,RST,PSH ACK,PSH -j LOG --log-prefix "Heartbleed SSLv3 attempt (CVE-2014-0160): " --log-level 7
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 --dport 443 -m string --hex-string "|180301|" --algo bm --tcp-flags SYN,ACK,FIN,RST,PSH ACK,PSH -j LOG --log-prefix "Heartbleed TLSv1 attempt (CVE-2014-0160): " --log-level 7
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 --dport 443 -m string --hex-string "|180302|" --algo bm --tcp-flags SYN,ACK,FIN,RST,PSH ACK,PSH -j LOG --log-prefix "Heartbleed TLSv1.1 attempt (CVE-2014-0160): " --log-level 7
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 --dport 443 -m string --hex-string "|180303|" --algo bm --tcp-flags SYN,ACK,FIN,RST,PSH ACK,PSH -j LOG --log-prefix "Heartbleed TLSv1.2 attempt CVE-2014-0160): " --log-level 7
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 -m string --hex-string "|180300|" --algo bm -j DROP
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 -m string --hex-string "|180301|" --algo bm -j DROP
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 -m string --hex-string "|180302|" --algo bm -j DROP
$iptables -t raw -A PREROUTING -p tcp -m tcp -m multiport --dports 25,80,443,465,995,8080,8000 -m string --hex-string "|180303|" --algo bm -j DROP
