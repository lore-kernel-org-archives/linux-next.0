From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the file-locks tree
Date: Wed, 28 Jun 2017 11:57:21 +1000
Message-ID: <20170628115721.3e594e2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752549AbdF1B5Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jun 2017 21:57:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  include/linux/fs.h

between commit:

  3f64df8a51ce ("fs: new infrastructure for writeback error handling and reporting")

from the file-locks tree and commit:

  c75b1d9421f8 ("fs: add fcntl() interface for setting/getting write life time hints")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index 6830a4ea9eed,65adbddb3163..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -848,7 -856,7 +857,8 @@@ struct file 
  	 * Must not be taken from IRQ context.
  	 */
  	spinlock_t		f_lock;
 +	errseq_t		f_wb_err;
+ 	enum rw_hint		f_write_hint;
  	atomic_long_t		f_count;
  	unsigned int 		f_flags;
  	fmode_t			f_mode;
@@@ -2512,9 -2542,11 +2539,11 @@@ extern int write_inode_now(struct inod
  extern int filemap_fdatawrite(struct address_space *);
  extern int filemap_flush(struct address_space *);
  extern int filemap_fdatawait(struct address_space *);
 -extern void filemap_fdatawait_keep_errors(struct address_space *);
 +extern int filemap_fdatawait_keep_errors(struct address_space *mapping);
  extern int filemap_fdatawait_range(struct address_space *, loff_t lstart,
  				   loff_t lend);
+ extern bool filemap_range_has_page(struct address_space *, loff_t lstart,
+ 				  loff_t lend);
  extern int filemap_write_and_wait(struct address_space *mapping);
  extern int filemap_write_and_wait_range(struct address_space *mapping,
  				        loff_t lstart, loff_t lend);
