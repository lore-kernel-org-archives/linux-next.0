From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the ext4 tree
Date: Fri, 3 Nov 2017 17:59:16 +1100
Message-ID: <20171103175916.0c8c9f61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45209 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750971AbdKCG7U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 02:59:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  fs/ext4/inode.c

between commit:

  545052e9e35a ("ext4: Switch to iomap for SEEK_HOLE / SEEK_DATA")

from the ext4 tree and commit:

  31bc9582e43d ("ext4: Support for synchronous DAX faults")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Thanks, Dan, for the heads up and sample resolutions.
-- 
Cheers,
Stephen Rothwell

diff --cc fs/ext4/inode.c
index 14bff666d2fc,13a198924a0f..000000000000
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@@ -3394,6 -3393,20 +3394,19 @@@ static int ext4_releasepage(struct pag
  		return try_to_free_buffers(page);
  }
  
 -#ifdef CONFIG_FS_DAX
+ static bool ext4_inode_datasync_dirty(struct inode *inode)
+ {
+ 	journal_t *journal = EXT4_SB(inode->i_sb)->s_journal;
+ 
+ 	if (journal)
+ 		return !jbd2_transaction_committed(journal,
+ 					EXT4_I(inode)->i_datasync_tid);
+ 	/* Any metadata buffers to write? */
+ 	if (!list_empty(&inode->i_mapping->private_list))
+ 		return true;
+ 	return inode->i_state & I_DIRTY_DATASYNC;
+ }
+ 
  static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
  			    unsigned flags, struct iomap *iomap)
  {
