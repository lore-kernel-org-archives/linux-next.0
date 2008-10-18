From: Vegard Nossum <vegard.nossum@gmail.com>
Subject: Hung processes (root fs on USB pen-drive)
Date: Sat, 18 Oct 2008 16:39:30 +0200
Message-ID: <20081018143930.GA23473@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.185]:44680 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbYJROjK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Oct 2008 10:39:10 -0400
Received: by nf-out-0910.google.com with SMTP id d3so537203nfc.21
        for <linux-next@vger.kernel.org>; Sat, 18 Oct 2008 07:39:06 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, Andrew Morton <akpm@linux-foundation.org>

Hi,

I was testing kmemcheck in -next and found that the machine can suddenly
hang for no apparent reason.

This is what I did:

 - boot USB pen-drive (contains root fs)
 - after the system has been up (and stable) for a long while, I
   inserted/removed quickly a few other pen-drives

Now all new processes which access the filesystem will hang indefinitely.
See output of SysRq-l and SysRq-w below.


Vegard


usb 1-2: USB disconnect, address 12
usb 1-6: reset high speed USB device using ehci_hcd and address 2
usb 1-6: device descriptor read/64, error -110
usb 1-6: device descriptor read/64, error -110
usb 1-6: reset high speed USB device using ehci_hcd and address 2
usb 1-6: device descriptor read/64, error -110
usb 1-6: device descriptor read/64, error -110
usb 1-6: reset high speed USB device using ehci_hcd and address 2
usb 1-6: device not accepting address 2, error -110
hub 1-0:1.0: unable to enumerate USB device on port 2
usb 1-6: reset high speed USB device using ehci_hcd and address 2
usb 1-6: device not accepting address 2, error -110
usb 1-6: USB disconnect, address 2
SysRq : Show backtrace of all active CPUs
CPU0:

Pid: 0, comm: swapper Not tainted (2.6.27-next-20081017 #45) 945P-A
EIP: 0060:[<c04445f5>] EFLAGS: 00000202 CPU: 0
EIP is at native_safe_halt+0x5/0x10
EAX: 0720a491 EBX: 00000000 ECX: 00000000 EDX: 00000000
ESI: c24a8280 EDI: c2277000 EBP: c228efa4 ESP: c228efa4
 DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
CR0: 8005003b CR2: f5ed4b40 CR3: 33c71000 CR4: 00000640
DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
DR6: ffff4ff0 DR7: 00000400
Call Trace:
 [<c042b99a>] default_idle+0x6a/0x70
 [<c0422857>] cpu_idle+0x77/0xe0
 [<c1864d7e>] rest_init+0x4e/0x60
SysRq : Show Blocked State
  task                PC stack   pid father
khubd         D c08a34c8  1308  1904      2
        f67dabf4 00000046 f67da000 c08a34c8 f67dab98 c01be07c 00000000 f3f5e000
 00000dac 00000000 c20643e0 c2383180 f67f14b0 f67f1728 c3afa480 00000000
 f6c1007b c3afa480 1eb08ea7 0000032f 00000060 f67f1728 0069257c f6c1f63c
Call Trace:
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c047a9d5>] ? ktime_get_ts+0x55/0x60
 [<c1954454>] io_schedule+0x54/0x90
 [<c04bbc15>] sync_page+0x35/0x60
 [<c19549f7>] __wait_on_bit+0x47/0x70
 [<c04bbbe0>] ? sync_page+0x0/0x60
 [<c04bbeab>] wait_on_page_bit+0x9b/0xb0
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c04bbfbc>] wait_on_page_writeback_range+0xfc/0x110
 [<c04bc01b>] filemap_fdatawait+0x4b/0x50
 [<c04bc05d>] filemap_write_and_wait+0x3d/0x50
 [<c0507df9>] sync_blockdev+0x19/0x20
 [<c0526167>] quota_sync_sb+0x37/0x130
 [<c0523a90>] ? vfs_quota_sync+0x0/0x1d0
 [<c0526282>] sync_dquots+0x22/0x150
 [<c04ea189>] __fsync_super+0x19/0x70
 [<c04ea1eb>] fsync_super+0xb/0x20
 [<c0507e9f>] fsync_bdev+0x1f/0x50
 [<c08933cf>] invalidate_partition+0x1f/0x40
 [<c0532bfd>] del_gendisk+0x2d/0x100
 [<c110e0be>] sd_remove+0x2e/0x70
 [<c0fd0a5a>] scsi_bus_remove+0x3a/0x50
 [<c0a3491c>] __device_release_driver+0x7c/0xc0
 [<c0a34a33>] device_release_driver+0x23/0x40
 [<c0a33f75>] bus_remove_device+0x85/0xb0
 [<c0a32628>] device_del+0xf8/0x1a0
 [<c0fd0d5f>] __scsi_remove_device+0x4f/0x90
 [<c0fcda71>] scsi_forget_host+0x51/0x70
 [<c0fc6b9a>] scsi_remove_host+0x5a/0xf0
 [<c1222b6f>] quiesce_and_remove_host+0x5f/0xa0
 [<c1222c81>] storage_disconnect+0x11/0x20
 [<c11fa65e>] usb_unbind_interface+0x4e/0xf0
 [<c0a3491c>] __device_release_driver+0x7c/0xc0
 [<c0a34a33>] device_release_driver+0x23/0x40
 [<c0a33f75>] bus_remove_device+0x85/0xb0
 [<c0a32628>] device_del+0xf8/0x1a0
 [<c11f7964>] usb_disable_device+0x84/0x100
 [<c11f2c00>] usb_disconnect+0x90/0x130
 [<c11f3dbf>] hub_thread+0x68f/0x1270
 [<c1953edf>] ? schedule+0x43f/0x960
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c11f3730>] ? hub_thread+0x0/0x1270
 [<c047691c>] kthread+0x3c/0x70
 [<c04768e0>] ? kthread+0x0/0x70
 [<c0424ccb>] kernel_thread_helper+0x7/0x1c
