From: Dave Chinner <david@fromorbit.com>
Subject: Re: Linux-next parallel cp workload hang
Date: Wed, 18 May 2016 15:56:34 +1000
Message-ID: <20160518055634.GW26977@dastard>
References: <20160518014615.GA5302@ZX.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail06.adl6.internode.on.net ([150.101.137.145]:54080 "EHLO
	ipmail06.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750759AbcERF4k (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 01:56:40 -0400
Content-Disposition: inline
In-Reply-To: <20160518014615.GA5302@ZX.nay.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiong Zhou <xzhou@redhat.com>
Cc: linux-next@vger.kernel.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Wed, May 18, 2016 at 09:46:15AM +0800, Xiong Zhou wrote:
> Hi,
> 
> Parallel cp workload (xfstests generic/273) hangs like blow.
> It's reproducible with a small chance, less the 1/100 i think.
> 
> Have hit this in linux-next 20160504 0506 0510 trees, testing on
> xfs with loop or block device. Ext4 survived several rounds
> of testing.
> 
> Linux next 20160510 tree hangs within 500 rounds testing several
> times. The same tree with vfs parallel lookup patchset reverted
> survived 900 rounds testing. Reverted commits are attached.

What hardware?

> Bisecting in this patchset ided this commit:
> 
> 3b0a3c1ac1598722fc289da19219d14f2a37b31f is the first bad commit
> commit 3b0a3c1ac1598722fc289da19219d14f2a37b31f
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Wed Apr 20 23:42:46 2016 -0400
> 
>     simple local filesystems: switch to ->iterate_shared()
>     
>     no changes needed (XFS isn't simple, but it has the same parallelism
>     in the interesting parts exercised from CXFS).
>     
> With this commit reverted on top of Linux next 0510 tree, 5000+ rounds
> of testing passed.
> 
> Although 2000 rounds testing had been conducted before good/bad
> verdict, i'm not 100 percent sure about all this, since it's
> so hard to hit, and i am not that lucky..
> 
> Bisect log and full blocked state process dump log are also attached.
> 
> Furthermore, this was first hit when testing fs dax on nvdimm,
> however it's reproducible without dax mount option, and also
> reproducible on loop device, just seems harder to hit.
> 
> Thanks,
> Xiong
> 
> [0.771475] INFO: task cp:49033 blocked for more than 120 seconds.
> [0.794263]       Not tainted 4.6.0-rc6-next-20160504 #5
> [0.812515] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> this message.
> [0.841801] cp              D ffff880b4e977928     0 49033  49014
> 0x00000080
> [0.868923]  ffff880b4e977928 ffff880ba275d380 ffff880b8d712b80
> ffff880b4e978000
> [0.897504]  7fffffffffffffff 0000000000000002 0000000000000000
> ffff880b8d712b80
> [0.925234]  ffff880b4e977940 ffffffff816cbc25 ffff88035a1dabb0
> ffff880b4e9779e8
> [0.953237] Call Trace:
> [0.958314]  [<ffffffff816cbc25>] schedule+0x35/0x80
> [0.974854]  [<ffffffff816ceb71>] schedule_timeout+0x231/0x2d0
> [0.995728]  [<ffffffff810d2e2d>] ? down_trylock+0x2d/0x40
> [1.015351]  [<ffffffffa03fa6c2>] ? xfs_iext_bno_to_ext+0xa2/0x190 [xfs]
> [1.040182]  [<ffffffff816cdb89>] __down_common+0xaa/0x104
> [1.059021]  [<ffffffffa04076d2>] ? _xfs_buf_find+0x162/0x340 [xfs]
> [1.081357]  [<ffffffff816cdc00>] __down+0x1d/0x1f
> [1.097166]  [<ffffffff810d2e81>] down+0x41/0x50
> [1.112869]  [<ffffffffa04074bc>] xfs_buf_lock+0x3c/0xf0 [xfs]
> [1.134504]  [<ffffffffa04076d2>] _xfs_buf_find+0x162/0x340 [xfs]
> [1.156871]  [<ffffffffa04078da>] xfs_buf_get_map+0x2a/0x270 [xfs]

So what's holding that directory data buffer lock? It should only be
held if there is either IO in progress, or a modification of the
buffer in progress that is blocked somewhere else.

> [1.180010]  [<ffffffffa04084ed>] xfs_buf_read_map+0x2d/0x180 [xfs]
> [1.203538]  [<ffffffffa0435f21>] xfs_trans_read_buf_map+0xf1/0x300 [xfs]
> [1.229194]  [<ffffffffa03e75b1>] xfs_da_read_buf+0xd1/0x100 [xfs]
> [1.251948]  [<ffffffffa03ed5e6>] xfs_dir3_data_read+0x26/0x60 [xfs]
> [1.275736]  [<ffffffffa040923e>] xfs_dir2_leaf_readbuf.isra.12+0x1be/0x4a0 [xfs]
> [1.305094]  [<ffffffff816cdc92>] ? down_read+0x12/0x30
> [1.323787]  [<ffffffffa04187a4>] ? xfs_ilock+0xe4/0x110 [xfs]
> [1.345114]  [<ffffffffa040965b>] xfs_dir2_leaf_getdents+0x13b/0x3d0 [xfs]
> [1.371818]  [<ffffffffa0409f26>] xfs_readdir+0x1a6/0x1c0 [xfs]

So we should be holding the ilock in shared mode here...

> [1.393471]  [<ffffffffa040bcbb>] xfs_file_readdir+0x2b/0x30 [xfs]
> [1.416874]  [<ffffffff8122cec3>] iterate_dir+0x173/0x190
> [1.436709]  [<ffffffff81003276>] ? do_audit_syscall_entry+0x66/0x70
> [1.460951]  [<ffffffff8122d338>] SyS_getdents+0x98/0x120
> [1.480566]  [<ffffffff8122cee0>] ? iterate_dir+0x190/0x190
> [1.500909]  [<ffffffff81003b12>] do_syscall_64+0x62/0x110
> [1.520847]  [<ffffffff816cf9a1>] entry_SYSCALL64_slow_path+0x25/0x25
> [1.545372] INFO: task cp:49040 blocked for more than 120 seconds.
> [1.568933]       Not tainted 4.6.0-rc6-next-20160504 #5
> [1.587943] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> this message.
> [1.618544] cp              D ffff880b91463b00     0 49040  49016
> 0x00000080
> [1.645502]  ffff880b91463b00 ffff880464d5c140 ffff88029b475700
> ffff880b91464000
> [1.674145]  ffff880411c42610 ffffffffffffffff ffff880411c42628
> ffff8802c10bc610
> [1.702834]  ffff880b91463b18 ffffffff816cbc25 ffff88029b475700
> ffff880b91463b88
> [1.731501] Call Trace:
> [1.736866]  [<ffffffff816cbc25>] schedule+0x35/0x80
> [1.754119]  [<ffffffff816ce3c2>] rwsem_down_read_failed+0xf2/0x140
> [1.777411]  [<ffffffffa0418800>] ? xfs_ilock_data_map_shared+0x30/0x40
> [xfs]
> [1.805090]  [<ffffffff81355e08>] call_rwsem_down_read_failed+0x18/0x30
> [1.830482]  [<ffffffff816cdca0>] down_read+0x20/0x30
> [1.848505]  [<ffffffffa04187a4>] xfs_ilock+0xe4/0x110 [xfs]
> [1.869293]  [<ffffffffa0418800>] xfs_ilock_data_map_shared+0x30/0x40

And it this is an attempt to lock the inode shared, so if that is
failing while there's another shared holder, than means there's an
exclusive waiter queued up (i.e. read iheld -> write blocked -> read
blocked).


So looking at dump-g273xfs0510:

[  845.727907] INFO: task cp:40126 blocked for more than 120 seconds.
[  845.751175]       Not tainted 4.6.0-rc7-next-20160510 #9
[  845.770011] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  845.799967] cp              D ffff88046b64bcb8     0 40126  40106 0x00000080
[  845.826636]  ffff88046b64bcb8 ffffffffa0458d36 ffff8804685c2b80 0000000002408240
[  845.855232]  ffff88046b64c000 ffff880426b08450 ffff880426b08450 ffff880426b08468
[  845.883836]  ffff880426b08458 ffff88046b64bcd0 ffffffff816ce9c5 ffff8804685c2b80
[  845.911854] Call Trace:
[  845.917076]  [<ffffffffa0458d36>] ? kmem_zone_alloc+0x96/0x120 [xfs]
[  845.940302]  [<ffffffff816ce9c5>] schedule+0x35/0x80
[  845.957118]  [<ffffffff816d1534>] rwsem_down_write_failed+0x114/0x230
[  845.981242]  [<ffffffffa045a294>] ? xlog_grant_head_check+0x54/0x100 [xfs]
[  846.007673]  [<ffffffffa04492e4>] ? xfs_vn_update_time+0xd4/0x160 [xfs]
[  846.032009]  [<ffffffff81358217>] call_rwsem_down_write_failed+0x17/0x30
[  846.056909]  [<ffffffff816d0a7d>] down_write+0x2d/0x40
[  846.074580]  [<ffffffffa044b78f>] xfs_ilock+0xcf/0x110 [xfs]
[  846.094681]  [<ffffffffa04492e4>] xfs_vn_update_time+0xd4/0x160 [xfs]
[  846.118308]  [<ffffffff81238648>] touch_atime+0xa8/0xd0
[  846.136385]  [<ffffffff8122f132>] iterate_dir+0x112/0x190
[  846.155995]  [<ffffffff8122f608>] SyS_getdents+0x98/0x120
[  846.175819]  [<ffffffff8122f1b0>] ? iterate_dir+0x190/0x190
[  846.195808]  [<ffffffff81003b12>] do_syscall_64+0x62/0x110
[  846.215019]  [<ffffffff816d2761>] entry_SYSCALL64_slow_path+0x25/0x25


Timestamp updates are transactional, requiring exclusive access to
the directory ilock. That's why we have a train-smash of down_read()
calls blocking in these dumps - they are queued up behind this call.
This is expected under workloads where a couple of hundred threads
are all reading the same directory and trying to open files in it.

So why isn't the current read holder making progress? Why is it
blocked on a directory data buffer lock when the only accesses
should be read only?

There's nothing in either of the stack traces that tells me this. I
suspect that there may be some kind of buffer readahead vs buffer
read interaction that results in leaking a buffer lock, but it is
not obvious what that may be yet.

Can you reproduce this with CONFIG_XFS_DEBUG=y set? if you can, and
it doesn't trigger any warnings or asserts, can you then try to
reproduce it while tracing the following events:

	xfs_buf_lock
	xfs_buf_lock_done
	xfs_buf_trylock
	xfs_buf_unlock

So we might be able to see if there's an unexpected buffer
locking/state pattern occurring when the hang occurs?

Also, if you run on slower storage, does the hang get harder or
easier to hit?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
