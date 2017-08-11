From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 11 Aug 2017 17:53:26 +1000
Message-ID: <20170811175326.36d546dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752349AbdHKHx3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Aug 2017 03:53:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  include/linux/mm_types.h
  mm/huge_memory.c

between commit:

  8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")

from the tip tree and commits:

  16af97dc5a89 ("mm: migrate: prevent racy access to tlb_flush_pending")
  a9b802500ebb ("Revert "mm: numa: defer TLB flush for THP migration as long as possible"")

from the akpm-current tree.

The latter 2 are now in Linus' tree as well (but were not when I started
the day).

The only way forward I could see was to revert

  8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")

and the three following commits

  ff7a5fb0f1d5 ("overlayfs, locking: Remove smp_mb__before_spinlock() usage")
  d89e588ca408 ("locking: Introduce smp_mb__after_spinlock()")
  a9668cd6ee28 ("locking: Remove smp_mb__before_spinlock()")

before merging the akpm-current tree again.

-- 
Cheers,
Stephen Rothwell
