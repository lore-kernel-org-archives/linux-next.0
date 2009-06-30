From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 11:06:31 +0200
Message-ID: <20090630090631.GB1114@wotan.suse.de>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <20090629115038.GD9321@osiris.boeblingen.de.ibm.com> <20090629115835.GA2308@wotan.suse.de> <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60546 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752796AbZF3JG3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 05:06:29 -0400
Content-Disposition: inline
In-Reply-To: <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Mon, Jun 29, 2009 at 04:12:34PM +0200, Heiko Carstens wrote:
> slqb returns ZERO_SIZE_PTR instead of NULL for large size requests it cannot
> handle.
> The patch below would fix it. But I think its too ugly. So I leave it up to
> Nick to come up with a real and nice patch ;)

Could you try this patch and see if it helps? (it fixes a number
of simple corner cases here, *blush*)

--

SLQB: fix allocation size checking

SLQB would return ZERO_SIZE_PTR rather than NULL if the requested size is too
large. Debugged by Heiko Carstens. Fix this by checking size edge cases up
front rather than in the slab index calculation.

Additionally, if the size parameter was non-constant and too large, then
the checks may not have been performed at all which could cause corruption.

Next, ARCH_KMALLOC_MINALIGN may not be obeyed if size is non-constant. So
test for KMALLOC_MIN_SIZE in that case.

Finally, if KMALLOC_SHIFT_SLQB_HIGH is larger than 2MB, then kmalloc_index
could silently run off the end of its precomputed table and return a -1
index into the kmalloc slab array, which could result in corruption. Extend
this to allow up to 32MB (to match SLAB), and add a compile-time error in
the case that the table is exceeded (also like SLAB).

---
 include/linux/slqb_def.h |   17 ++++++++++-------
 mm/slqb.c                |   18 ++++++++++++++----
 2 files changed, 24 insertions(+), 11 deletions(-)

Index: linux-2.6/include/linux/slqb_def.h
===================================================================
--- linux-2.6.orig/include/linux/slqb_def.h
+++ linux-2.6/include/linux/slqb_def.h
@@ -184,10 +184,7 @@ extern struct kmem_cache kmalloc_caches_
  */
 static __always_inline int kmalloc_index(size_t size)
 {
-	if (unlikely(!size))
-		return 0;
-	if (unlikely(size > 1UL << KMALLOC_SHIFT_SLQB_HIGH))
-		return 0;
+	extern int ____kmalloc_too_large(void);
 
 	if (unlikely(size <= KMALLOC_MIN_SIZE))
 		return KMALLOC_SHIFT_LOW;
@@ -219,7 +216,11 @@ static __always_inline int kmalloc_index
 	if (size <= 512 * 1024) return 19;
 	if (size <= 1024 * 1024) return 20;
 	if (size <=  2 * 1024 * 1024) return 21;
-	return -1;
+	if (size <=  4 * 1024 * 1024) return 22;
+	if (size <=  8 * 1024 * 1024) return 23;
+	if (size <=  16 * 1024 * 1024) return 24;
+	if (size <=  32 * 1024 * 1024) return 25;
+	return ____kmalloc_too_large();
 }
 
 #ifdef CONFIG_ZONE_DMA
@@ -238,10 +239,12 @@ static __always_inline struct kmem_cache
 {
 	int index;
 
-	index = kmalloc_index(size);
-	if (unlikely(index == 0))
+	if (unlikely(size > 1UL << KMALLOC_SHIFT_SLQB_HIGH))
+		return NULL;
+	if (unlikely(!size))
 		return ZERO_SIZE_PTR;
 
+	index = kmalloc_index(size);
 	if (likely(!(flags & SLQB_DMA)))
 		return &kmalloc_caches[index];
 	else
Index: linux-2.6/mm/slqb.c
===================================================================
--- linux-2.6.orig/mm/slqb.c
+++ linux-2.6/mm/slqb.c
@@ -2514,18 +2514,28 @@ static struct kmem_cache *get_slab(size_
 {
 	int index;
 
+	if (unlikely(size <= KMALLOC_MIN_SIZE)) {
+		if (unlikely(!size))
+			return ZERO_SIZE_PTR;
+
+		index = KMALLOC_SHIFT_LOW;
+		goto got_index;
+	}
+
 #if L1_CACHE_BYTES >= 128
 	if (size <= 128) {
 #else
 	if (size <= 192) {
 #endif
-		if (unlikely(!size))
-			return ZERO_SIZE_PTR;
-
 		index = size_index[(size - 1) / 8];
-	} else
+	} else {
+		if (unlikely(size > 1UL << KMALLOC_SHIFT_SLQB_HIGH))
+			return NULL;
+
 		index = fls(size - 1);
+	}
 
+got_index:
 	if (unlikely((flags & SLQB_DMA)))
 		return &kmalloc_caches_dma[index];
 	else