pdflush       D f5fcaec0  1480  2024      2
        f5fcaed8 00000046 00000002 f5fcaec0 f5fcaec8 00000000 f5fcae8c c0487e7d
 c39d6860 00000000 c20643e0 c2383180 f601a960 f601abd8 c3afa480 00000000
 008053f1 c3afa480 c048909b f5fcaeb8 00000296 f601abd8 c252a780 f5fcaed8
Call Trace:
 [<c0487e7d>] ? lock_release_holdtime+0x2d/0x200
 [<c048909b>] ? trace_hardirqs_on+0xb/0x10
 [<c19547b4>] schedule_timeout+0x44/0xb0
 [<c046b9a0>] ? process_timeout+0x0/0x10
 [<c19547af>] ? schedule_timeout+0x3f/0xb0
 [<c1953954>] __sched_text_start+0x64/0xb0
 [<c04c99d5>] congestion_wait+0x55/0x70
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c04c2bbf>] wb_kupdate+0x9f/0xf0
 [<c04c41d2>] pdflush+0x112/0x1e0
 [<c04c2b20>] ? wb_kupdate+0x0/0xf0
 [<c04c40c0>] ? pdflush+0x0/0x1e0
 [<c047691c>] kthread+0x3c/0x70
 [<c04768e0>] ? kthread+0x0/0x70
 [<c0424ccb>] kernel_thread_helper+0x7/0x1c
kjournald     D f6661e78  2064  4580      2
        f6661e90 00000046 00000002 f6661e78 f6661e80 00000000 00000000 c04240ce
 00000d59 00000000 c20643e0 c2383180 f54d14b0 f54d1728 c3afa480 00000000
 002eb8f2 c3afa480 ffffffff c04661e1 00000060 f54d1728 006699a8 f5400434
