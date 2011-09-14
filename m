From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the slab tree
Date: Wed, 14 Sep 2011 16:24:25 +1000
Message-ID: <20110914162425.f96e77178dd836da6f825de2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:37554 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748Ab1INGYa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Sep 2011 02:24:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

Hi Andrew,

Today's linux-next merge of the scsi-post-merge tree got a conflict in
mm/slab.c between commit fdde6abb3e8d ("slab: use print_hex_dump") from
the slab tree and commit 0cf5ab251a1a ("When we get corruption reports,
it's useful to see if the kernel was") from the akpm tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/slab.c
index 5bfc204,10a3624..0000000
--- a/mm/slab.c
+++ b/mm/slab.c
@@@ -3037,11 -3037,16 +3037,11 @@@ static void check_slabp(struct kmem_cac
  	if (entries != cachep->num - slabp->inuse) {
  bad:
  		printk(KERN_ERR "slab: Internal list corruption detected in "
- 				"cache '%s'(%d), slabp %p(%d). Hexdump:\n",
- 			cachep->name, cachep->num, slabp, slabp->inuse);
+ 				"cache '%s'(%d), slabp %p(%d). Tainted(%s). Hexdump:\n",
+ 			cachep->name, cachep->num, slabp, slabp->inuse, print_tainted());
 -		for (i = 0;
 -		     i < sizeof(*slabp) + cachep->num * sizeof(kmem_bufctl_t);
 -		     i++) {
 -			if (i % 16 == 0)
 -				printk("\n%03x:", i);
 -			printk(" %02x", ((unsigned char *)slabp)[i]);
 -		}
 -		printk("\n");
 +		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 16, 1, slabp,
 +			sizeof(*slabp) + cachep->num * sizeof(kmem_bufctl_t),
 +			1);
  		BUG();
  	}
  }
