From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 1 Oct 2012 12:56:19 -0700
Message-ID: <20121001125619.97649131.akpm@linux-foundation.org>
References: <20120928163029.19d304240b796e2c7a7d633b@canb.auug.org.au>
	<Pine.LNX.4.64.1209281117580.21946@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42662 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751843Ab2JAT4U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Oct 2012 15:56:20 -0400
In-Reply-To: <Pine.LNX.4.64.1209281117580.21946@file.rdu.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michel Lespinasse <walken@google.com>, Jens Axboe <axboe@kernel.dk>

On Fri, 28 Sep 2012 11:19:29 -0400 (EDT)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> > -	if (!prio_tree_empty(&mapping->i_mmap) ||
> > +	if (!RB_EMPTY_ROOT(&mapping->i_mmap) ||
> >  	    !list_empty(&mapping->i_mmap_nonlinear)) {
> >  		mutex_unlock(&mapping->i_mmap_mutex);
> >  		percpu_up_write(&bdev->bd_block_size_semaphore);
> > -- 
> > 1.7.10.280.gaa39
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> 
> ... or replace it with
> 
> if (mapping_mapped(&mapping)) { ...

yup..

From: Andrew Morton <akpm@linux-foundation.org>
Subject: fs/block_dev.c:set_blocksize(): use mapping_mapped()

... instead of open-coding it.

Suggested-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/block_dev.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -puN fs/block_dev.c~fs-block_devc-set_blocksize-use-mapping_mapped fs/block_dev.c
--- a/fs/block_dev.c~fs-block_devc-set_blocksize-use-mapping_mapped
+++ a/fs/block_dev.c
@@ -27,7 +27,6 @@
 #include <linux/namei.h>
 #include <linux/log2.h>
 #include <linux/cleancache.h>
-#include <linux/rbtree.h>
 #include <asm/uaccess.h>
 #include "internal.h"
 
@@ -133,8 +132,7 @@ int set_blocksize(struct block_device *b
 	/* Check that the block device is not memory mapped */
 	mapping = bdev->bd_inode->i_mapping;
 	mutex_lock(&mapping->i_mmap_mutex);
-	if (!RB_EMPTY_ROOT(&mapping->i_mmap) ||
-	    !list_empty(&mapping->i_mmap_nonlinear)) {
+	if (mapping_mapped(mapping)) {
 		mutex_unlock(&mapping->i_mmap_mutex);
 		percpu_up_write(&bdev->bd_block_size_semaphore);
 		return -EBUSY;
_
