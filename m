From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [next-20160726] possible circular locking dependency detected
Date: Wed, 27 Jul 2016 22:30:02 +0900
Message-ID: <20160727133002.GA560@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34287 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756010AbcG0Nae (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Jul 2016 09:30:34 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Hello,

[    2.375503] ======================================================
[    2.375504] [ INFO: possible circular locking dependency detected ]
[    2.375505] 4.7.0-next-20160727-dbg-00004-g32e4851-dirty #770 Not tainted
[    2.375506] -------------------------------------------------------
[    2.375507] kworker/u16:3/119 is trying to acquire lock:
[    2.375526]  (&dev->mode_config.mutex){+.+.+.}, at: [<ffffffffa0281ebc>] drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.375527] 
               but task is already holding lock:
[    2.375532]  ((fb_notifier_list).rwsem){++++.+}, at: [<ffffffff81062f9e>] __blocking_notifier_call_chain+0x31/0x64
[    2.375533] 
               which lock already depends on the new lock.

[    2.375533] 
               the existing dependency chain (in reverse order) is:
[    2.375535] 
               -> #1 ((fb_notifier_list).rwsem){++++.+}:
[    2.375539]        [<ffffffff81087465>] lock_acquire+0x130/0x1c4
[    2.375541]        [<ffffffff813ba23e>] down_write+0x3b/0x6a
[    2.375543]        [<ffffffff81062d05>] blocking_notifier_chain_register+0x33/0x53
[    2.375546]        [<ffffffff8121d0df>] fb_register_client+0x18/0x1a
[    2.375549]        [<ffffffff8121ca85>] backlight_device_register+0x145/0x1c5
[    2.375593]        [<ffffffffa05a8e2b>] intel_backlight_device_register+0xdc/0x137 [i915]
[    2.375634]        [<ffffffffa057efd3>] intel_connector_register+0xe/0x10 [i915]
[    2.375675]        [<ffffffffa0596396>] intel_dp_connector_register+0x1b/0x70 [i915]
[    2.375689]        [<ffffffffa027381d>] drm_connector_register+0x5c/0x80 [drm]
[    2.375702]        [<ffffffffa0275870>] drm_modeset_register_all+0x156/0x19e [drm]
[    2.375713]        [<ffffffffa026fb20>] drm_dev_register+0x7c/0xc7 [drm]
[    2.375747]        [<ffffffffa05028e0>] i915_driver_load+0xf3e/0x1040 [i915]
[    2.375782]        [<ffffffffa050b91c>] i915_pci_probe+0x3f/0x41 [i915]
[    2.375785]        [<ffffffff8120416f>] pci_device_probe+0x83/0xeb
[    2.375789]        [<ffffffff81299d51>] driver_probe_device+0x118/0x261
[    2.375790]        [<ffffffff81299f0d>] __driver_attach+0x73/0x95
[    2.375792]        [<ffffffff8129804a>] bus_for_each_dev+0x6f/0x87
[    2.375794]        [<ffffffff8129975a>] driver_attach+0x1e/0x20
[    2.375796]        [<ffffffff81298f3a>] bus_add_driver+0xf6/0x1e6
[    2.375797]        [<ffffffff8129ab5d>] driver_register+0x88/0xbf
[    2.375800]        [<ffffffff812031e9>] __pci_register_driver+0x5d/0x60
[    2.375830]        [<ffffffffa0629062>] i915_init+0x62/0x66 [i915]
[    2.375833]        [<ffffffff8100043e>] do_one_initcall+0x90/0x118
[    2.375835]        [<ffffffff810f9910>] do_init_module+0x5f/0x1f1
[    2.375839]        [<ffffffff810b97f6>] load_module+0x1b00/0x2053
[    2.375841]        [<ffffffff810b9e48>] SyS_init_module+0xff/0x125
[    2.375844]        [<ffffffff813bc225>] entry_SYSCALL_64_fastpath+0x18/0xa8
[    2.375846] 
               -> #0 (&dev->mode_config.mutex){+.+.+.}:
[    2.375849]        [<ffffffff810869d9>] __lock_acquire+0xf09/0x15a1
[    2.375851]        [<ffffffff81087465>] lock_acquire+0x130/0x1c4
[    2.375853]        [<ffffffff813b823e>] mutex_lock_nested+0x70/0x32d
[    2.375865]        [<ffffffffa0281ebc>] drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.375872]        [<ffffffffa04b5b8f>] drm_fb_helper_restore_fbdev_mode_unlocked+0x2e/0x6d [drm_kms_helper]
[    2.375878]        [<ffffffffa04b5c0d>] drm_fb_helper_set_par+0x3f/0x4b [drm_kms_helper]
[    2.375917]        [<ffffffffa058d22a>] intel_fbdev_set_par+0x17/0x56 [i915]
[    2.375919]        [<ffffffff8121997d>] fbcon_init+0x35f/0x464
[    2.375922]        [<ffffffff8126eca3>] visual_init+0xd6/0x12a
[    2.375924]        [<ffffffff8127004e>] do_bind_con_driver+0x1a0/0x2a6
[    2.375926]        [<ffffffff812702bb>] do_take_over_console+0x167/0x191
[    2.375929]        [<ffffffff812178c6>] do_fbcon_takeover+0x60/0x9a
[    2.375931]        [<ffffffff8121a5e8>] fbcon_event_notify+0x434/0x763
[    2.375934]        [<ffffffff81062cae>] notifier_call_chain+0x3e/0x62
[    2.375936]        [<ffffffff81062fb9>] __blocking_notifier_call_chain+0x4c/0x64
[    2.375938]        [<ffffffff81062fe5>] blocking_notifier_call_chain+0x14/0x16
[    2.375940]        [<ffffffff8121d116>] fb_notifier_call_chain+0x1b/0x1d
[    2.375941]        [<ffffffff8121de8e>] register_framebuffer+0x293/0x2cf
[    2.375948]        [<ffffffffa04b5ec0>] drm_fb_helper_initial_config+0x2a7/0x32d [drm_kms_helper]
[    2.375986]        [<ffffffffa058dc5e>] intel_fbdev_initial_config+0x18/0x28 [i915]
[    2.375988]        [<ffffffff81063f2d>] async_run_entry_fn+0x37/0xcd
[    2.375991]        [<ffffffff8105b77e>] process_one_work+0x2b1/0x59e
[    2.375993]        [<ffffffff8105c768>] worker_thread+0x24f/0x38a
[    2.375995]        [<ffffffff81061b7c>] kthread+0xf8/0x100
[    2.375997]        [<ffffffff813bc43f>] ret_from_fork+0x1f/0x40
[    2.375998] 
               other info that might help us debug this:

[    2.375998]  Possible unsafe locking scenario:

[    2.375999]        CPU0                    CPU1
[    2.375999]        ----                    ----
[    2.376000]   lock((fb_notifier_list).rwsem);
[    2.376002]                                lock(&dev->mode_config.mutex);
[    2.376003]                                lock((fb_notifier_list).rwsem);
[    2.376004]   lock(&dev->mode_config.mutex);
[    2.376004] 
                *** DEADLOCK ***

[    2.376005] 6 locks held by kworker/u16:3/119:
[    2.376009]  #0:  ("events_unbound"){.+.+.+}, at: [<ffffffff8105b663>] process_one_work+0x196/0x59e
[    2.376012]  #1:  ((&entry->work)){+.+.+.}, at: [<ffffffff8105b663>] process_one_work+0x196/0x59e
[    2.376015]  #2:  (registration_lock){+.+.+.}, at: [<ffffffff8121dc22>] register_framebuffer+0x27/0x2cf
[    2.376018]  #3:  (console_lock){+.+.+.}, at: [<ffffffff8121de6c>] register_framebuffer+0x271/0x2cf
[    2.376021]  #4:  (&fb_info->lock){+.+.+.}, at: [<ffffffff8121d8f2>] lock_fb_info+0x1d/0x3c
[    2.376025]  #5:  ((fb_notifier_list).rwsem){++++.+}, at: [<ffffffff81062f9e>] __blocking_notifier_call_chain+0x31/0x64
[    2.376025] 
               stack backtrace:
