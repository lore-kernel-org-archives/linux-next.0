From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the  tree
Date: Wed, 13 May 2009 12:20:29 +1000
Message-ID: <20090513122029.6b7d9714.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33749 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752156AbZEMCUd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 22:20:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Al, Ted,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/super.c between commit 4916bd42cb4e27118d2ab97eb014a2ef84705a56
("ext4: Use separate super_operations structure for no_journal
filesystems") from the ext4 tree and commit
77fe0742eed6c4d18198877fd330a3578b78410d ("->write_super lock_super
pushdown") from the vfs tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.

Ted, there may however be more interactions between the changes in the
vfs tree and some of the changes you have done for ext4 ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/super.c
index dc34ed3,d789833..0000000
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@@ -3303,11 -3268,30 +3306,18 @@@ int ext4_force_commit(struct super_bloc
  	return ret;
  }
  
- static void ext4_write_super(struct super_block *sb)
 -/*
 - * Ext4 always journals updates to the superblock itself, so we don't
 - * have to propagate any other updates to the superblock on disk at this
 - * point.  (We can probably nuke this function altogether, and remove
 - * any mention to sb->s_dirt in all of fs/ext4; eventual cleanup...)
 - */
+ static void ext4_write_super_locked(struct super_block *sb)
  {
 -	if (EXT4_SB(sb)->s_journal) {
 -		if (mutex_trylock(&sb->s_lock) != 0)
 -			BUG();
 -		sb->s_dirt = 0;
 -	} else {
 -		ext4_commit_super(sb, EXT4_SB(sb)->s_es, 1);
 -	}
 +	ext4_commit_super(sb, 1);
  }
  
+ static void ext4_write_super(struct super_block *sb)
+ {
+ 	lock_super(sb);
+ 	ext4_write_super_locked(sb);
+ 	unlock_super(sb);
+ }
+ 
  static int ext4_sync_fs(struct super_block *sb, int wait)
  {
  	int ret = 0;
