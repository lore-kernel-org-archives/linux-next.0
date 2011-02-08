From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Tue, 8 Feb 2011 09:55:48 -0600 (CST)
Message-ID: <alpine.DEB.2.00.1102080954330.13649@router.home>
References: <20110131144246.dfa2abe3.sfr@canb.auug.org.au> <1296502339.30654.13.camel@jaguar> <alpine.DEB.2.00.1102030919380.6519@router.home> <alpine.DEB.2.00.1102080952490.13202@router.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp106.prem.mail.ac4.yahoo.com ([76.13.13.45]:39299 "HELO
	smtp106.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753283Ab1BHPzv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Feb 2011 10:55:51 -0500
In-Reply-To: <alpine.DEB.2.00.1102080952490.13202@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Tso <tytso@MIT.EDU>

Argh. I accidentally sent an older version of the patch. This one is the
tested one.


Subject: ext4: Remove use of kmem_cache_name

Remove the use of kmem_cache_name from ext4. In order to do that we need to
strdup the name of the cache passed to kmem_cache_create.

Signed-off-by: Christoph Lameter <cl@linux.com>


---
 fs/ext4/mballoc.c |   12 ++----------
 mm/slab.c         |    7 ++++++-
 2 files changed, 8 insertions(+), 11 deletions(-)

Index: linux-2.6/fs/ext4/mballoc.c
===================================================================
--- linux-2.6.orig/fs/ext4/mballoc.c	2011-02-08 09:02:40.000000000 -0600
+++ linux-2.6/fs/ext4/mballoc.c	2011-02-08 09:11:16.000000000 -0600
@@ -2448,15 +2448,10 @@ int ext4_mb_init(struct super_block *sb,
 					bb_counters[sb->s_blocksize_bits + 2]);

 		sprintf(name, "ext4_groupinfo_%d", sb->s_blocksize_bits);
-		namep = kstrdup(name, GFP_KERNEL);
-		if (!namep) {
-			ret = -ENOMEM;
-			goto out;
-		}

 		/* Need to free the kmem_cache_name() when we
 		 * destroy the slab */
-		cachep = kmem_cache_create(namep, len, 0,
+		cachep = kmem_cache_create(name, len, 0,
 					     SLAB_RECLAIM_ACCOUNT, NULL);
 		if (!cachep) {
 			ret = -ENOMEM;
@@ -2746,11 +2741,8 @@ void ext4_exit_mballoc(void)

 	for (i = 0; i < NR_GRPINFO_CACHES; i++) {
 		struct kmem_cache *cachep = ext4_groupinfo_caches[i];
-		if (cachep) {
-			char *name = (char *)kmem_cache_name(cachep);
+		if (cachep)
 			kmem_cache_destroy(cachep);
-			kfree(name);
-		}
 	}
 	ext4_remove_debugfs_entry();
 }
Index: linux-2.6/mm/slab.c
===================================================================
--- linux-2.6.orig/mm/slab.c	2011-02-08 09:06:38.000000000 -0600
+++ linux-2.6/mm/slab.c	2011-02-08 09:25:39.000000000 -0600
@@ -2005,6 +2005,7 @@ static void __kmem_cache_destroy(struct
 			kfree(l3);
 		}
 	}
+	kfree(cachep->name);
 	kmem_cache_free(&cache_cache, cachep);
 }

@@ -2412,7 +2413,11 @@ kmem_cache_create (const char *name, siz
 		BUG_ON(ZERO_OR_NULL_PTR(cachep->slabp_cache));
 	}
 	cachep->ctor = ctor;
-	cachep->name = name;
+	if (slab_is_available())
+		cachep->name = kstrdup(name, GFP_KERNEL);
+	else
+		/* Will never be freed so it does not matter */
+		cachep->name = name;

 	if (setup_cpu_cache(cachep, gfp)) {
 		__kmem_cache_destroy(cachep);
