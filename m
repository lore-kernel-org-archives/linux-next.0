From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: Tree for April 22: kmemleak: unreferenced object
Date: Thu, 23 Apr 2009 12:01:29 +0100
Message-ID: <1240484489.20564.32.camel@pc1117.cambridge.arm.com>
References: <20090422154247.dbffd285.sfr@canb.auug.org.au>
	 <20090422124932.GA26289@traven>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:34881 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751445AbZDWLCn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 07:02:43 -0400
In-Reply-To: <20090422124932.GA26289@traven>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 2009-04-22 at 14:49 +0200, Matthias Kaehlcke wrote:
> shortly after booting next-20090422 on an ep9301, kmemleak complains
> about an unreferenced object:
> 
> kmemleak: unreferenced object 0xc5408610 (size 5):
>   comm "swapper", pid 0, jiffies 4294937323
>   backtrace:
>     [<c00267e0>] save_stack_trace+0x24/0x28
>     [<c00a3db4>] kmemleak_alloc+0x144/0x2cc
>     [<c00a211c>] __kmalloc_node+0x1bc/0x1d4
>     [<c008d730>] kstrdup+0x3c/0x54
>     [<c00bedec>] alloc_vfsmnt+0x9c/0x148
>     [<c00a7c10>] vfs_kern_mount+0x34/0xa8
>     [<c00a7ca4>] kern_mount_data+0x20/0x24
>     [<c0013428>] bdev_cache_init+0x54/0xa0
>     [<c0012c74>] vfs_caches_init+0x104/0x140
>     [<c0008980>] start_kernel+0x244/0x2b8
>     [<00008034>] 0x8034
>     [<ffffffff>] 0xffffffff

That's a known leak happening in bdev_cache_init() - the bd_mnt pointer
is never freed (and people argued that we shouldn't be bothered with
freeing it). I marked it with kmemleak_ignore() but forgot about the
block allocated by kstrdup() in alloc_vfsmnt() and referenced from the
vfsmount structure.

I'll change kmemleak_ignore() to kmemleak_not_leak() so that the
vfsmount structure is scanned for other referenced objects.

Thanks.

-- 
Catalin
