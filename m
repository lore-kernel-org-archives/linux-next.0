From: Dexuan Cui <decui@microsoft.com>
Subject: Linux-next: very slow disk write speed: WARNING: CPU: 4 PID: 12891 at
 fs/inode.c:390 ihold+0x30/0x40()
Date: Wed, 9 Sep 2015 14:12:37 +0000
Message-ID: <f244aee5f0064d02a561575228f60c59@SIXPR30MB031.064d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: KY Srinivasan <kys@microsoft.com>
List-Id: linux-next.vger.kernel.org

With the recent linux-next tree (e.g., next-20150909), I can easily get the below callstack (see the end of the mail) when I run some heavy I/O workloads, like building a kernel with "make -j16".

After the callstack happens, "dd if=/dev/zero of=zero.bin  bs=1M" shows the disk write speed goes down to a value far less than 1MB/s (I get the speed by iostat or iotop), while the normal write speed should be 100MB/s. However, at this time, "cat a_big_file > /dev/null" shows the disk read speed is still normal, e.g., >100MB/s.

Though I found the issue in Hyper-V VM, I don't think it's caused by a change in the Linux Hyper-V drivers, because I don't see any change in the Linux Hyper-V drivers can cause this issue.

NOTE: only the linux-next tree (maybe since some Aug version or even July version?) has the issue.
The latest Linus's tree and Greg's char-misc.git tree don't have the issue.
With respect to the Linux Hyper-V drivers, I'm sure there is no real difference between linux-next and Greg's char-misc.git.

Any idea?

Thanks!
-- Dexuan