Call Trace:
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04661e1>] ? set_normalized_timespec+0x71/0x80
 [<c1954454>] io_schedule+0x54/0x90
 [<c0507f05>] sync_buffer+0x35/0x40
 [<c19549f7>] __wait_on_bit+0x47/0x70
 [<c0507ed0>] ? sync_buffer+0x0/0x40
 [<c1954ac8>] out_of_line_wait_on_bit+0xa8/0xc0
 [<c0507ed0>] ? sync_buffer+0x0/0x40
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05080a6>] __wait_on_buffer+0x26/0x30
 [<c05ba989>] journal_commit_transaction+0x999/0xee0
 [<c042a739>] ? native_sched_clock+0xb9/0xf0
 [<c046c43f>] ? try_to_del_timer_sync+0x5f/0x70
 [<c05bdbe6>] kjournald+0xb6/0x1f0
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c05bdb30>] ? kjournald+0x0/0x1f0
 [<c047691c>] kthread+0x3c/0x70
 [<c04768e0>] ? kthread+0x0/0x70
 [<c0424ccb>] kernel_thread_helper+0x7/0x1c
syslogd       D 00000000  1244  6251      1
        f47719a4 00000046 f5773e10 00000000 f477194c c0488e21 f5773e10 f4776000
 f47719d4 f4782280 c20643e0 c2383180 f5773e10 f5774088 c3afa480 00000000
 c01940e0 c3afa480 d25b421d 0000031b 00000003 f5774088 c39c8450 f47719d4
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9a96>] journal_get_undo_access+0x26/0x160
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c058d81f>] __ext3_journal_get_undo_access+0x1f/0x50
 [<c057bcb3>] ext3_try_to_allocate_with_rsv+0x33/0x580
 [<c05087b9>] ? bh_uptodate_or_lock+0x9/0x60
 [<c057c8da>] ext3_new_blocks+0x22a/0x610
 [<c0489049>] ? trace_hardirqs_on_caller+0x139/0x180
 [<c058125d>] ext3_get_blocks_handle+0x29d/0xb20
 [<c0447ab2>] ? lookup_address+0x72/0xa0
 [<c044c5e4>] ? kmemcheck_hide+0x94/0x130
 [<c0489049>] ? trace_hardirqs_on_caller+0x139/0x180
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c0581b51>] ext3_get_block+0x71/0x100
 [<c050b0ac>] __block_prepare_write+0x16c/0x3b0
 [<c050b478>] block_write_begin+0x48/0xe0
 [<c0581ae0>] ? ext3_get_block+0x0/0x100
 [<c057ff38>] ext3_write_begin+0xf8/0x1c0
 [<c0581ae0>] ? ext3_get_block+0x0/0x100
 [<c04bc77e>] generic_file_buffered_write+0xfe/0x5d0
 [<c0489049>] ? trace_hardirqs_on_caller+0x139/0x180
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04be1eb>] __generic_file_aio_write_nolock+0x19b/0x520
 [<c04be683>] generic_file_aio_write+0x63/0xd0
 [<c057d88d>] ext3_file_write+0x2d/0xc0
 [<c04e8195>] do_sync_readv_writev+0xb5/0xf0
 [<c044c5e4>] ? kmemcheck_hide+0x94/0x130
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04e8f9c>] do_readv_writev+0x9c/0x1c0
 [<c057d860>] ? ext3_file_write+0x0/0xc0
 [<c0489049>] ? trace_hardirqs_on_caller+0x139/0x180
 [<c04e910a>] vfs_writev+0x4a/0x60
 [<c04e915d>] sys_writev+0x3d/0xa0
 [<c0423f6b>] sysenter_do_call+0x12/0x3f
