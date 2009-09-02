From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: xfs tree build failure
Date: Wed, 2 Sep 2009 03:28:44 +0200
Message-ID: <20090902012844.GA15549@lst.de>
References: <20090902112509.739ce995.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:41353 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755370AbZIBB3d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Sep 2009 21:29:33 -0400
Content-Disposition: inline
In-Reply-To: <20090902112509.739ce995.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Felix Blyakher <felixb@sgi.com>, Alex Elder <aelder@sgi.com>

On Wed, Sep 02, 2009 at 11:25:09AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/xfs/xfs_ialloc.c:63: error: static declaration of 'xfs_inobt_lookup' follows non-static declaration
> fs/xfs/xfs_ialloc.h:155: note: previous declaration of 'xfs_inobt_lookup' was here
> 
> Caused by commit 2187550525d7bcb8c87689e4eca41b1955bf9ac3 ("xfs:
> rationalize xfs_inobt_lookup*").

I've sent a fix to the list about an hour ago:



Subject: [PATCH] xfs: un-static xfs_inobt_lookup
From: Christoph Hellwig <hch@lst.de>

xfs_inobt_lookup is also used in xfs_itable.c, remove the STATIC modifier
from it's declaration to fix non-debug builds.

This was already fixed in my git tree vs the version last posted to the
list.

Signed-off-by: Christoph Hellwig <hch@lst.de>

Index: xfs/fs/xfs/xfs_ialloc.c
===================================================================
--- xfs.orig/fs/xfs/xfs_ialloc.c	2009-09-01 20:47:28.515468366 -0300
+++ xfs/fs/xfs/xfs_ialloc.c	2009-09-01 20:47:33.867913011 -0300
@@ -59,7 +59,7 @@ xfs_ialloc_cluster_alignment(
 /*
  * Lookup a record by ino in the btree given by cur.
  */
-STATIC int				/* error */
+int					/* error */
 xfs_inobt_lookup(
 	struct xfs_btree_cur	*cur,	/* btree cursor */
 	xfs_agino_t		ino,	/* starting inode of chunk */
> 
> I have used the version of the xfs tree from next-20090901 for today.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/


---end quoted text---
