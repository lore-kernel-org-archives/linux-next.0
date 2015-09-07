From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 8 Sep 2015 09:20:35 +1000
Message-ID: <20150908092035.64a6b455@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56197 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751268AbbIGXUh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2015 19:20:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  mm/Makefile

between commit:

  c1a4de99fada ("userfaultfd: mcopy_atomic|mfill_zeropage: UFFDIO_COPY|UFFDIO_ZEROPAGE preparation")

from Linus' tree and commit:

  8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/Makefile
index b424d5e5b6ff,be5d5c866305..000000000000
--- a/mm/Makefile
+++ b/mm/Makefile
@@@ -78,4 -78,4 +78,5 @@@ obj-$(CONFIG_CMA)	+= cma.
  obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
  obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
  obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
 +obj-$(CONFIG_USERFAULTFD) += userfaultfd.o
+ obj-$(CONFIG_FRAME_VECTOR) += frame_vector.o