dpkg          D 00000000  1540  8384   8127
        f3c9de78 00000046 f47d6770 00000000 f3c9de20 c0488e21 f47d6770 f6661000
 f56de8dc 00000000 c20643e0 c2383180 f47d6770 f47d69e8 c3afa480 00000000
 c01b8b78 c3afa480 5cd06eff 0000031a 00000003 f47d69e8 00000f22 f56de8dc
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05bd26d>] log_wait_commit+0x8d/0x100
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c05b8053>] journal_stop+0x133/0x1e0
 [<c057ec90>] ? ext3_write_inode+0x0/0x50
 [<c05b88af>] journal_force_commit+0x1f/0x30
 [<c0588bd5>] ext3_force_commit+0x25/0x30
 [<c057ecc3>] ext3_write_inode+0x33/0x50
 [<c0503951>] __writeback_single_inode+0x201/0x330
 [<c1956a19>] ? _spin_lock+0x59/0x60
 [<c0503aa4>] sync_inode+0x24/0x40
 [<c057d9c7>] ext3_sync_file+0xa7/0xd0
 [<c0506eca>] do_fsync+0x6a/0xb0
 [<c0506f3a>] __do_fsync+0x2a/0x50
 [<c0506f8d>] sys_fsync+0xd/0x10
 [<c0424076>] syscall_call+0x7/0xb
 [<c0420000>] ? svm_set_msr+0x160/0x340
modprobe      D 00000000  1820  8485      1
        f3c8bcf8 00000046 f3e63e10 00000000 f3c8bca0 c0488e21 f3e63e10 f4776000
 f3c8bd28 f4782280 c20643e0 c2383180 f3e63e10 f3e64088 c3afa480 00000000
 c0194630 c3afa480 69b4c41c 0000031b 00000003 f3e64088 c39cd310 f3c8bd28
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c058b460>] ? ext3_follow_link+0x0/0x20
 [<c04f2473>] __link_path_walk+0x963/0xdc0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04f2a84>] path_walk+0x54/0xb0
 [<c04f2b64>] do_path_lookup+0x84/0x1a0
 [<c04f2ccb>] path_lookup_open+0x4b/0xa0
 [<c04f3a73>] do_filp_open+0xb3/0x7d0
 [<c042a568>] ? sched_clock+0x8/0x10
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c08a7c88>] ? _raw_spin_unlock+0x68/0x80
 [<c195686d>] ? _spin_unlock+0x1d/0x20
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c04e6689>] do_sys_open+0x59/0xf0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04e6789>] sys_open+0x29/0x40
 [<c0424076>] syscall_call+0x7/0xb
 [<c0420000>] ? svm_set_msr+0x160/0x340
modprobe      D 00000000  1820  8500      1
        f3f27cf8 00000046 f3e60000 00000000 f3f27ca0 c0488e21 f3e60000 f3cbe000
 f3f27d28 f3f56f00 c20643e0 c2383180 f3e60000 f3e60278 c3afa480 00000000
 c0194630 c3afa480 4f1a477b 00000345 00000003 f3e60278 c39cd310 f3f27d28
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c058b460>] ? ext3_follow_link+0x0/0x20
 [<c04f2473>] __link_path_walk+0x963/0xdc0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04f2a84>] path_walk+0x54/0xb0
 [<c04f2b64>] do_path_lookup+0x84/0x1a0
 [<c04f2ccb>] path_lookup_open+0x4b/0xa0
 [<c04f3a73>] do_filp_open+0xb3/0x7d0
 [<c042a568>] ? sched_clock+0x8/0x10
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c08a7c88>] ? _raw_spin_unlock+0x68/0x80
 [<c195686d>] ? _spin_unlock+0x1d/0x20
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c04e6689>] do_sys_open+0x59/0xf0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04e6789>] sys_open+0x29/0x40
 [<c0424076>] syscall_call+0x7/0xb
 [<c0420000>] ? svm_set_msr+0x160/0x340
modprobe      D 00000000  1820  8512      1
        f3fa5cf8 00000046 f3ccbe10 00000000 f3fa5ca0 c0488e21 f3ccbe10 f3c5a000
 f3fa5d28 00000000 c20643e0 c2383180 f3ccbe10 f3ccc088 c3afa480 00000000
 c0194630 c3afa480 44135261 0000036f 00000003 f3ccc088 c39cd310 f3fa5d28
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c058b460>] ? ext3_follow_link+0x0/0x20
 [<c04f2473>] __link_path_walk+0x963/0xdc0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04f2a84>] path_walk+0x54/0xb0
 [<c04f2b64>] do_path_lookup+0x84/0x1a0
 [<c04f2ccb>] path_lookup_open+0x4b/0xa0
 [<c04f3a73>] do_filp_open+0xb3/0x7d0
 [<c042a568>] ? sched_clock+0x8/0x10
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c08a7c88>] ? _raw_spin_unlock+0x68/0x80
 [<c195686d>] ? _spin_unlock+0x1d/0x20
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c04e6689>] do_sys_open+0x59/0xf0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04e6789>] sys_open+0x29/0x40
 [<c0424076>] syscall_call+0x7/0xb
 [<c0420000>] ? svm_set_msr+0x160/0x340
