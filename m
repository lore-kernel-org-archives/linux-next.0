From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Wed, 18 May 2016 16:25:39 +0200
Message-ID: <3539720.FHqN9VOtTL@wuerfel>
References: <20160517102355.4be4af45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:59810 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932243AbcEROZv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2016 10:25:51 -0400
In-Reply-To: <20160517102355.4be4af45@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>

On Tuesday 17 May 2016 10:23:55 Stephen Rothwell wrote:
> ++static ssize_t ext4_direct_IO_read(struct kiocb *iocb, struct iov_iter *iter)
>  +{
>  +      int unlocked = 0;
>  +      struct inode *inode = iocb->ki_filp->f_mapping->host;
> ++      loff_t offset = iocb->ki_pos;
>  +      ssize_t ret;
>  +
>  +      if (ext4_should_dioread_nolock(inode)) {
>  +              /*
>  +               * Nolock dioread optimization may be dynamically disabled
>  +               * via ext4_inode_block_unlocked_dio(). Check inode's state
>  +               * while holding extra i_dio_count ref.
>  +               */
>  +              inode_dio_begin(inode);
>  +              smp_mb();
>  +              if (unlikely(ext4_test_inode_state(inode,
>  +                                                  EXT4_STATE_DIOREAD_LOCK)))
>  +                      inode_dio_end(inode);
>  +              else
>  +                      unlocked = 1;
>  +      }
>  +      if (IS_DAX(inode)) {
> -               ret = dax_do_io(iocb, inode, iter, offset, ext4_dio_get_block,
> ++              ret = dax_do_io(iocb, inode, iter, ext4_dio_get_block,
>  +                              NULL, unlocked ? 0 : DIO_LOCKING);
>  +      } else {
>  +              ret = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
> -                                          iter, offset, ext4_dio_get_block,
> ++                                         iter, ext4_dio_get_block,
>  +                                         NULL, NULL,
>  +                                         unlocked ? 0 : DIO_LOCKING);
>  +      }
>  +      if (unlocked)
>  +              inode_dio_end(inode);
>         return ret;
>   }
> 

I'm getting a warning here because the 'offset' variable is no longer
used, I've fixed it up on my test box like this:

commit 21fffc41b151a6146981487a3fee974e33c7005e
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue May 17 13:23:39 2016 +0200

    ext4: fix linux-next mismerge
    
    fs/ext4/inode.c: In function 'ext4_direct_IO_read':
    fs/ext4/inode.c:3502:9: error: unused variable 'offset' [-Werror=unused-variable]
      loff_t offset = iocb->ki_pos;
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index cd72f208c405..f7140ca66e3b 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3499,7 +3499,6 @@ static ssize_t ext4_direct_IO_read(struct kiocb *iocb, struct iov_iter *iter)
 {
 	int unlocked = 0;
 	struct inode *inode = iocb->ki_filp->f_mapping->host;
-	loff_t offset = iocb->ki_pos;
 	ssize_t ret;
 
 	if (ext4_should_dioread_nolock(inode)) {
