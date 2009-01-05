From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ext4 tree
Date: Mon, 5 Jan 2009 13:49:06 +1100
Message-ID: <20090105134906.32129cb8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46841 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753468AbZAECtQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 21:49:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Al Viro <viro@zeniv.linux.org.uk>

Hi Ted,

Today's linux-next merge of the ext4 tree got a conflict in
fs/ext4/ialloc.c between commit 6b38e842bb832a3dbeb17e382404aef3c40ac5f9
("nfsd race fixes: ext4") from Linus' tree and commit
3cbc16fb3066dabb66eddf192d9e657a14a7ad20 ("ext4: Allow ext4 to run
without a journal") from the ext4 tree.

Really just context changes. I fixed it up (see below) and can carry the
fix for now.  You should fix this by merging with Linus' tree (or get
Linus to do it).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/ext4/ialloc.c
index 6e60528,3bcf197..0000000
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@@ -825,11 -890,8 +890,11 @@@ got
  
  	ext4_set_inode_flags(inode);
  	if (IS_DIRSYNC(inode))
- 		handle->h_sync = 1;
+ 		ext4_handle_sync(handle);
 -	insert_inode_hash(inode);
 +	if (insert_inode_locked(inode) < 0) {
 +		err = -EINVAL;
 +		goto fail_drop;
 +	}
  	spin_lock(&sbi->s_next_gen_lock);
  	inode->i_generation = sbi->s_next_generation++;
  	spin_unlock(&sbi->s_next_gen_lock);
@@@ -884,9 -948,8 +951,9 @@@ fail_drop
  	DQUOT_DROP(inode);
  	inode->i_flags |= S_NOQUOTA;
  	inode->i_nlink = 0;
 +	unlock_new_inode(inode);
  	iput(inode);
- 	brelse(bitmap_bh);
+ 	brelse(inode_bitmap_bh);
  	return ERR_PTR(err);
  }
  
