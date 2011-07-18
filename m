From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the writeback tree with the vfs tree
Date: Mon, 18 Jul 2011 17:29:44 +1000
Message-ID: <20110718172944.7ffeea475a3da14f421ef527@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43079 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745Ab1GRH3v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2011 03:29:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wu Fengguang <fengguang.wu@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>

Hi Wu,

Today's linux-next merge of the writeback tree got a conflict in
mm/filemap.c between commit ba96a361e21b ("fs: kill i_alloc_sem") from
the vfs tree and commit f758eeabeb96 ("writeback: split
inode_wb_list_lock into bdi_writeback.list_lock") from the writeback tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/filemap.c
index f820e60,1e492c3..0000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -78,7 -78,10 +78,7 @@@
   *  ->i_mutex			(generic_file_buffered_write)
   *    ->mmap_sem		(fault_in_pages_readable->do_page_fault)
   *
-  *  inode_wb_list_lock
 - *  ->i_mutex
 - *    ->i_alloc_sem             (various)
 - *
+  *  bdi->wb.list_lock
   *    sb_lock			(fs/fs-writeback.c)
   *    ->mapping->tree_lock	(__sync_single_inode)
   *
