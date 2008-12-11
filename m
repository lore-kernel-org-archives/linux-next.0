From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] next-20081210: BUG: sleeping function called from invalid context at mm/slub.c:1619 (XFS)
Date: Thu, 11 Dec 2008 19:29:55 +0100
Message-ID: <20081211182955.GB27952@lst.de>
References: <a4423d670812110210g50d66304pb0a7d96b3dde00c7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:60411 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755510AbYLKSaB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 13:30:01 -0500
Content-Disposition: inline
In-Reply-To: <a4423d670812110210g50d66304pb0a7d96b3dde00c7@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, xfs@oss.sgi.com, xfs-masters@oss.sgi.com

On Thu, Dec 11, 2008 at 01:10:23PM +0300, Alexander Beregalov wrote:
> BUG: sleeping function called from invalid context at mm/slub.c:1619
> in_atomic(): 1, irqs_disabled(): 0, pid: 8096, name: sh
> INFO: lockdep is turned off.
> Pid: 8096, comm: sh Tainted: G        W  2.6.28-rc7-next-20081210 #2
> Call Trace:
>  [<ffffffff80256e5a>] ? __debug_show_held_locks+0x1b/0x24
>  [<ffffffff8022fb55>] __might_sleep+0x120/0x122
>  [<ffffffff8029c526>] __kmalloc+0x70/0xfc
>  [<ffffffff803534d2>] kmem_alloc+0x75/0xd7
>  [<ffffffff803350ba>] xfs_fs_vcmn_err+0x46/0x94
>  [<ffffffff80335297>] xfs_fs_cmn_err+0x59/0x5e

xfs_fs_vcmn_err does a sleeping memory allocation under a spinlock,
nasty.  I have an idea that will get rid of the memory allocation
completely, I'll come back to you once I have hacked something up.

> Filesystem "sda2": xlog_space_left: head behind tail
>   tail_cycle = 1802201963, tail_bytes = -690563584
>   GH   cycle = 3078, GH   bytes = 69183384

This btw is a bug, too..
