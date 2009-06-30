From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 10:34:10 +0200
Message-ID: <20090630083410.GA1114@wotan.suse.de>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <4A49A3B4.5070501@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:51869 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750937AbZF3IjQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 04:39:16 -0400
Content-Disposition: inline
In-Reply-To: <4A49A3B4.5070501@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

If you are not seeing any extra messages from the patch, then it
could be that you are seeing ZERO_SIZE_PTR or similar errors as
well. I will ask if you can try the patch I sent in the other
thread.

Thanks,
Nick

On Tue, Jun 30, 2009 at 11:03:40AM +0530, Sachin Sant wrote:
> Loglevel set to 8
> Unable to handle kernel paging request for data at address 0xc0000000008f4504
> Faulting instruction address: 0xc000000000391094
> Oops: Kernel access of bad area, sig: 11 [#1]
> SMP NR_CPUS=1024 DEBUG_PAGEALLOC NUMA pSeries
> Modules linked in: scsi_mod(+)
> NIP: c000000000391094 LR: c00000000060cd88 CTR: 0000000000000008
> REGS: c0000000c63f3590 TRAP: 0300   Not tainted  (2.6.31-rc1-next-20090629)
> MSR: 8000000000009032 <EE,ME,IR,DR>  CR: 24222428  XER: 20000001
> DAR: c0000000008f4504, DSISR: 0000000040000000
> TASK = c0000000c63e0a80[62] 'modprobe' THREAD: c0000000c63f0000 CPU: 1
> GPR00: c00000000060cd88 c0000000c63f3810 c000000000b0c488 c0000000008f4500 
> GPR04: c0000000ddcd0000 0000000000000001 0000000000000000 c0000000dfff8480 
> GPR08: 0000000000000001 c0000000de000010 0000000000000002 c000000000c681f8 
> GPR12: 0000000024222428 c000000000be2600 0000000000000000 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000018 ffffffffffffffff 0000000000210d00 0000000000000010 
> GPR24: 0000000000210d00 c0000000dfc60ea0 c000000000fc1580 c0000000008f4500 
> GPR28: c0000000008f4448 c0000000008f4500 c000000000a87bd0 c0000000dfc60e80 
> NIP [c000000000391094] ._raw_spin_lock+0x30/0x184
> LR [c00000000060cd88] ._spin_lock+0x10/0x24
> Call Trace:
> [c0000000c63f38b0] [c00000000060cd88] ._spin_lock+0x10/0x24
> [c0000000c63f3920] [c000000000150030] .__slab_alloc_page+0x390/0x430
> [c0000000c63f39e0] [c0000000001518f0] .kmem_cache_alloc+0x160/0x2bc
> [c0000000c63f3aa0] [c000000000152308] .kmem_cache_create+0x294/0x2a8
> [c0000000c63f3b90] [d000000000eb177c] .scsi_init_queue+0x38/0x170 [scsi_mod]
> [c0000000c63f3c20] [d000000000eb1678] .init_scsi+0x1c/0xe8 [scsi_mod]
> [c0000000c63f3ca0] [c0000000000097a0] .do_one_initcall+0x80/0x19c
> [c0000000c63f3d90] [c0000000000c7a08] .SyS_init_module+0x118/0x28c
> [c0000000c63f3e30] [c000000000008534] syscall_exit+0x0/0x40
> Instruction dump:
> 7c0802a6 fba1ffe8 7d800026 7c7d1b78 fbc1fff0 ebc2c268 f8010010 fb61ffd8 
> fb81ffe0 fbe1fff8 91810008 f821ff61 <80030004> 6c09dead 2f894ead 419e000c 
> ---[ end trace e7d1b9681037bc75 ]---
