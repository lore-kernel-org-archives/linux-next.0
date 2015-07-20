From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cris tree with Linus' tree
Date: Mon, 20 Jul 2015 10:01:44 +1000
Message-ID: <20150720100144.7c6d40fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38867 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754068AbbGTABu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Jul 2015 20:01:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>, Rabin Vincent <rabin@rab.in>, Laurent Dufour <ldufour@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Jesper,

Today's linux-next merge of the cris tree got a conflict in:

  arch/cris/include/asm/Kbuild

between commits:

  c546d5db75b4 ("remove scatterlist.h generation from arch Kbuild files")
  f2abeef9fd6f ("mm: clean up per architecture MM hook header files")

from Linus' tree and commit:

  d0529229a92c ("CRIS: UAPI: use generic headers via Kbuild")

from the cris tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/cris/include/asm/Kbuild
index ad2244f35bca,2fc4331a69ca..000000000000
--- a/arch/cris/include/asm/Kbuild
+++ b/arch/cris/include/asm/Kbuild
@@@ -18,12 -24,23 +24,23 @@@ generic-y += linkage.
  generic-y += local.h
  generic-y += local64.h
  generic-y += mcs_spinlock.h
+ generic-y += mman.h
 +generic-y += mm-arch-hooks.h
  generic-y += module.h
+ generic-y += msgbuf.h
  generic-y += percpu.h
+ generic-y += poll.h
  generic-y += preempt.h
+ generic-y += resource.h
 -generic-y += scatterlist.h
  generic-y += sections.h
+ generic-y += sembuf.h
+ generic-y += shmbuf.h
+ generic-y += siginfo.h
+ generic-y += socket.h
+ generic-y += sockios.h
+ generic-y += statfs.h
  generic-y += topology.h
  generic-y += trace_clock.h
+ generic-y += types.h
  generic-y += vga.h
  generic-y += xor.h
