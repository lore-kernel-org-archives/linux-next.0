From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the slab tree
Date: Tue, 16 Jun 2009 15:46:52 +1000
Message-ID: <20090616154652.b8adcb9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57054 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752253AbZFPFqz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 01:46:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Piggin <npiggin@suse.de>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, Vegard Nossum <vegard.nossum@gmail.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in mm/slub.c
between commit 964cf35c88f93b4927dbc4e950dfa4d880c7f9d1 ("SLUB: Fix early
boot GFP_DMA allocations") from the slab tree and commit
18fd427debcf37c06917b55295df682fd05fee76 ("slub: add hooks for
kmemcheck") from the tip tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/slub.c
index 3976098,73fb7d1..0000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -2700,18 -2657,10 +2726,18 @@@ static noinline struct kmem_cache *dma_
  			 (unsigned int)realsize);
  	s = kmalloc(kmem_size, flags & ~SLUB_DMA);
  
 +	/*
 +	 * Must defer sysfs creation to a workqueue because we don't know
 +	 * what context we are called from. Before sysfs comes up, we don't
 +	 * need to do anything because our sysfs initcall will start by
 +	 * adding all existing slabs to sysfs.
 +	 */
- 	slabflags = SLAB_CACHE_DMA;
++	slabflags = SLAB_CACHE_DMA | SLAB_NOTRACK;
 +	if (slab_state >= SYSFS)
 +		slabflags |= __SYSFS_ADD_DEFERRED;
 +
  	if (!s || !text || !kmem_cache_open(s, flags, text,
 -			realsize, ARCH_KMALLOC_MINALIGN,
 -			SLAB_CACHE_DMA|SLAB_NOTRACK|__SYSFS_ADD_DEFERRED,
 -			NULL)) {
 +			realsize, ARCH_KMALLOC_MINALIGN, slabflags, NULL)) {
  		kfree(s);
  		kfree(text);
  		goto unlock_out;
