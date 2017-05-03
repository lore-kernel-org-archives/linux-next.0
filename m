From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the fscrypt tree
Date: Thu, 4 May 2017 09:40:40 +1000
Message-ID: <20170504094040.56b36c73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751233AbdECXkm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 19:40:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomohiro Kusumi <tkusumi@tuxera.com>

Hi Jaegeuk,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/inline.c

between commit:

  5fc36386d220 ("f2fs: check entire encrypted bigname when finding a dentry")

from the fscrypt tree and commit:

  64c24ecb3cff ("f2fs: split make_dentry_ptr() into block and inline versions")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/inline.c
index fa729ff6b2f9,0ccdefe9fdba..000000000000
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@@ -533,8 -533,8 +533,8 @@@ int f2fs_add_inline_entry(struct inode 
  
  	f2fs_wait_on_page_writeback(ipage, NODE, true);
  
 -	name_hash = f2fs_dentry_hash(new_name);
 +	name_hash = f2fs_dentry_hash(new_name, NULL);
- 	make_dentry_ptr(NULL, &d, (void *)dentry_blk, 2);
+ 	make_dentry_ptr_inline(NULL, &d, dentry_blk);
  	f2fs_update_dentry(ino, mode, &d, new_name, name_hash, bit_pos);
  
  	set_page_dirty(ipage);
