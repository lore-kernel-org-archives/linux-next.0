From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the ext4 tree
Date: Mon, 9 May 2016 09:36:46 +1000
Message-ID: <20160509093646.68d7cf57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daeho Jeong <daeho.jeong@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Jaegeuk,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/ext4/ext4.h

between commit:

  c8585c6fcaf2 ("ext4: fix races between changing inode journal mode and ext4_writepages")

from the ext4 tree and commit:

  a618a2a1dda4 ("ext4 crypto: migrate into vfs's crypto engine")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

P.S. I would expect to see a Reviewed-by or Acked-by from the ext4
maintainer on that f2fs tree commit ...

-- 
Cheers,
Stephen Rothwell

diff --cc fs/ext4/ext4.h
index ba5aecc07fbc,91b62e54ef51..000000000000
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@@ -32,8 -32,8 +32,9 @@@
  #include <linux/percpu_counter.h>
  #include <linux/ratelimit.h>
  #include <crypto/hash.h>
+ #include <linux/fscrypto.h>
  #include <linux/falloc.h>
 +#include <linux/percpu-rwsem.h>
  #ifdef __KERNEL__
  #include <linux/compat.h>
  #endif
@@@ -1509,9 -1498,10 +1502,13 @@@ struct ext4_sb_info 
  	struct ratelimit_state s_err_ratelimit_state;
  	struct ratelimit_state s_warning_ratelimit_state;
  	struct ratelimit_state s_msg_ratelimit_state;
 +
 +	/* Barrier between changing inodes' journal flags and writepages ops. */
 +	struct percpu_rw_semaphore s_journal_flag_rwsem;
+ #ifdef CONFIG_EXT4_FS_ENCRYPTION
+ 	u8 key_prefix[EXT4_KEY_DESC_PREFIX_SIZE];
+ 	u8 key_prefix_size;
+ #endif
  };
  
  static inline struct ext4_sb_info *EXT4_SB(struct super_block *sb)