The callstack is:
[ 1799.156370] ld (36538) used greatest stack depth: 12344 bytes left
[ 1860.388015] ------------[ cut here ]------------
[ 1860.388015] WARNING: CPU: 4 PID: 12891 at fs/inode.c:390 ihold+0x30/0x40()
[ 1860.388015] Modules linked in: xt_tcpudp iptable_filter ip_tables x_tables i2c_piix4 i2c_core serio_raw evdev hid_generic hid_hyperv hid hyperv_keyboard autofs4 hv_netvsc hv_utils hv_storvsc psmouse hyperv_fb atkbd hv_vmbus
[ 1860.389888] CPU: 4 PID: 12891 Comm: kworker/u130:3 Not tainted 4.2.0-next-20150909 #1
[ 1860.389888] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS 090006  05/23/2012
[ 1860.389888] Workqueue: writeback wb_workfn (flush-8:16)
[ 1860.389888]  ffffffff8c808fa0 ffff880368253a60 ffffffff8c30d002 0000000000000000
[ 1860.389888]  ffff880368253a98 ffffffff8c056396 ffff880291eb0870 ffff880291eb08f0
[ 1860.389888]  ffff88044e142120 0000000000000001 0000000000000641 ffff880368253aa8
[ 1860.389888] Call Trace:
[ 1860.389888]  [<ffffffff8c30d002>] dump_stack+0x44/0x62
[ 1860.389888]  [<ffffffff8c056396>] warn_slowpath_common+0x86/0xc0
[ 1860.389888]  [<ffffffff8c05648a>] warn_slowpath_null+0x1a/0x20
[ 1860.389888]  [<ffffffff8c1d9d20>] ihold+0x30/0x40
[ 1860.389888]  [<ffffffff8c1ec576>] inode_switch_wbs+0x1b6/0x270
[ 1860.389888]  [<ffffffff8c1ec432>] ? inode_switch_wbs+0x72/0x270
[ 1860.389888]  [<ffffffff8c1ed8c1>] wbc_detach_inode+0x1a1/0x1d0
[ 1860.389888]  [<ffffffff8c1edb6e>] writeback_sb_inodes+0x27e/0x480
[ 1860.389888]  [<ffffffff8c1eddf9>] __writeback_inodes_wb+0x89/0xc0
[ 1860.389888]  [<ffffffff8c1ee037>] wb_writeback+0x207/0x280
[ 1860.389888]  [<ffffffff8c1ee7f9>] wb_workfn+0x299/0x3d0
[ 1860.389888]  [<ffffffff8c06f668>] process_one_work+0x1b8/0x4b0
[ 1860.389888]  [<ffffffff8c06f5ff>] ? process_one_work+0x14f/0x4b0
[ 1860.389888]  [<ffffffff8c06fc7b>] worker_thread+0x4b/0x440
[ 1860.389888]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 1860.389888]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 1860.389888]  [<ffffffff8c075533>] kthread+0xf3/0x110
[ 1860.389888]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 1860.389888]  [<ffffffff8c56979f>] ret_from_fork+0x3f/0x70
[ 1860.389888]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 1860.389888] ---[ end trace b4922878dcd2b65d ]---
[ 1865.692016] kworker/dying (163) used greatest stack depth: 11976 bytes left
[ 1943.756018] ------------[ cut here ]------------
[ 1943.756018] WARNING: CPU: 3 PID: 339 at fs/inode.c:390 ihold+0x30/0x40()
[ 1943.756018] Modules linked in: xt_tcpudp iptable_filter ip_tables x_tables i2c_piix4 i2c_core serio_raw evdev hid_generic hid_hyperv hid hyperv_keyboard autofs4 hv_netvsc hv_utils hv_storvsc psmouse hyperv_fb atkbd hv_vmbus
[ 1943.756018] CPU: 3 PID: 339 Comm: kworker/u129:1 Tainted: G        W       4.2.0-next-20150909 #1
[ 1943.764006] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS 090006  05/23/2012
[ 1943.764006] Workqueue: writeback wb_workfn (flush-8:16)
[ 1943.764006]  ffffffff8c808fa0 ffff8802967f7a60 ffffffff8c30d002 0000000000000000
[ 1943.764006]  ffff8802967f7a98 ffffffff8c056396 ffff880295417170 ffff8802954171f0
[ 1943.764006]  ffff880294864000 0000000000000001 0000000000000757 ffff8802967f7aa8
[ 1943.764006] Call Trace:
[ 1943.764006]  [<ffffffff8c30d002>] dump_stack+0x44/0x62
[ 1943.764006]  [<ffffffff8c056396>] warn_slowpath_common+0x86/0xc0
[ 1943.764006]  [<ffffffff8c05648a>] warn_slowpath_null+0x1a/0x20
[ 1943.764006]  [<ffffffff8c1d9d20>] ihold+0x30/0x40
[ 1943.764006]  [<ffffffff8c1ec576>] inode_switch_wbs+0x1b6/0x270
[ 1943.764006]  [<ffffffff8c1ec432>] ? inode_switch_wbs+0x72/0x270
[ 1943.764793]  [<ffffffff8c1ed8c1>] wbc_detach_inode+0x1a1/0x1d0
[ 1943.764793]  [<ffffffff8c1edb6e>] writeback_sb_inodes+0x27e/0x480
[ 1943.768142]  [<ffffffff8c1eddf9>] __writeback_inodes_wb+0x89/0xc0
[ 1943.768142]  [<ffffffff8c1ee037>] wb_writeback+0x207/0x280
[ 1943.772350]  [<ffffffff8c1ee7f9>] wb_workfn+0x299/0x3d0
[ 1943.772656]  [<ffffffff8c06f668>] process_one_work+0x1b8/0x4b0
[ 1943.780012]  [<ffffffff8c06f5ff>] ? process_one_work+0x14f/0x4b0
[ 1943.780012]  [<ffffffff8c06fc7b>] worker_thread+0x4b/0x440
[ 1943.780012]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 1943.780614]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 1943.780614]  [<ffffffff8c075533>] kthread+0xf3/0x110
[ 1943.784614]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 1943.784614]  [<ffffffff8c56979f>] ret_from_fork+0x3f/0x70
[ 1943.784614]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 1943.788386] ---[ end trace b4922878dcd2b65e ]---
[ 1943.884011] ------------[ cut here ]------------
[ 1943.884210] WARNING: CPU: 3 PID: 339 at fs/inode.c:390 ihold+0x30/0x40()
[ 1943.884210] Modules linked in: xt_tcpudp iptable_filter ip_tables x_tables i2c_piix4 i2c_core serio_raw evdev hid_generic hid_hyperv hid hyperv_keyboard autofs4 hv_netvsc hv_utils hv_storvsc psmouse hyperv_fb atkbd hv_vmbus
[ 1943.888210] CPU: 3 PID: 339 Comm: kworker/u129:1 Tainted: G        W       4.2.0-next-20150909 #1
[ 1943.888210] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS 090006  05/23/2012
[ 1943.892823] Workqueue: writeback wb_workfn (flush-8:16)
[ 1943.892823]  ffffffff8c808fa0 ffff8802967f7a60 ffffffff8c30d002 0000000000000000
[ 1943.900010]  ffff8802967f7a98 ffffffff8c056396 ffff88029544ab70 ffff88029544abf0
[ 1943.900010]  ffff880294864c60 0000000000000001 00000000000019f2 ffff8802967f7aa8
[ 1943.900736] Call Trace:
[ 1943.900736]  [<ffffffff8c30d002>] dump_stack+0x44/0x62
[ 1943.904736]  [<ffffffff8c056396>] warn_slowpath_common+0x86/0xc0
[ 1943.904736]  [<ffffffff8c05648a>] warn_slowpath_null+0x1a/0x20
[ 1943.908321]  [<ffffffff8c1d9d20>] ihold+0x30/0x40
[ 1943.908321]  [<ffffffff8c1ec576>] inode_switch_wbs+0x1b6/0x270
[ 1943.908321]  [<ffffffff8c1ec432>] ? inode_switch_wbs+0x72/0x270
[ 1943.913405]  [<ffffffff8c1ed8c1>] wbc_detach_inode+0x1a1/0x1d0
[ 1943.913405]  [<ffffffff8c1edb6e>] writeback_sb_inodes+0x27e/0x480
[ 1943.917588]  [<ffffffff8c1eddf9>] __writeback_inodes_wb+0x89/0xc0
[ 1943.917588]  [<ffffffff8c1ee037>] wb_writeback+0x207/0x280
[ 1943.921588]  [<ffffffff8c1ee7f9>] wb_workfn+0x299/0x3d0
[ 1943.921588]  [<ffffffff8c06f668>] process_one_work+0x1b8/0x4b0
[ 1943.924925]  [<ffffffff8c06f5ff>] ? process_one_work+0x14f/0x4b0
[ 1943.924925]  [<ffffffff8c06fc7b>] worker_thread+0x4b/0x440
[ 1943.928375]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 1943.928375]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 1943.928375]  [<ffffffff8c075533>] kthread+0xf3/0x110
[ 1943.933004]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 1943.933004]  [<ffffffff8c56979f>] ret_from_fork+0x3f/0x70
[ 1943.933004]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 1943.938199] ---[ end trace b4922878dcd2b65f ]---
[ 2011.160006] ------------[ cut here ]------------
[ 2011.160006] WARNING: CPU: 7 PID: 6782 at fs/inode.c:390 ihold+0x30/0x40()
[ 2011.164014] Modules linked in: xt_tcpudp iptable_filter ip_tables x_tables i2c_piix4 i2c_core serio_raw evdev hid_generic hid_hyperv hid hyperv_keyboard autofs4 hv_netvsc hv_utils hv_storvsc psmouse hyperv_fb atkbd hv_vmbus
[ 2011.164014] CPU: 7 PID: 6782 Comm: kworker/u130:0 Tainted: G        W       4.2.0-next-20150909 #1
[ 2011.165246] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS 090006  05/23/2012
[ 2011.165246] Workqueue: writeback wb_workfn (flush-8:16)
[ 2011.169439]  ffffffff8c808fa0 ffff8804549eba60 ffffffff8c30d002 0000000000000000
[ 2011.169439]  ffff8804549eba98 ffffffff8c056396 ffff880291eb5570 ffff880291eb55f0
[ 2011.176013]  ffff88044e90cde0 0000000000000001 0000000000000802 ffff8804549ebaa8
[ 2011.176013] Call Trace:
[ 2011.177301]  [<ffffffff8c30d002>] dump_stack+0x44/0x62
[ 2011.177301]  [<ffffffff8c056396>] warn_slowpath_common+0x86/0xc0
[ 2011.184012]  [<ffffffff8c05648a>] warn_slowpath_null+0x1a/0x20
[ 2011.184012]  [<ffffffff8c1d9d20>] ihold+0x30/0x40
[ 2011.184788]  [<ffffffff8c1ec576>] inode_switch_wbs+0x1b6/0x270
[ 2011.184788]  [<ffffffff8c1ec432>] ? inode_switch_wbs+0x72/0x270
[ 2011.188935]  [<ffffffff8c1ed8c1>] wbc_detach_inode+0x1a1/0x1d0
[ 2011.188935]  [<ffffffff8c1edb6e>] writeback_sb_inodes+0x27e/0x480
[ 2011.192935]  [<ffffffff8c1eddf9>] __writeback_inodes_wb+0x89/0xc0
[ 2011.192935]  [<ffffffff8c1ee037>] wb_writeback+0x207/0x280
[ 2011.197098]  [<ffffffff8c1ee7f9>] wb_workfn+0x299/0x3d0
[ 2011.197098]  [<ffffffff8c06f668>] process_one_work+0x1b8/0x4b0
[ 2011.201098]  [<ffffffff8c06f5ff>] ? process_one_work+0x14f/0x4b0
[ 2011.201098]  [<ffffffff8c06fc7b>] worker_thread+0x4b/0x440
[ 2011.201098]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 2011.205391]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 2011.205391]  [<ffffffff8c075533>] kthread+0xf3/0x110
[ 2011.209391]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 2011.209391]  [<ffffffff8c56979f>] ret_from_fork+0x3f/0x70
[ 2011.213276]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 2011.213276] ---[ end trace b4922878dcd2b660 ]---
[ 2021.756009] ------------[ cut here ]------------
[ 2021.760009] WARNING: CPU: 7 PID: 6782 at fs/inode.c:390 ihold+0x30/0x40()
[ 2021.760009] Modules linked in: xt_tcpudp iptable_filter ip_tables x_tables i2c_piix4 i2c_core serio_raw evdev hid_generic hid_hyperv hid hyperv_keyboard autofs4 hv_netvsc hv_utils hv_storvsc psmouse hyperv_fb atkbd hv_vmbus
[ 2021.761773] CPU: 7 PID: 6782 Comm: kworker/u130:0 Tainted: G        W       4.2.0-next-20150909 #1
[ 2021.768009] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS 090006  05/23/2012
[ 2021.768009] Workqueue: writeback wb_workfn (flush-8:16)
[ 2021.769055]  ffffffff8c808fa0 ffff8804549eba60 ffffffff8c30d002 0000000000000000
[ 2021.769055]  ffff8804549eba98 ffffffff8c056396 ffff88040291c070 ffff88040291c0f0
[ 2021.772756]  ffff88044e90ca20 0000000000000001 0000000000000b32 ffff8804549ebaa8
[ 2021.772756] Call Trace:
[ 2021.776203]  [<ffffffff8c30d002>] dump_stack+0x44/0x62
[ 2021.780203]  [<ffffffff8c056396>] warn_slowpath_common+0x86/0xc0
[ 2021.780203]  [<ffffffff8c05648a>] warn_slowpath_null+0x1a/0x20
[ 2021.782245]  [<ffffffff8c1d9d20>] ihold+0x30/0x40
[ 2021.786245]  [<ffffffff8c1ec576>] inode_switch_wbs+0x1b6/0x270
[ 2021.786245]  [<ffffffff8c1ec432>] ? inode_switch_wbs+0x72/0x270
[ 2021.786245]  [<ffffffff8c1ed8c1>] wbc_detach_inode+0x1a1/0x1d0
[ 2021.792010]  [<ffffffff8c1edb6e>] writeback_sb_inodes+0x27e/0x480
[ 2021.792010]  [<ffffffff8c1eddf9>] __writeback_inodes_wb+0x89/0xc0
[ 2021.793648]  [<ffffffff8c1ee037>] wb_writeback+0x207/0x280
[ 2021.793648]  [<ffffffff8c1ee7f9>] wb_workfn+0x299/0x3d0
[ 2021.797648]  [<ffffffff8c06f668>] process_one_work+0x1b8/0x4b0
[ 2021.797648]  [<ffffffff8c06f5ff>] ? process_one_work+0x14f/0x4b0
[ 2021.801380]  [<ffffffff8c06fc7b>] worker_thread+0x4b/0x440
[ 2021.801380]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 2021.805380]  [<ffffffff8c06fc30>] ? rescuer_thread+0x2d0/0x2d0
[ 2021.805380]  [<ffffffff8c075533>] kthread+0xf3/0x110
[ 2021.805380]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 2021.808916]  [<ffffffff8c56979f>] ret_from_fork+0x3f/0x70
[ 2021.808916]  [<ffffffff8c075440>] ? kthread_create_on_node+0x230/0x230
[ 2021.812916] ---[ end trace b4922878dcd2b661 ]---
[ 3119.072030] kworker/dying (339) used greatest stack depth: 11504 bytes left
