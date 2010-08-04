From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the xfs tree
Date: Wed, 4 Aug 2010 11:54:28 +1000
Message-ID: <20100804115428.420d0c07.sfr@canb.auug.org.au>
References: <20100705100248.173ec8ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34354 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758008Ab0HDByb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 21:54:31 -0400
In-Reply-To: <20100705100248.173ec8ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com

Hi Al,

On Mon, 5 Jul 2010 10:02:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the vfs tree got a conflict in
> fs/xfs/linux-2.6/xfs_super.c between commit
> 04d2da9c682ce2687db29136c60d8679e37e3b35 ("xfs: split xfs_itrace_entry")
> from the xfs tree and commit b43cb885cc49c782dd0734292d3cd95631200e5c
> ("convert remaining ->clear_inode() to ->evict_inode()") from the vfs
> tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.  I guess that the tracing code needs updating for the
> xfs_fs_clear_inode -> xfs_fs_evict_inode name change as well.  And I am
> wondering if the tracing wants to go ahead of the truncate_inode_pages()
> call?
> 
> In anticipation, I have added this merge fix patch as well:

Linus has now merged the xfs tree, so this patch can be applied to the
vfs tree (assuming it is ok).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Jul 2010 09:43:42 +1000
Subject: [PATCH] xfs: update tracing for clear_inode to evict_inode transition

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/xfs/linux-2.6/xfs_super.c |    4 ++--
 fs/xfs/linux-2.6/xfs_trace.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/linux-2.6/xfs_super.c b/fs/xfs/linux-2.6/xfs_super.c
index 157aaed..3e5052c 100644
--- a/fs/xfs/linux-2.6/xfs_super.c
+++ b/fs/xfs/linux-2.6/xfs_super.c
@@ -1107,10 +1107,10 @@ xfs_fs_evict_inode(
 {
 	xfs_inode_t		*ip = XFS_I(inode);
 
+	trace_xfs_evict_inode(ip);
+
 	truncate_inode_pages(&inode->i_data, 0);
 	end_writeback(inode);
-	trace_xfs_clear_inode(ip);
-
 	XFS_STATS_INC(vn_rele);
 	XFS_STATS_INC(vn_remove);
 	XFS_STATS_DEC(vn_active);
diff --git a/fs/xfs/linux-2.6/xfs_trace.h b/fs/xfs/linux-2.6/xfs_trace.h
index d506753..76de133 100644
--- a/fs/xfs/linux-2.6/xfs_trace.h
+++ b/fs/xfs/linux-2.6/xfs_trace.h
@@ -576,7 +576,7 @@ DEFINE_INODE_EVENT(xfs_ioctl_setattr);
 DEFINE_INODE_EVENT(xfs_file_fsync);
 DEFINE_INODE_EVENT(xfs_destroy_inode);
 DEFINE_INODE_EVENT(xfs_write_inode);
-DEFINE_INODE_EVENT(xfs_clear_inode);
+DEFINE_INODE_EVENT(xfs_evict_inode);
 
 DEFINE_INODE_EVENT(xfs_dquot_dqalloc);
 DEFINE_INODE_EVENT(xfs_dquot_dqdetach);
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
