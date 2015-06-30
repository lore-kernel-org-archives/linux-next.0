From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build warning in the origin tree
Date: Tue, 30 Jun 2015 09:01:11 -0500 (CDT)
Message-ID: <alpine.DEB.2.11.1506300900450.12501@east.gentwo.org>
References: <20150630135009.75cb607a@canb.auug.org.au>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150630135009.75cb607a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 30 Jun 2015, Stephen Rothwell wrote:

> WARNING: mm/built-in.o(.text.unlikely+0xc22): Section mismatch in reference from the function .new_kmalloc_cache() to the variable .init.rodata:kmalloc_info
> The function .new_kmalloc_cache() references
> the variable __initconst kmalloc_info.
> This is often because .new_kmalloc_cache lacks a __initconst
> annotation or the annotation of kmalloc_info is wrong.
>
> Caused by commit a9730fca9946 ("Fix kmalloc slab creation sequence").


Subject: Add __init attribute to new_kmalloc_cache

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/mm/slab_common.c
===================================================================
--- linux.orig/mm/slab_common.c
+++ linux/mm/slab_common.c
@@ -855,7 +855,7 @@ void __init setup_kmalloc_cache_index_ta
 	}
 }

-static void new_kmalloc_cache(int idx, unsigned long flags)
+static void __init new_kmalloc_cache(int idx, unsigned long flags)
 {
 	kmalloc_caches[idx] = create_kmalloc_cache(kmalloc_info[idx].name,
 					kmalloc_info[idx].size, flags);
