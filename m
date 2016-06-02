From: Xiong Zhou <xzhou@redhat.com>
Subject: Re: linux-next memleak after IO on dax mountpoint
Date: Thu, 2 Jun 2016 10:20:34 +0800
Message-ID: <20160602022034.GA4456@dhcp12-144.nay.redhat.com>
References: <20160527084617.GD2933@dhcp12-144.nay.redhat.com>
 <20160528040554.GA23685@dhcp12-144.nay.redhat.com>
 <x49shwxvuu1.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45678 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751916AbcFBCUh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2016 22:20:37 -0400
Content-Disposition: inline
In-Reply-To: <x49shwxvuu1.fsf@segfault.boston.devel.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Moyer <jmoyer@redhat.com>
Cc: Xiong Zhou <xzhou@redhat.com>, sfr@canb.auug.org.au, axboe@fb.com, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, linux-kernel@vger.kernel.org

Hi, Jeff

On Wed, Jun 01, 2016 at 10:37:26AM -0400, Jeff Moyer wrote:
> Xiong Zhou <xzhou@redhat.com> writes:
> 
> > On Fri, May 27, 2016 at 04:46:17PM +0800, Xiong Zhou wrote:
> > ...
> >> Still working on to id which commit in this merge causes this issuer,
> >
> > Narrowed down to:
> 
> Hi Xiong,
> 
> I don't see how any of those could be at all relevant to pmem.  Can you
> post the output from 'cat /proc/slabinfo' here?

Sure. It's now reproducible in Linus tree. i'm still hunting the
bad commit.. bisecting in Linus tree point to ext4 merge commit,
but checking out to its following commit passed the test. Commits
in my last email may also not be relevant to pmem as you said.


Thanks,
Xiong

# free
              total        used        free      shared  buff/cache   available
