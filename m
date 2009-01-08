From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 8 Jan 2009 21:48:35 +0100
Message-ID: <20090108204835.GI496@one.firstfloor.org>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com> <200901071317.29141.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901070858260.8329@quilx.com> <20090107172051.GK496@one.firstfloor.org> <Pine.LNX.4.64.0901071300430.8329@quilx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:58284 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760004AbZAHUe1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 15:34:27 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0901071300430.8329@quilx.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, akpm@osdl.org

On Wed, Jan 07, 2009 at 01:01:06PM -0600, Christoph Lameter wrote:
> On Wed, 7 Jan 2009, Andi Kleen wrote:
> 
> > The C standard says that arithmetic on pointers in defined objects outside
> > the boundaries of these objects (except for the special case of one beyond
> > the end for arrays) is undefined. The gcc optimizers take advantage
> > of this by assuming that such arithmetic doesn't wrap (and might have other
> > assumptions)
> 
> Ok then we need to say so in a comment around RELOC_HIDE.

Here's a patch to do that. Andrew, please add it.

-Andi

---


Add more comments to RELOC_HIDE

Requested by C. Lameter

Signed-off-by: Andi Kleen <ak@linux.intel.com>

---
 include/linux/compiler-gcc.h |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

Index: linux-2.6.28-test/include/linux/compiler-gcc.h
===================================================================
--- linux-2.6.28-test.orig/include/linux/compiler-gcc.h	2008-05-08 12:56:10.000000000 +0200
+++ linux-2.6.28-test/include/linux/compiler-gcc.h	2009-01-08 21:31:55.000000000 +0100
@@ -11,9 +11,19 @@
 /* The "volatile" is due to gcc bugs */
 #define barrier() __asm__ __volatile__("": : :"memory")
 
-/* This macro obfuscates arithmetic on a variable address so that gcc
-   shouldn't recognize the original var, and make assumptions about it */
-/*
+/*
+ * This macro obfuscates arithmetic on a variable address so that gcc
+ * shouldn't recognize the original var, and make assumptions about it.
+ *
+ * This is needed because the C standard makes it undefined to do
+ * pointer arithmetic on "objects" outside their boundaries and the
+ * gcc optimizers assume this is the case. In particular they
+ * assume such arithmetic does not wrap.
+ *
+ * A miscompilation has been observed because of this on PPC.
+ * To work around it we hide the relationship of the pointer and the object
+ * using this macro.
+ *
  * Versions of the ppc64 compiler before 4.1 had a bug where use of
  * RELOC_HIDE could trash r30. The bug can be worked around by changing
  * the inline assembly constraint from =g to =r, in this particular

-- 
ak@linux.intel.com
