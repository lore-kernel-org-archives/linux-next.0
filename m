From: Xiong Zhou <xzhou@redhat.com>
Subject: linux-next memleak after IO on dax mountpoint
Date: Fri, 27 May 2016 16:46:17 +0800
Message-ID: <20160527084617.GD2933@dhcp12-144.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45004 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932456AbcE0IqU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 May 2016 04:46:20 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, axboe@fb.com, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org
Cc: linux-kernel@vger.kernel.org

Hi,

Reporting an oom/memleak issue in linux-next tree:

#Description:

dbench invokes oom-killer, make host unavaiable.

dbench was doing IO on nvdimm device mounted fs with dax mount option.
It happens on both xfs and ext4 filesystems.
It does not happen testing without dax mountoption.

Seems like memleak keep happening untill system run out of memory. On
good kernels, memory get freed after every dbench run.

#Hardware
lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                48
On-line CPU(s) list:   0-47
Thread(s) per core:    2
Core(s) per socket:    12
Socket(s):             2
NUMA node(s):          2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz
Stepping:              2
CPU MHz:               2596.781
BogoMIPS:              5200.05
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              30720K
NUMA node0 CPU(s):     0-11,24-35
NUMA node1 CPU(s):     12-23,36-47

free -g
              total        used        free      shared  buff/cache   available
Mem:             31           0          30           0           0          30
Swap:             9           0           9

#Version:
Since next-20150517 tree, till latest 0526 tree.
0516 tree survives testing.
dbench version 4.00 - Copyright Andrew Tridgell 1999-2004

#How reproducible:
always

#Reproduce steps:
Repeating fstests[1] generic/241, 30 times, which maybe is relative
to system total ram.

#bisect info

Bisect point to this commit:

commit d6cab70166b5bf2cbeec0c566e51725c793e3aed
Merge: cb9553d 661806a
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue May 17 11:18:34 2016 +1000

    Merge remote-tracking branch 'block/for-next'

which is forwarding to this:

commit 661806a319890962aaa839dc1dbf7ea356aa6b92
Merge: 1335822 b3a834b
Author: Jens Axboe <axboe@fb.com>
Date:   Mon May 16 09:55:01 2016 -0600

    Merge branch 'for-4.7/core' into for-next


On top of 0517 tree, reset --hard to commit cb9553d passed testing,
while reset --hard to commit d6cab70 reproduced issue.


Still working on to id which commit in this merge causes this issuer,
i noticed that lots of merge were going on there....
Meminfo, config, oom msg, bisect log are attached.

Thanks,
Xiong

[1] http://oss.sgi.com/cgi-bin/gitweb.cgi?p=xfs/cmds/xfstests.git
# Additional info
meminfo after running generic/241 7~8 rounds:

------ bad --------------

[root@host linux]# free
              total        used        free      shared  buff/cache   available
Mem:       32807280      422756    25782116        9456     6602408    26044756
Swap:      10485756           0    10485756
[root@host linux]# free -g
              total        used        free      shared  buff/cache   available
Mem:             31           0          24           0           6          24
Swap:             9           0           9
[root@host linux]# git log --oneline -1
d6cab70 Merge remote-tracking branch 'block/for-next'
[root@host linux]# echo 1 > /proc/sys/vm/drop_caches 
[root@host linux]# echo 2 > /proc/sys/vm/drop_caches 
[root@host linux]# echo 3 > /proc/sys/vm/drop_caches 
[root@host linux]# free -g
              total        used        free      shared  buff/cache   available
Mem:             31           0          23           0           6          23
Swap:             9           0           9
[root@host linux]# free
              total        used        free      shared  buff/cache   available
Mem:       32807280      419576    25050868        9456     7336836    24938336
Swap:      10485756           0    10485756

-------- good ------------

[root@host linux]# free
              total        used        free      shared  buff/cache   available
Mem:       32807280      421316    30425892        9464     1960072    31884116
Swap:      10485756           0    10485756
[root@host linux]# free -g
              total        used        free      shared  buff/cache   available
Mem:             31           0          29           0           1          30
Swap:             9           0           9
[root@host linux]# echo 1 > /proc/sys/vm/drop_caches 
[root@host linux]# echo 2 > /proc/sys/vm/drop_caches 
[root@host linux]# echo 3 > /proc/sys/vm/drop_caches 
[root@host linux]# free -g
              total        used        free      shared  buff/cache   available
Mem:             31           0          30           0           0          30
Swap:             9           0           9
[root@host linux]# free
              total        used        free      shared  buff/cache   available
Mem:       32807280      410820    32070196        9464      326264    31946400
Swap:      10485756           0    10485756
[root@host linux]# git log --oneline -1
cb9553d Merge remote-tracking branch 'input/next'
