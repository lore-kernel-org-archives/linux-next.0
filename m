From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the block tree
Date: Wed, 28 Jun 2017 16:13:24 +1000
Message-ID: <20170628161324.431c1307@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38877 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750934AbdF1GN0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 02:13:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  include/linux/fs.h

between commit:

  c75b1d9421f8 ("fs: add fcntl() interface for setting/getting write life time hints")

from the block tree and commit:

  3abc2b3fcf5c ("randstruct: Mark various structs for randomization")

from the kspp tree.

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
index 0ddaac8f66d9,8f28143486c4..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -293,8 -275,7 +293,8 @@@ struct kiocb 
  	void (*ki_complete)(struct kiocb *iocb, long ret, long ret2);
  	void			*private;
  	int			ki_flags;
 +	enum rw_hint		ki_hint;
- };
+ } __randomize_layout;
  
  static inline bool is_sync_kiocb(struct kiocb *kiocb)
  {
@@@ -401,8 -392,7 +401,8 @@@ struct address_space 
  	gfp_t			gfp_mask;	/* implicit gfp mask for allocations */
  	struct list_head	private_list;	/* ditto */
  	void			*private_data;	/* ditto */
 +	errseq_t		wb_err;
- } __attribute__((aligned(sizeof(long))));
+ } __attribute__((aligned(sizeof(long)))) __randomize_layout;
  	/*
  	 * On most architectures that alignment is already the case; but
  	 * must be enforced here for CRIS, to let the least significant bit
@@@ -881,8 -868,8 +881,9 @@@ struct file 
  	struct list_head	f_tfile_llink;
  #endif /* #ifdef CONFIG_EPOLL */
  	struct address_space	*f_mapping;
 +	errseq_t		f_md_wb_err; /* metadata wb error tracking */
- } __attribute__((aligned(4)));	/* lest something weird decides that 2 is OK */
+ } __randomize_layout
+   __attribute__((aligned(4)));	/* lest something weird decides that 2 is OK */
  
  struct file_handle {
  	__u32 handle_bytes;