[    2.376027] CPU: 2 PID: 119 Comm: kworker/u16:3 Not tainted 4.7.0-next-20160727-dbg-00004-g32e4851-dirty #770
[    2.376030] Workqueue: events_unbound async_run_entry_fn
[    2.376033]  0000000000000000 ffff88041a9fb7f0 ffffffff811d980b ffffffff81f1f400
[    2.376035]  ffffffff81f226a0 ffff88041a9fb830 ffffffff81083b78 ffff88041a9ea980
[    2.376037]  ffff88041a9eb178 0000000000000006 ffff88041a9eb1a0 ffff88041a9ea980
[    2.376038] Call Trace:
[    2.376041]  [<ffffffff811d980b>] dump_stack+0x68/0x92
[    2.376044]  [<ffffffff81083b78>] print_circular_bug+0x286/0x294
[    2.376046]  [<ffffffff810869d9>] __lock_acquire+0xf09/0x15a1
[    2.376049]  [<ffffffff81087465>] lock_acquire+0x130/0x1c4
[    2.376051]  [<ffffffff81087465>] ? lock_acquire+0x130/0x1c4
[    2.376063]  [<ffffffffa0281ebc>] ? drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.376075]  [<ffffffffa0281ebc>] ? drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.376077]  [<ffffffff813b823e>] mutex_lock_nested+0x70/0x32d
[    2.376088]  [<ffffffffa0281ebc>] ? drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.376100]  [<ffffffffa0281e92>] ? drm_modeset_lock_all+0x25/0xb7 [drm]
[    2.376102]  [<ffffffff810981c2>] ? rcu_read_lock_sched_held+0x61/0x69
[    2.376114]  [<ffffffffa0281ebc>] drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.376125]  [<ffffffffa0281ebc>] ? drm_modeset_lock_all+0x4f/0xb7 [drm]
[    2.376131]  [<ffffffffa04b5b8f>] drm_fb_helper_restore_fbdev_mode_unlocked+0x2e/0x6d [drm_kms_helper]
[    2.376138]  [<ffffffffa04b5c0d>] drm_fb_helper_set_par+0x3f/0x4b [drm_kms_helper]
[    2.376175]  [<ffffffffa058d22a>] intel_fbdev_set_par+0x17/0x56 [i915]
[    2.376178]  [<ffffffff8121997d>] fbcon_init+0x35f/0x464
[    2.376180]  [<ffffffff8126eca3>] visual_init+0xd6/0x12a
[    2.376182]  [<ffffffff8127004e>] do_bind_con_driver+0x1a0/0x2a6
[    2.376184]  [<ffffffff812702bb>] do_take_over_console+0x167/0x191
[    2.376186]  [<ffffffff812178c6>] do_fbcon_takeover+0x60/0x9a
[    2.376188]  [<ffffffff8121a5e8>] fbcon_event_notify+0x434/0x763
[    2.376191]  [<ffffffff81062cae>] notifier_call_chain+0x3e/0x62
[    2.376193]  [<ffffffff81062fb9>] __blocking_notifier_call_chain+0x4c/0x64
[    2.376196]  [<ffffffff81062fe5>] blocking_notifier_call_chain+0x14/0x16
[    2.376197]  [<ffffffff8121d116>] fb_notifier_call_chain+0x1b/0x1d
[    2.376199]  [<ffffffff8121de8e>] register_framebuffer+0x293/0x2cf
[    2.376206]  [<ffffffffa04b5ec0>] drm_fb_helper_initial_config+0x2a7/0x32d [drm_kms_helper]
[    2.376244]  [<ffffffffa058dc5e>] intel_fbdev_initial_config+0x18/0x28 [i915]
[    2.376246]  [<ffffffff81063f2d>] async_run_entry_fn+0x37/0xcd
[    2.376248]  [<ffffffff8105b77e>] process_one_work+0x2b1/0x59e
[    2.376251]  [<ffffffff8105c768>] worker_thread+0x24f/0x38a
[    2.376253]  [<ffffffff8105c519>] ? rescuer_thread+0x2cf/0x2cf
[    2.376255]  [<ffffffff81061b7c>] kthread+0xf8/0x100
[    2.376257]  [<ffffffff813bb9ef>] ? _raw_spin_unlock_irq+0x2c/0x4a
[    2.376260]  [<ffffffff813bc43f>] ret_from_fork+0x1f/0x40
[    2.376262]  [<ffffffff81061a84>] ? kthread_create_on_node+0x1d4/0x1d4

	-ss
