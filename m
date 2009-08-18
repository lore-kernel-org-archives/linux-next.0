From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xfs tree with Linus' tree
Date: Tue, 18 Aug 2009 10:12:15 +1000
Message-ID: <20090818101215.aba4d0bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53680 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752730AbZHRAMT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2009 20:12:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Sandeen <sandeen@sandeen.net>, Felix Blyakher <felixb@sgi.com>, Christoph Hellwig <hch@infradead.org>

Hi all,

Today's linux-next merge of the xfs tree got a conflict in
fs/xfs/linux-2.6/xfs_sync.h between commit
bc990f5cb424cdca9dda866785d088e2c2110ecc ("xfs: fix locking in
xfs_iget_cache_hit") from Linus' tree and commit
370f048214b4e9aa2102fa3c454ae1374da287c5 ("xfs: add more statics & drop
some unused functions") from the xfs tree.

Just context changes (add/remove). I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/xfs/linux-2.6/xfs_sync.h
index 5912060,23e7e7e..0000000
--- a/fs/xfs/linux-2.6/xfs_sync.h
+++ b/fs/xfs/linux-2.6/xfs_sync.h
@@@ -48,8 -48,6 +48,7 @@@ int xfs_reclaim_inode(struct xfs_inode 
  int xfs_reclaim_inodes(struct xfs_mount *mp, int mode);
  
  void xfs_inode_set_reclaim_tag(struct xfs_inode *ip);
 +void __xfs_inode_set_reclaim_tag(struct xfs_perag *pag, struct xfs_inode *ip);
- void xfs_inode_clear_reclaim_tag(struct xfs_inode *ip);
  void __xfs_inode_clear_reclaim_tag(struct xfs_mount *mp, struct xfs_perag *pag,
  				struct xfs_inode *ip);
  
