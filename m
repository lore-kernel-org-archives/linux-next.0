From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ext4 tree with the  tree
Date: Wed, 25 Feb 2009 12:52:54 +1100
Message-ID: <20090225125254.6e94f404.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54025 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751856AbZBYBxE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 20:53:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org, Mingming Cao <cmm@us.ibm.com>, Jan Kara <jack@suse.cz>

Hi Ted,

Today's linux-next merge of the ext4 tree got a conflict in
fs/ext4/ext4.h between commit 7c989bb2f1b18268968ce44c603f18a9854b1b85
("ext4: quota reservation for delayed allocation") from the quota tree
and commit eafffefbb8cc3db4acebb75014091b473c60007d ("ext4: add
EXT4_IOC_ALLOC_DA_BLKS ioctl") from the ext4 tree.

Just overlapping additions. I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/ext4.h
index 6083bb3,09626d3..0000000
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@@ -1099,7 -1097,7 +1098,8 @@@ extern int ext4_chunk_trans_blocks(stru
  extern int ext4_block_truncate_page(handle_t *handle,
  		struct address_space *mapping, loff_t from);
  extern int ext4_page_mkwrite(struct vm_area_struct *vma, struct page *page);
 +extern qsize_t ext4_get_reserved_space(struct inode *inode);
+ extern int ext4_alloc_da_blocks(struct inode *inode);
  
  /* ioctl.c */
  extern long ext4_ioctl(struct file *, unsigned int, unsigned long);
