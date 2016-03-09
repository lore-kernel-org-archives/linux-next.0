From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xfs tree with the ext4 tree
Date: Thu, 10 Mar 2016 10:41:00 +1100
Message-ID: <20160310104100.6f906679@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the xfs tree got a conflict in:

  fs/ext4/ext4.h

between commit:

  109811c20fb8 ("ext4: simplify io_end handling for AIO DIO")

from the ext4 tree and commit:

  74c66bcb7eda ("ext4: Fix data exposure after failed AIO DIO")

from the xfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc fs/ext4/ext4.h
index 70b8e0409566,56c12df107ab..000000000000
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@@ -1499,15 -1504,16 +1499,6 @@@ static inline int ext4_valid_inum(struc
  		 ino <= le32_to_cpu(EXT4_SB(sb)->s_es->s_inodes_count));
  }
  
- static inline void ext4_set_io_unwritten_flag(struct inode *inode,
- 					      struct ext4_io_end *io_end)
 -static inline ext4_io_end_t *ext4_inode_aio(struct inode *inode)
--{
- 	if (!(io_end->flag & EXT4_IO_END_UNWRITTEN)) {
- 		io_end->flag |= EXT4_IO_END_UNWRITTEN;
- 		atomic_inc(&EXT4_I(inode)->i_unwritten);
- 	}
 -	return inode->i_private;
 -}
 -
 -static inline void ext4_inode_aio_set(struct inode *inode, ext4_io_end_t *io)
 -{
 -	inode->i_private = io;
--}
--
  /*
   * Inode dynamic state flags
   */

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
