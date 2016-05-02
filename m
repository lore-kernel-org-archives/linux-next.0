From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for May 2   [WARNING: at fs/dcache.c]
Date: Mon, 2 May 2016 19:15:24 +0900
Message-ID: <20160502101524.GA417@swordfish>
References: <20160502184018.502e9e7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:35262 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805AbcEBKNw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 06:13:52 -0400
Content-Disposition: inline
In-Reply-To: <20160502184018.502e9e7c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On (05/02/16 18:40), Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160429

Hello,

[    0.368791] ------------[ cut here ]------------
[    0.368850] WARNING: CPU: 0 PID: 1 at fs/dcache.c:1688 d_set_d_op+0x5e/0xcc
[    0.368911] Modules linked in:
[    0.369002] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-next-20160502-dbg-00005-gf58c9da-dirty #404
[    0.369161]  0000000000000000 ffff880133067908 ffffffff811b8202 0000000000000000
[    0.369371]  0000000000000000 ffff880133067948 ffffffff81039365 00000698e5dffe26
[    0.369580]  ffff880132c090c0 ffffffff81613680 ffff880132c040a0 ffff880132c08000
[    0.369791] Call Trace:
[    0.369846]  [<ffffffff811b8202>] dump_stack+0x4d/0x63
[    0.369904]  [<ffffffff81039365>] __warn+0xb8/0xd3
[    0.369962]  [<ffffffff810393e6>] warn_slowpath_null+0x18/0x1a
[    0.370021]  [<ffffffff811012f6>] d_set_d_op+0x5e/0xcc
[    0.370079]  [<ffffffff8110d887>] simple_lookup+0x2e/0x45
[    0.370137]  [<ffffffff810f6fbf>] lookup_slow+0xdb/0x12d
[    0.370197]  [<ffffffff818915d0>] ? initrd_load+0x3f/0x3f
[    0.370255]  [<ffffffff810f86b6>] walk_component+0xc2/0x201
[    0.370313]  [<ffffffff810f7cec>] ? path_init+0x169/0x2a4
[    0.370371]  [<ffffffff810f9083>] path_lookupat+0x7e/0xff
[    0.370429]  [<ffffffff810f917c>] filename_lookup+0x78/0xd4
[    0.370489]  [<ffffffff8104f172>] ? atomic_notifier_call_chain+0xf/0x11
[    0.370551]  [<ffffffff81244346>] ? notify_update+0x29/0x2b
[    0.370609]  [<ffffffff81245d24>] ? vt_console_print+0x2f3/0x302
[    0.370668]  [<ffffffff810f74a9>] ? getname_flags+0x48/0x15a
[    0.370726]  [<ffffffff810fa525>] user_path_at_empty+0x32/0x38
[    0.370785]  [<ffffffff810fa525>] ? user_path_at_empty+0x32/0x38
[    0.370845]  [<ffffffff810f3432>] vfs_fstatat+0x4c/0x87
[    0.370903]  [<ffffffff810ad7ba>] ? get_page_from_freelist+0x567/0x6f1
[    0.370963]  [<ffffffff810f349e>] vfs_lstat+0x19/0x1b
[    0.371021]  [<ffffffff810f356d>] SyS_newlstat+0x15/0x2e
[    0.371079]  [<ffffffff811be1b3>] ? simple_strtoull+0x2c/0x48
[    0.371138]  [<ffffffff818917de>] clean_path+0x20/0x5e
[    0.371196]  [<ffffffff811be1d8>] ? simple_strtoul+0x9/0xb
[    0.371254]  [<ffffffff81891a5f>] ? parse_header+0x2d/0xda
[    0.371313]  [<ffffffff81892219>] do_name+0x75/0x27a
[    0.371370]  [<ffffffff81891705>] write_buffer+0x23/0x34
[    0.371428]  [<ffffffff8189174a>] flush_buffer+0x34/0x8c
[    0.371487]  [<ffffffff818ae483>] __gunzip+0x268/0x308
[    0.371545]  [<ffffffff818ae211>] ? decompress_method+0x66/0x66
[    0.371604]  [<ffffffff81891716>] ? write_buffer+0x34/0x34
[    0.371662]  [<ffffffff81890812>] ? set_debug_rodata+0x12/0x12
[    0.371721]  [<ffffffff818ae534>] gunzip+0x11/0x13
[    0.371778]  [<ffffffff818915d0>] ? initrd_load+0x3f/0x3f
[    0.371837]  [<ffffffff81891e81>] unpack_to_rootfs+0x13b/0x257
[    0.371896]  [<ffffffff818915d0>] ? initrd_load+0x3f/0x3f
[    0.371954]  [<ffffffff818920a1>] ? maybe_link.part.2+0x104/0x104
[    0.372013]  [<ffffffff818920b9>] populate_rootfs+0x18/0x103
[    0.372072]  [<ffffffff818920a1>] ? maybe_link.part.2+0x104/0x104
[    0.372132]  [<ffffffff81000417>] do_one_initcall+0x8b/0x10e
[    0.372191]  [<ffffffff81890812>] ? set_debug_rodata+0x12/0x12
[    0.372250]  [<ffffffff81890f6c>] kernel_init_freeable+0x11e/0x1a6
[    0.372311]  [<ffffffff8144293f>] kernel_init+0x9/0xeb
[    0.372369]  [<ffffffff81446c92>] ret_from_fork+0x22/0x40
[    0.372428]  [<ffffffff81442936>] ? rest_init+0x7d/0x7d
[    0.372503] ---[ end trace ce49db5ed97cc037 ]---
[    0.372589] Unpacking initramfs...

	-ss
