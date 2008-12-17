From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: next-20081217: general protection fault: tty
Date: Wed, 17 Dec 2008 16:02:27 +0300
Message-ID: <a4423d670812170502s72303b10m2a0d0565924a63fd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:37812 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285AbYLQNC3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Dec 2008 08:02:29 -0500
Received: by yw-out-2324.google.com with SMTP id 9so1533941ywe.1
        for <linux-next@vger.kernel.org>; Wed, 17 Dec 2008 05:02:27 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, alan@redhat.com

[   17.728579] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[   17.800713] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[   17.873669] general protection fault: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
[   17.876969] last sysfs file:
[   17.876969] CPU 3
[   17.876969] Modules linked in:
[   17.876969] Pid: 1, comm: swapper Tainted: G        W
2.6.28-rc8-next-20081217 #102
[   17.876969] RIP: 0010:[<ffffffff80299271>]  [<ffffffff80299271>]
constant_test_bit+0x15/0x21
[   17.876969] RSP: 0018:ffff88007f46ba00  EFLAGS: 00010212
[   17.876969] RAX: 0000000000000000 RBX: 02ba1f463a3a39f0 RCX: 000000000000000e
[   17.876969] RDX: 0000000000000000 RSI: 02ba1f463a3a39f0 RDI: 0000000000000040
[   17.876969] RBP: ffff88007f46ba00 R08: ffffffff8069cf78 R09: 000000000000005a
[   17.876969] R10: ffff88007cd38688 R11: ffffe200032b4b40 R12: 6b6b6b6b6b6b6b6b
[   17.876969] R13: ffff88007d95f5f0 R14: ffffffff80660f20 R15: ffffffff8065a670
[   17.876969] FS:  0000000000000000(0000) GS:ffff88007f402a28(0000)
knlGS:0000000000000000
[   17.876969] CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
[   17.876969] CR2: 0000000000000000 CR3: 0000000000201000 CR4: 00000000000006e0
[   17.876969] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   17.876969] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[   17.876969] Process swapper (pid: 1, threadinfo ffff88007f46a000,
task ffff88007f470000)
[   17.876969] Stack:
[   17.876969]  ffff88007f46ba20 ffffffff8029b2a9 ffff88007f46ba50
ffff88007cd0a6d8
[   17.876969]  ffff88007f46ba60 ffffffff8029c6ef ffffffff806630b0
ffff88007cd0a6d8
[   17.876969]  ffffffff806630b0 ffff88007d95f5f0 ffffffff80660f20
ffffffff8065a670
[   17.876969] Call Trace:
[   17.876969]  [<ffffffff8029b2a9>] virt_to_head_page+0x31/0x40
[   17.876969]  [<ffffffff8029c6ef>] kfree+0x23/0xf2
[   17.876969]  [<ffffffff803e3276>] device_release+0x6e/0x72
[   17.876969]  [<ffffffff8037879e>] kobject_release+0x52/0x68
[   17.876969]  [<ffffffff8037874c>] ? kobject_release+0x0/0x68
[   17.876969]  [<ffffffff80379591>] kref_put+0x4b/0x57
[   17.876969]  [<ffffffff803786a6>] kobject_put+0x47/0x4b
[   17.876969]  [<ffffffff803e2bd8>] put_device+0x12/0x14
[   17.876969]  [<ffffffff803e39cc>] device_unregister+0x19/0x1e
[   17.876969]  [<ffffffff803e3a07>] device_destroy+0x36/0x3b
[   17.876969]  [<ffffffff803bf4f6>] tty_unregister_device+0x21/0x23
[   17.876969]  [<ffffffff803dc419>] uart_remove_one_port+0xa4/0x108
[   17.876969]  [<ffffffff803e1a3c>] serial8250_register_port+0xd8/0x1fb
[   17.876969]  [<ffffffff802b1313>] ? ifind+0x2c/0x84
[   17.876969]  [<ffffffff804d9d69>] serial_pnp_probe+0x1a7/0x20a
[   17.876969]  [<ffffffff804e6e6b>] ? _spin_unlock+0x4a/0x57
[   17.876969]  [<ffffffff803b8c50>] pnp_device_probe+0x9b/0xc0
[   17.876969]  [<ffffffff803e5c62>] driver_probe_device+0xbe/0x163
[   17.876969]  [<ffffffff803e5d5f>] __driver_attach+0x58/0x7c
[   17.876969]  [<ffffffff803e5d07>] ? __driver_attach+0x0/0x7c
[   17.876969]  [<ffffffff803e5501>] bus_for_each_dev+0x54/0x8b
[   17.876969]  [<ffffffff806cd95c>] ? serial8250_pnp_init+0x0/0x12
[   17.876969]  [<ffffffff803e5ab4>] driver_attach+0x1c/0x1e
[   17.876969]  [<ffffffff803e4e24>] bus_add_driver+0xb8/0x205
[   17.876969]  [<ffffffff806cd95c>] ? serial8250_pnp_init+0x0/0x12
[   17.876969]  [<ffffffff803e5f4a>] driver_register+0xab/0x12b
[   17.876969]  [<ffffffff806cd95c>] ? serial8250_pnp_init+0x0/0x12
[   17.876969]  [<ffffffff803b8a27>] pnp_register_driver+0x1c/0x1e
[   17.876969]  [<ffffffff806cd96c>] serial8250_pnp_init+0x10/0x12
[   17.876969]  [<ffffffff80209056>] _stext+0x56/0x130
[   17.876969]  [<ffffffff802692b5>] ? register_irq_proc+0xb0/0xcc
[   17.876969]  [<ffffffff802e0000>] ? proc_file_read+0x100/0x20c
[   17.876969]  [<ffffffff806b26c3>] kernel_init+0x1a2/0x1fa
[   17.876969]  [<ffffffff8020c8fa>] child_rip+0xa/0x20
[   17.876969]  [<ffffffff8020c2c0>] ? restore_args+0x0/0x30
[   17.876969]  [<ffffffff806b2521>] ? kernel_init+0x0/0x1fa
[   17.876969]  [<ffffffff8020c8f0>] ? child_rip+0x0/0x20
[   17.876969] Code: 5e c9 c3 55 48 c7 c2 10 88 64 80 48 89 e5 e8 a8 12 04 00 c9
 c3 90 89 f9 55 89 c8 48 89 e5 bf 40 00 00 00 99 f7 ff 89 d1 48 63 d0 <48> 8b 04
 d6 c9 48 d3 e8 83 e0 01 c3 55 48 89 fe 48 89 e5 53 48
[   17.876969] RIP  [<ffffffff80299271>] constant_test_bit+0x15/0x21
[   17.876969]  RSP <ffff88007f46ba00>
[   22.390436] ---[ end trace 4eaa2a86a8e2da22 ]---
[   22.445647] swapper used greatest stack depth: 4008 bytes left
[   22.515413] Kernel panic - not syncing: Attempted to kill init!
