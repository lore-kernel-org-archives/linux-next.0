From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build warning after merge of the final tree (slab
 tree related)
Date: Tue, 11 Sep 2012 19:49:38 +0000
Message-ID: <00000139b6e13c92-97adf129-be2c-4b74-9559-0a92c10b9eda-000000@email.amazonses.com>
References: <20120911161923.10299045655dd4c84f96f4b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120911161923.10299045655dd4c84f96f4b3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 11 Sep 2012, Stephen Rothwell wrote:

> After merging the final tree, today's linux-next build (sparc64 defconfig)
> produced this warning:
>
> mm/slab.c:808:13: warning: '__slab_error' defined but not used [-Wunused-function]
>
> Introduced by commit 945cf2b6199b ("mm/sl[aou]b: Extract a common function for kmem_cache_destroy").  All uses of slab_error() are now guarded by DEBUG.


Subject: Slab: Only define slab_error for DEBUG

There is no use case left for slab builds without DEBUG.

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/mm/slab.c
===================================================================
--- linux.orig/mm/slab.c	2012-09-11 14:44:56.304015235 -0500
+++ linux/mm/slab.c	2012-09-11 14:48:46.988948440 -0500
@@ -803,6 +803,7 @@ static void cache_estimate(unsigned long
 	*left_over = slab_size - nr_objs*buffer_size - mgmt_size;
 }

+#if DEBUG
 #define slab_error(cachep, msg) __slab_error(__func__, cachep, msg)

 static void __slab_error(const char *function, struct kmem_cache *cachep,
@@ -812,6 +813,7 @@ static void __slab_error(const char *fun
 	       function, cachep->name, msg);
 	dump_stack();
 }
+#endif

 /*
  * By default on NUMA we use alien caches to stage the freeing of