Mem:       32806940      403300    18237768        9492    14165872    18062772
Swap:      10485756           0    10485756
# cat /proc/slabinfo 
slabinfo - version: 2.1
# name            <active_objs> <num_objs> <objsize> <objperslab> <pagesperslab> : tunables <limit> <batchcount> <sharedfactor> : slabdata <active_slabs> <num_slabs> <sharedavail>
ext4_groupinfo_4k   2296   2296    144   28    1 : tunables    0    0    0 : slabdata     82     82      0
ext4_inode_cache    4154   4402   1056   31    8 : tunables    0    0    0 : slabdata    142    142      0
ext4_allocation_context   1184   1184    128   32    1 : tunables    0    0    0 : slabdata     37     37      0
ext4_io_end         5184   5184     64   64    1 : tunables    0    0    0 : slabdata     81     81      0
ext4_extent_status  23562  23562     40  102    1 : tunables    0    0    0 : slabdata    231    231      0
jbd2_journal_handle   3145   3145     48   85    1 : tunables    0    0    0 : slabdata     37     37      0
jbd2_journal_head   6290   6290    120   34    1 : tunables    0    0    0 : slabdata    185    185      0
jbd2_revoke_table_s   6144   6144     16  256    1 : tunables    0    0    0 : slabdata     24     24      0
jbd2_revoke_record_s   4096   4096     32  128    1 : tunables    0    0    0 : slabdata     32     32      0
mbcache                0      0     56   73    1 : tunables    0    0    0 : slabdata      0      0      0
nf_conntrack         918    918    320   51    4 : tunables    0    0    0 : slabdata     18     18      0
kcopyd_job             0      0   3312    9    8 : tunables    0    0    0 : slabdata      0      0      0
dm_uevent              0      0   2632   12    8 : tunables    0    0    0 : slabdata      0      0      0
kvm_async_pf           0      0    136   30    1 : tunables    0    0    0 : slabdata      0      0      0
kvm_vcpu               0      0  18880    1    8 : tunables    0    0    0 : slabdata      0      0      0
kvm_mmu_page_header      0      0    168   48    2 : tunables    0    0    0 : slabdata      0      0      0
fat_inode_cache       46     46    704   46    8 : tunables    0    0    0 : slabdata      1      1      0
fat_cache              0      0     40  102    1 : tunables    0    0    0 : slabdata      0      0      0
nfsd4_stateids         0      0    176   46    2 : tunables    0    0    0 : slabdata      0      0      0
nfsd4_openowners       0      0    440   37    4 : tunables    0    0    0 : slabdata      0      0      0
rpc_inode_cache       51     51    640   51    8 : tunables    0    0    0 : slabdata      1      1      0
xfs_dqtrx              0      0    528   31    4 : tunables    0    0    0 : slabdata      0      0      0
xfs_dquot              0      0    472   34    4 : tunables    0    0    0 : slabdata      0      0      0
xfs_icr                0      0    144   28    1 : tunables    0    0    0 : slabdata      0      0      0
xfs_ili             2809   2809    152   53    2 : tunables    0    0    0 : slabdata     53     53      0
xfs_inode          10200  10200    960   34    8 : tunables    0    0    0 : slabdata    300    300      0
xfs_efd_item        1840   1840    400   40    4 : tunables    0    0    0 : slabdata     46     46      0
xfs_da_state        1598   1598    480   34    4 : tunables    0    0    0 : slabdata     47     47      0
xfs_log_ticket      2156   2156    184   44    2 : tunables    0    0    0 : slabdata     49     49      0
bio-1               1734   1734    320   51    4 : tunables    0    0    0 : slabdata     34     34      0
RAWv6               1316   1316   1152   28    8 : tunables    0    0    0 : slabdata     47     47      0
UDPLITEv6              0      0   1152   28    8 : tunables    0    0    0 : slabdata      0      0      0
UDPv6                644    644   1152   28    8 : tunables    0    0    0 : slabdata     23     23      0
tw_sock_TCPv6          0      0    280   29    2 : tunables    0    0    0 : slabdata      0      0      0
request_sock_TCPv6      0      0    328   49    4 : tunables    0    0    0 : slabdata      0      0      0
TCPv6                300    300   2112   15    8 : tunables    0    0    0 : slabdata     20     20      0
cfq_queue           1925   1925    232   35    2 : tunables    0    0    0 : slabdata     55     55      0
bsg_cmd                0      0    312   52    4 : tunables    0    0    0 : slabdata      0      0      0
mqueue_inode_cache     36     36    896   36    8 : tunables    0    0    0 : slabdata      1      1      0
userfaultfd_ctx_cache      0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
dio                   51     51    640   51    8 : tunables    0    0    0 : slabdata      1      1      0
pid_namespace          0      0   2224   14    8 : tunables    0    0    0 : slabdata      0      0      0
posix_timers_cache      0      0    240   34    2 : tunables    0    0    0 : slabdata      0      0      0
ip4-frags              0      0    216   37    2 : tunables    0    0    0 : slabdata      0      0      0
UDP-Lite               0      0   1024   32    8 : tunables    0    0    0 : slabdata      0      0      0
flow_cache             0      0    112   36    1 : tunables    0    0    0 : slabdata      0      0      0
RAW                 1564   1564    960   34    8 : tunables    0    0    0 : slabdata     46     46      0
UDP                  992    992   1024   32    8 : tunables    0    0    0 : slabdata     31     31      0
tw_sock_TCP            0      0    280   29    2 : tunables    0    0    0 : slabdata      0      0      0
request_sock_TCP      98     98    328   49    4 : tunables    0    0    0 : slabdata      2      2      0
TCP                  352    352   1984   16    8 : tunables    0    0    0 : slabdata     22     22      0
hugetlbfs_inode_cache     56     56    584   28    4 : tunables    0    0    0 : slabdata      2      2      0
dquot               2784   2880    256   32    2 : tunables    0    0    0 : slabdata     90     90      0
scsi_data_buffer  128180 128180     24  170    1 : tunables    0    0    0 : slabdata    754    754      0
request_queue         85     98   2296   14    8 : tunables    0    0    0 : slabdata      7      7      0
blkdev_requests     2464   2464    368   44    4 : tunables    0    0    0 : slabdata     56     56      0
blkdev_ioc          1908   2691    104   39    1 : tunables    0    0    0 : slabdata     69     69      0
user_namespace         0      0    304   53    4 : tunables    0    0    0 : slabdata      0      0      0
dmaengine-unmap-256     15     15   2112   15    8 : tunables    0    0    0 : slabdata      1      1      0
dmaengine-unmap-128     30     30   1088   30    8 : tunables    0    0    0 : slabdata      1      1      0
sock_inode_cache    2907   2907    640   51    8 : tunables    0    0    0 : slabdata     57     57      0
file_lock_cache     1872   1872    208   39    2 : tunables    0    0    0 : slabdata     48     48      0
net_namespace          5      5   6272    5    8 : tunables    0    0    0 : slabdata      1      1      0
shmem_inode_cache   3283   3283    656   49    8 : tunables    0    0    0 : slabdata     67     67      0
taskstats           1323   1323    328   49    4 : tunables    0    0    0 : slabdata     27     27      0
proc_inode_cache   10459  10660    624   52    8 : tunables    0    0    0 : slabdata    205    205      0
sigqueue            2448   2448    160   51    2 : tunables    0    0    0 : slabdata     48     48      0
bdev_cache           507    507    832   39    8 : tunables    0    0    0 : slabdata     13     13      0
kernfs_node_cache  53652  53652    120   34    1 : tunables    0    0    0 : slabdata   1578   1578      0
mnt_cache           3990   3990    384   42    4 : tunables    0    0    0 : slabdata     95     95      0
inode_cache        25055  25144    568   28    4 : tunables    0    0    0 : slabdata    898    898      0
dentry             62696  62748    192   42    2 : tunables    0    0    0 : slabdata   1494   1494      0
iint_cache             0      0     72   56    1 : tunables    0    0    0 : slabdata      0      0      0
buffer_head        15412  15795    104   39    1 : tunables    0    0    0 : slabdata    405    405      0
mm_struct            960    960   1984   16    8 : tunables    0    0    0 : slabdata     60     60      0
files_cache         2346   2346    704   46    8 : tunables    0    0    0 : slabdata     51     51      0
signal_cache        2190   2190   1088   30    8 : tunables    0    0    0 : slabdata     73     73      0
sighand_cache       1515   1515   2112   15    8 : tunables    0    0    0 : slabdata    101    101      0
task_struct          937    970   5568    5    8 : tunables    0    0    0 : slabdata    194    194      0
cred_jar           24880  25620    192   42    2 : tunables    0    0    0 : slabdata    610    610      0
Acpi-Operand       13104  13104     72   56    1 : tunables    0    0    0 : slabdata    234    234      0
Acpi-Parse          2555   2555     56   73    1 : tunables    0    0    0 : slabdata     35     35      0
Acpi-State         57589  57681     80   51    1 : tunables    0    0    0 : slabdata   1131   1131      0
Acpi-Namespace      5202   5202     40  102    1 : tunables    0    0    0 : slabdata     51     51      0
anon_vma_chain     30664  30912     64   64    1 : tunables    0    0    0 : slabdata    483    483      0
anon_vma           30855  30855     80   51    1 : tunables    0    0    0 : slabdata    605    605      0
pid                 2240   2240    128   32    1 : tunables    0    0    0 : slabdata     70     70      0
numa_policy           62     62    264   31    2 : tunables    0    0    0 : slabdata      2      2      0
radix_tree_node     7618  11704    584   28    4 : tunables    0    0    0 : slabdata    418    418      0
trace_event_file    2898   2898     88   46    1 : tunables    0    0    0 : slabdata     63     63      0
ftrace_event_field  10625  10625     48   85    1 : tunables    0    0    0 : slabdata    125    125      0
idr_layer_cache     1815   1815   2096   15    8 : tunables    0    0    0 : slabdata    121    121      0
task_group          1764   1764    768   42    8 : tunables    0    0    0 : slabdata     42     42      0
dma-kmalloc-8192       0      0   8192    4    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-4096       0      0   4096    8    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-2048       0      0   2048   16    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-1024       0      0   1024   32    8 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-512       32     32    512   32    4 : tunables    0    0    0 : slabdata      1      1      0
dma-kmalloc-256        0      0    256   32    2 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-128        0      0    128   32    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-64         0      0     64   64    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-32         0      0     32  128    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-16         0      0     16  256    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-8          0      0      8  512    1 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-192        0      0    192   42    2 : tunables    0    0    0 : slabdata      0      0      0
dma-kmalloc-96         0      0     96   42    1 : tunables    0    0    0 : slabdata      0      0      0
kmalloc-8192        1452   1488   8192    4    8 : tunables    0    0    0 : slabdata    372    372      0
kmalloc-4096        2584   2584   4096    8    8 : tunables    0    0    0 : slabdata    323    323      0
kmalloc-2048      3004480 3004496   2048   16    8 : tunables    0    0    0 : slabdata 187781 187781      0
kmalloc-1024      2079488 2079488   1024   32    8 : tunables    0    0    0 : slabdata  64984  64984      0
kmalloc-512         5550   5696    512   32    4 : tunables    0    0    0 : slabdata    178    178      0
kmalloc-256       23440835 23445568    256   32    2 : tunables    0    0    0 : slabdata 732674 732674      0
kmalloc-192         7061   7266    192   42    2 : tunables    0    0    0 : slabdata    173    173      0
kmalloc-128         6208   6208    128   32    1 : tunables    0    0    0 : slabdata    194    194      0
kmalloc-96          8606   8694     96   42    1 : tunables    0    0    0 : slabdata    207    207      0
kmalloc-64         74624  74624     64   64    1 : tunables    0    0    0 : slabdata   1166   1166      0
kmalloc-32        130277 130688     32  128    1 : tunables    0    0    0 : slabdata   1021   1021      0
kmalloc-16         64871  66304     16  256    1 : tunables    0    0    0 : slabdata    259    259      0
kmalloc-8         108567 109056      8  512    1 : tunables    0    0    0 : slabdata    213    213      0
kmem_cache_node      954    960     64   64    1 : tunables    0    0    0 : slabdata     15     15      0
kmem_cache           663    663    320   51    4 : tunables    0    0    0 : slabdata     13     13      0
# uname -r
4.7.0-rc1+
# cat /proc/meminfo 
MemTotal:       32806940 kB
MemFree:        18239888 kB
MemAvailable:   18064956 kB
Buffers:              44 kB
Cached:            53740 kB
SwapCached:            0 kB
Active:            96800 kB
Inactive:          36988 kB
Active(anon):      79888 kB
Inactive(anon):     9488 kB
Active(file):      16912 kB
Inactive(file):    27500 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:      10485756 kB
SwapFree:       10485756 kB
Dirty:                 4 kB
Writeback:             0 kB
AnonPages:         79952 kB
Mapped:            41884 kB
Shmem:              9492 kB
Slab:           14112188 kB
SReclaimable:      61224 kB
SUnreclaim:     14050964 kB
KernelStack:       10768 kB
PageTables:         4880 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:    26889224 kB
Committed_AS:     346524 kB
VmallocTotal:   34359738367 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB
HardwareCorrupted:     0 kB
AnonHugePages:     22528 kB
CmaTotal:              0 kB
CmaFree:               0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:      317948 kB
DirectMap2M:     3743744 kB
DirectMap1G:    31457280 kB
