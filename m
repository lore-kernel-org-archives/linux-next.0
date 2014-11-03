From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 3
Date: Mon, 3 Nov 2014 13:50:01 -0800
Message-ID: <20141103214943.GA20210@roeck-us.net>
References: <20141103161403.79bde878@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57395 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752325AbaKCVuL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2014 16:50:11 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XlPVq-001dMw-PD
	for linux-next@vger.kernel.org; Mon, 03 Nov 2014 21:50:10 +0000
Content-Disposition: inline
In-Reply-To: <20141103161403.79bde878@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 03, 2014 at 04:14:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141031:
> 
> Linus' tree gained a build failure for which I applied a patch.
> 
> The staging tree gained conflicts against the vfs tree.
> 
> The scsi tree gained a build failure so I used the version from
> next-20141031.
> 
> The akpm-current tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 3017
>  2504 files changed, 81573 insertions(+), 104833 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Something is fishy with this tree. I get either warnings or complete failures
with qemu runs on all platforms.

x86_64:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at fs/dcache.c:255 __d_free+0x43/0x50()
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted
3.18.0-rc3-next-20141103-yocto-standard #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.7.5-0-ge51488c-20140602_164612-nilsson.home.kraxel.org 04/01/2014
 0000000000000009 ffff880007c03e38 ffffffff81731601 0000000000000101
 0000000000000000 ffff880007c03e78 ffffffff810484dc ffff880007c03e68
 ffff880006930600 ffff880006930830 000000000000000a 0000000000000000
Call Trace:
 <IRQ>  [<ffffffff81731601>] dump_stack+0x4f/0x7c
 [<ffffffff810484dc>] warn_slowpath_common+0x8c/0xc0
 [<ffffffff8104852a>] warn_slowpath_null+0x1a/0x20
 [<ffffffff81180073>] __d_free+0x43/0x50
 [<ffffffff81098cd1>] rcu_process_callbacks+0x211/0x5c0
 [<ffffffff8104be14>] __do_softirq+0xf4/0x2c0
 [<ffffffff810393d0>] ? rodata_test+0xa0/0xa0
 [<ffffffff8104c1fe>] irq_exit+0x7e/0xa0
 [<ffffffff8173a20a>] smp_apic_timer_interrupt+0x4a/0x60
 [<ffffffff8173898a>] apic_timer_interrupt+0x6a/0x70
 <EOI>  [<ffffffff810393df>] ? start_periodic_check_for_corruption+0xf/0x60
 [<ffffffff810002dc>] ? do_one_initcall+0x8c/0x1c0
 [<ffffffff81080f23>] ? __wake_up+0x53/0x70
 [<ffffffff81ce4126>] kernel_init_freeable+0x14d/0x1e1
 [<ffffffff81ce38fe>] ? do_early_param+0x8d/0x8d
 [<ffffffff8172b240>] ? rest_init+0x90/0x90
 [<ffffffff8172b24e>] kernel_init+0xe/0xf0
 [<ffffffff81737aec>] ret_from_fork+0x7c/0xb0
 [<ffffffff8172b240>] ? rest_init+0x90/0x90

Common theme seems to be the call to rcu_process_callbacks followed by __d_free.

See the qemu logs at http://server.roeck-us.net:8010/builders for more details.

There are also several new build errors.

Error log:
fs/open.c: In function 'SYSC_fchmod':
fs/open.c:530:3: error: implicit declaration of function 'audit_file'
[-Werror=implicit-function-declaration]
   audit_file(f.file);

Guenter
