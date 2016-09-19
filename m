From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the ext4 tree
Date: Mon, 19 Sep 2016 11:26:37 +1000
Message-ID: <20160919112637.31d5eadd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47910 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932543AbcISB0k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Sep 2016 21:26:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, Chao Yu <yuchao0@huawei.com>

Hi Jaegeuk,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/dir.c

between commit:

  59aa5a3aeead ("fscrypto: make filename crypto functions return 0 on success")

from the ext4 tree and commit:

  e06f86e61d7a ("f2fs crypto: avoid unneeded memory allocation in ->readdir")

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

diff --cc fs/f2fs/dir.c
index 8716943335b1,2fb20fc58346..000000000000
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@@ -786,19 -813,12 +813,10 @@@ bool f2fs_fill_dentries(struct dir_cont
  
  		if (f2fs_encrypted_inode(d->inode)) {
  			int save_len = fstr->len;
- 			int err;
 -			int ret;
  
- 			de_name.name = f2fs_kmalloc(de_name.len, GFP_NOFS);
- 			if (!de_name.name)
- 				return false;
- 
- 			memcpy(de_name.name, d->filename[bit_pos], de_name.len);
- 
- 			err = fscrypt_fname_disk_to_usr(d->inode,
 -			ret = fscrypt_fname_disk_to_usr(d->inode,
++			if (fscrypt_fname_disk_to_usr(d->inode,
  						(u32)de->hash_code, 0,
--						&de_name, fstr);
- 			kfree(de_name.name);
- 			if (err)
 -			if (ret < 0)
++						&de_name, fstr))
  				return true;
  
  			de_name = *fstr;
