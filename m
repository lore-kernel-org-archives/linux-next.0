From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build warning after merge of the slab tree
Date: Tue, 15 Mar 2011 12:45:21 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1103151119200.5754@router.home>
References: <20110314200247.92ae2bd7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110314200247.92ae2bd7.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 14 Mar 2011, Stephen Rothwell wrote:

> mm/slub.c: In function 'slab_free':
> mm/slub.c:2124: warning: label 'redo' defined but not used
>
> Introduced by commit 8a5ec0ba42c4 ("Lockless (and preemptless) fastpaths
> for slub").
---

Subject: slub: Dont define useless label in the !CONFIG_CMPXCHG_LOCAL case

The redo label needs #ifdeffery.

Signed-off-by: Christoph Lameter <cl@linux.com>

 mm/slub.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: linux-next/mm/slub.c
===================================================================
--- linux-next.orig/mm/slub.c	2011-03-15 12:41:41.000000000 -0500
+++ linux-next/mm/slub.c	2011-03-15 12:43:06.000000000 -0500
@@ -2119,9 +2119,11 @@ static __always_inline void slab_free(st

 #ifndef CONFIG_CMPXCHG_LOCAL
 	local_irq_save(flags);
-#endif

+#else
 redo:
+#endif
+
 	/*
 	 * Determine the currently cpus per cpu slab.
 	 * The cpu may change afterward. However that does not matter since
