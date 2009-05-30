From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: 20090529: sysfs/reiserfs: possible circular locking dependency
Date: Sat, 30 May 2009 19:33:03 +0400
Message-ID: <a4423d670905300833v7ed43bd1p22de438bbc4e69ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f222.google.com ([209.85.218.222]:46122 "EHLO
	mail-bw0-f222.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932277AbZE3PdD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 May 2009 11:33:03 -0400
Received: by bwz22 with SMTP id 22so6669251bwz.37
        for <linux-next@vger.kernel.org>; Sat, 30 May 2009 08:33:04 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Frederic Weisbecker <fweisbec@gmail.com>

Hi

Here is a boot process.

udev: starting version 141
[ INFO: possible circular locking dependency detected ]
2.6.30-rc7-next-20090529-06589-g7701864 #6
-------------------------------------------------------
udevadm/708 is trying to acquire lock:
 (&mm->mmap_sem){++++++}, at: [<c0175962>] might_fault+0x52/0xa0

but task is already holding lock:
 (sysfs_mutex){+.+.+.}, at: [<c01d05e6>] sysfs_readdir+0x56/0x200

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (sysfs_mutex){+.+.+.}:
       [<c01503da>] __lock_acquire+0xcca/0x10b0
       [<c0150834>] lock_acquire+0x74/0x90
       [<c044f860>] __mutex_lock_common+0x50/0x430
       [<c044fcf3>] mutex_lock_nested+0x33/0x40
       [<c01d0a1c>] sysfs_addrm_start+0x2c/0xb0
       [<c01d15b0>] create_dir+0x40/0x80
       [<c01d161b>] sysfs_create_dir+0x2b/0x50
       [<c02c7bc1>] kobject_add_internal+0xc1/0x220
       [<c02c7e21>] kobject_add_varg+0x31/0x50
       [<c02c7e9c>] kobject_add+0x2c/0x60
       [<c033c321>] device_add+0xf1/0x560
       [<c01ce485>] add_partition+0x135/0x240
       [<c01ceb7f>] rescan_partitions+0x23f/0x320
       [<c01b3103>] __blkdev_get+0x153/0x330
       [<c01b32ea>] blkdev_get+0xa/0x10
       [<c01ce32a>] register_disk+0x10a/0x130
       [<c02c1e09>] add_disk+0xd9/0x130
       [<c03531ca>] sd_probe_async+0x19a/0x280
       [<c01444b0>] async_thread+0xd0/0x230
       [<c013e3f3>] kthread+0x43/0x80
       [<c0103677>] kernel_thread_helper+0x7/0x10
       [<ffffffff>] 0xffffffff

-> #2 (&bdev->bd_mutex){+.+.+.}:
       [<c01503da>] __lock_acquire+0xcca/0x10b0
       [<c0150834>] lock_acquire+0x74/0x90
       [<c044f860>] __mutex_lock_common+0x50/0x430
       [<c044fcf3>] mutex_lock_nested+0x33/0x40
       [<c01b2fe3>] __blkdev_get+0x33/0x330
       [<c01b32ea>] blkdev_get+0xa/0x10
       [<c01b3451>] open_by_devnum+0x21/0x50
       [<c02027ae>] journal_init+0x22e/0x19a0
       [<c01ee1c1>] reiserfs_fill_super+0x3b1/0x1020
       [<c018ebab>] get_sb_bdev+0x12b/0x150
       [<c01ec441>] get_super_block+0x21/0x30
       [<c018db6a>] vfs_kern_mount+0x3a/0xa0
       [<c018dc29>] do_kern_mount+0x39/0xd0
       [<c01a3cf8>] do_mount+0x3b8/0x770
       [<c01a4134>] sys_mount+0x84/0xb0
       [<c0706c5e>] mount_block_root+0xd1/0x25e
       [<c0706e44>] mount_root+0x59/0x5f
       [<c0706f3a>] prepare_namespace+0xf0/0x16c
       [<c070650b>] kernel_init+0xd8/0xf1
       [<c0103677>] kernel_thread_helper+0x7/0x10
       [<ffffffff>] 0xffffffff

-> #1 (&REISERFS_SB(s)->lock){+.+.+.}:
       [<c01503da>] __lock_acquire+0xcca/0x10b0
       [<c0150834>] lock_acquire+0x74/0x90
       [<c044f860>] __mutex_lock_common+0x50/0x430
       [<c044fcf3>] mutex_lock_nested+0x33/0x40
       [<c02072ae>] reiserfs_write_lock_once+0x1e/0x40
       [<c01e2b46>] reiserfs_get_block+0x66/0x1530
       [<c01b54d0>] do_mpage_readpage+0x340/0x490
       [<c01b5726>] mpage_readpages+0xa6/0xe0
       [<c01dff19>] reiserfs_readpages+0x19/0x20
       [<c016b21f>] __do_page_cache_readahead+0x13f/0x200
       [<c016b32e>] do_page_cache_readahead+0x4e/0x70
       [<c01647ff>] filemap_fault+0x30f/0x430
       [<c017797d>] __do_fault+0x3d/0x3a0
       [<c0178590>] handle_mm_fault+0x100/0x590
       [<c011be51>] do_page_fault+0x121/0x280
       [<c0451bfa>] error_code+0x6a/0x70
       [<c01c2fc0>] load_elf_binary+0x9d0/0x19f0
       [<c0191913>] search_binary_handler+0x163/0x2f0
       [<c0191c9d>] do_execve+0x1fd/0x270
       [<c01016de>] sys_execve+0x3e/0x70
       [<c0102ec9>] syscall_call+0x7/0xb
       [<ffffffff>] 0xffffffff

-> #0 (&mm->mmap_sem){++++++}:
       [<c015048e>] __lock_acquire+0xd7e/0x10b0
       [<c0150834>] lock_acquire+0x74/0x90
       [<c0175993>] might_fault+0x83/0xa0
       [<c02cef26>] copy_to_user+0x36/0x130
       [<c0199a34>] filldir64+0xa4/0xf0
       [<c01d06a6>] sysfs_readdir+0x116/0x200
       [<c0199cae>] vfs_readdir+0x7e/0xa0
       [<c0199d39>] sys_getdents64+0x69/0xb0
       [<c0102e48>] sysenter_do_call+0x12/0x36
       [<ffffffff>] 0xffffffff

other info that might help us debug this:

2 locks held by udevadm/708:
 #0:  (&type->i_mutex_dir_key){+.+.+.}, at: [<c0199c7f>] vfs_readdir+0x4f/0xa0
 #1:  (sysfs_mutex){+.+.+.}, at: [<c01d05e6>] sysfs_readdir+0x56/0x200

stack backtrace:
Pid: 708, comm: udevadm Not tainted 2.6.30-rc7-next-20090529-06589-g7701864 #6
Call Trace:
 [<c044e812>] ? printk+0x18/0x1e
 [<c014e53c>] print_circular_bug_tail+0x8c/0xe0
 [<c014ce8b>] ? print_circular_bug_entry+0x4b/0x50
 [<c015048e>] __lock_acquire+0xd7e/0x10b0
 [<c0175962>] ? might_fault+0x52/0xa0
 [<c0150834>] lock_acquire+0x74/0x90
 [<c0175962>] ? might_fault+0x52/0xa0
 [<c0175993>] might_fault+0x83/0xa0
 [<c0175962>] ? might_fault+0x52/0xa0
 [<c02cef26>] copy_to_user+0x36/0x130
 [<c0199a34>] filldir64+0xa4/0xf0
 [<c01d06a6>] sysfs_readdir+0x116/0x200
 [<c0199990>] ? filldir64+0x0/0xf0
 [<c0199cae>] vfs_readdir+0x7e/0xa0
 [<c0199990>] ? filldir64+0x0/0xf0
 [<c0199d39>] sys_getdents64+0x69/0xb0
 [<c0102e48>] sysenter_do_call+0x12/0x36