modprobe      D 00000000  1820  8516      1
        f39a2cf8 00000046 f47d3e10 00000000 f39a2ca0 c0488e21 f47d3e10 f4e8f000
 f39a2d28 00000000 c20643e0 c2383180 f47d3e10 f47d4088 c3afa480 00000000
 c0194630 c3afa480 3371a9eb 00000399 00000003 f47d4088 c39cd310 f39a2d28
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c058b460>] ? ext3_follow_link+0x0/0x20
 [<c04f2473>] __link_path_walk+0x963/0xdc0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04f2a84>] path_walk+0x54/0xb0
 [<c04f2b64>] do_path_lookup+0x84/0x1a0
 [<c04f2ccb>] path_lookup_open+0x4b/0xa0
 [<c04f3a73>] do_filp_open+0xb3/0x7d0
 [<c042a568>] ? sched_clock+0x8/0x10
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c08a7c88>] ? _raw_spin_unlock+0x68/0x80
 [<c195686d>] ? _spin_unlock+0x1d/0x20
 [<c04fd208>] ? alloc_fd+0xe8/0x100
 [<c04e6689>] do_sys_open+0x59/0xf0
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04e6789>] sys_open+0x29/0x40
 [<c0424076>] syscall_call+0x7/0xb
 [<c0420000>] ? svm_set_msr+0x160/0x340
cron          D 00000000  2332  8526   6332
        f3e33d2c 00000046 f4788000 00000000 f3e33cd4 c0488e21 f4788000 f47b5000
 f3e33d5c f4782000 c20643e0 c2383180 f4788000 f4788278 c3afa480 00000000
 c0185028 c3afa480 b839a533 0000044b 00000003 f4788278 c39cbda8 f3e33d5c
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c04bce8c>] generic_file_aio_read+0x23c/0x6a0
 [<c044c78f>] ? kmemcheck_trap+0x8f/0xe0
 [<c04e83b1>] do_sync_read+0xd1/0x110
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04e8b99>] vfs_read+0x99/0x160
 [<c04e82e0>] ? do_sync_read+0x0/0x110
 [<c04e8d1d>] sys_read+0x3d/0x70
 [<c0423f6b>] sysenter_do_call+0x12/0x3f
 [<c0420000>] ? svm_set_msr+0x160/0x340
cron          D 00000000  2340  8527   6332
        f3cd4d2c 00000046 f47894b0 00000000 f3cd4cd4 c0488e21 f47894b0 f47b5000
 f3cd4d5c f4782000 c20643e0 c2383180 f47894b0 f4789728 c3afa480 00000000
 c0185028 c3afa480 f1eb6ecb 00000791 00000003 f4789728 c39cbda8 f3cd4d5c
Call Trace:
 [<c0488e21>] ? mark_held_locks+0x41/0x80
 [<c047007b>] ? in_group_p+0xb/0x30
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c04bce8c>] generic_file_aio_read+0x23c/0x6a0
 [<c044c78f>] ? kmemcheck_trap+0x8f/0xe0
 [<c04e83b1>] do_sync_read+0xd1/0x110
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04e8b99>] vfs_read+0x99/0x160
 [<c04e82e0>] ? do_sync_read+0x0/0x110
 [<c04e8d1d>] sys_read+0x3d/0x70
 [<c0423f6b>] sysenter_do_call+0x12/0x3f
 [<c0420000>] ? svm_set_msr+0x160/0x340
