From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [linux-next][bisected c64e09ce] sysctl command hung indefinitely
Date: Sat, 19 Aug 2017 15:49:31 +0530
Message-ID: <1503137971.28497.19.camel@abdul>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@suse.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, sachinp <sachinp@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Michal,

'sysctl -a' command never completes on my PowerPC machine with latest
next kernel (As of next-20170811)

Machine Type : Power8 bare-metal
Kernel version : 4.13.0-rc4-next-20170817
gcc version : 4.8.5


command output
--------------
$ sysctl -a
[...
vm.hugetlb_shm_group = 0
vm.laptop_mode = 0
vm.legacy_va_layout = 0
vm.lowmem_reserve_ratio = 256	256	32
vm.max_map_count = 65530
vm.min_free_kbytes = 6637
vm.min_slab_ratio = 5
vm.min_unmapped_ratio = 1
vm.mmap_min_addr = 4096
vm.mmap_rnd_bits = 14
vm.mmap_rnd_compat_bits = 7
vm.nr_hugepages = 0
vm.nr_hugepages_mempolicy = 0
vm.nr_overcommit_hugepages = 0
vm.nr_pdflush_threads = 0
vm.numa_zonelist_order = Node
vm.numa_zonelist_order = e
vm.numa_zonelist_order = ode
vm.numa_zonelist_order = 
vm.numa_zonelist_order = de
vm.numa_zonelist_order = Node
vm.numa_zonelist_order = e
vm.numa_zonelist_order = ode
vm.numa_zonelist_order = 
vm.numa_zonelist_order = de
vm.numa_zonelist_order = Node
vm.numa_zonelist_order = e
vm.numa_zonelist_order = ode
vm.numa_zonelist_order = 
vm.numa_zonelist_order = de
vm.numa_zonelist_order = Node
vm.numa_zonelist_order = e
vm.numa_zonelist_order = ode
....]

The last string 'vm.numa_zonelist_order = ' keeps flooding the stdout
and command never exit.

A bisection resulted commit c64e09ce mm, page_alloc: rip out
ZONELIST_ORDER_ZONE

Command exits cleanly when the above commit is reverted.

from the commit I see some changes to kernel/sysctl.c

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 6648fbb..0d51ec1 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1574,8 +1574,6 @@ static int sysrq_sysctl_handler(struct ctl_table
*table, int write,
 #ifdef CONFIG_NUMA
        {
                .procname       = "numa_zonelist_order",
-               .data           = &numa_zonelist_order,
-               .maxlen         = NUMA_ZONELIST_ORDER_LEN,
                .mode           = 0644,
                .proc_handler   = numa_zonelist_order_handler,
        },

does the above change has caused the noise ?

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