top           D f4e8fd14  1820  8528   7855
        f4e8fd2c 00000046 00000002 f4e8fd14 f4e8fd1c 00000000 f39b52c0 c08a34c8
 f4e8fd5c 00000000 c20643e0 c2383180 f39b52c0 f39b5538 c3afa480 00000000
 007eef38 c3afa480 c04240ce f56de800 00000003 f39b5538 c39cfca0 f4e8fd5c
Call Trace:
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c05b9a45>] do_get_write_access+0x435/0x460
 [<c0476cc0>] ? wake_bit_function+0x0/0x60
 [<c05b9bf3>] journal_get_write_access+0x23/0x40
 [<c058d7cf>] __ext3_journal_get_write_access+0x1f/0x50
 [<c05b007b>] ? mb_find_extent+0x15b/0x1c0
 [<c05807d6>] ext3_reserve_inode_write+0x66/0x80
 [<c0580825>] ext3_mark_inode_dirty+0x35/0x60
 [<c0580969>] ext3_dirty_inode+0x49/0x80
 [<c08a007b>] ? radix_tree_insert+0xbb/0x1e0
 [<c050416c>] __mark_inode_dirty+0x2c/0x180
 [<c04fa9dc>] touch_atime+0xbc/0x110
 [<c04bce8c>] generic_file_aio_read+0x23c/0x6a0
 [<c044c78f>] ? kmemcheck_trap+0x8f/0xe0
 [<c04e83b1>] do_sync_read+0xd1/0x110
 [<c0476c70>] ? autoremove_wake_function+0x0/0x50
 [<c08a34c8>] ? trace_hardirqs_on_thunk+0xc/0x10
 [<c04240ce>] ? restore_nocheck_notrace+0x0/0xe
 [<c04e8b99>] vfs_read+0x99/0x160
 [<c04e82e0>] ? do_sync_read+0x0/0x110
 [<c04e8d1d>] sys_read+0x3d/0x70
 [<c0424076>] syscall_call+0x7/0xb
 [<c0420000>] ? svm_set_msr+0x160/0x340
Sched Debug Version: v0.07, 2.6.27-next-20081017 #45
now at 8768209.776254 msecs
  .sysctl_sched_latency                    : 20.000000
  .sysctl_sched_min_granularity            : 4.000000
  .sysctl_sched_wakeup_granularity         : 5.000000
  .sysctl_sched_child_runs_first           : 0.000001
  .sysctl_sched_features                   : 7935

cpu#0, 2992.592 MHz
  .nr_running                    : 1
  .load                          : 3121
  .nr_switches                   : 621192
  .nr_load_updates               : 8710366
  .nr_uninterruptible            : 12
  .jiffies                       : 8410366
  .next_balance                  : 8.410369
  .curr->pid                     : 0
  .clock                         : 8765853.872732
  .cpu_load[0]                   : 0
  .cpu_load[1]                   : 0
  .cpu_load[2]                   : 0
  .cpu_load[3]                   : 12
  .cpu_load[4]                   : 26

cfs_rq[0]:/
  .exec_clock                    : 2078689.011191
  .MIN_vruntime                  : 2868322.877316
  .min_vruntime                  : 2868342.877324
  .max_vruntime                  : 2868322.877316
  .spread                        : 0.000000
  .spread0                       : 0.000000
  .nr_running                    : 1
  .load                          : 3121
  .yld_exp_empty                 : 0
  .yld_act_empty                 : 0
  .yld_both_empty                : 0
  .yld_count                     : 762
  .sched_switch                  : 0
  .sched_count                   : 640499
  .sched_goidle                  : 183215
  .ttwu_count                    : 325652
  .ttwu_local                    : 325652
  .bkl_count                     : 6453
  .nr_spread_over                : 84976
  .shares                        : 0

rt_rq[0]:/
  .rt_nr_running                 : 0
  .rt_throttled                  : 0
  .rt_time                       : 0.000000
  .rt_runtime                    : 950.000000

runnable tasks:
            task   PID         tree-key  switches  prio     exec-runtime         sum-exec        sum-sleep
----------------------------------------------------------------------------------------------------------
        events/0     3   2868322.877316     57265   115   2868322.877316     20583.985029   8635385.169021 /
