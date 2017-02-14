From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the fscrypt tree
Date: Wed, 15 Feb 2017 09:51:04 +1100
Message-ID: <20170215095104.26b14290@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750731AbdBNWvI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Feb 2017 17:51:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, Bhumika Goyal <bhumirks@gmail.com>

Hi Jaegeuk,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/super.c

between commit:

  a5d431eff2e0 ("fscrypt: make fscrypt_operations.key_prefix a string")

from the fscrypt tree and commit:

  aacf533a90a7 ("f2fs: super: constify fscrypt_operations structure")

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

diff --cc fs/f2fs/super.c
index 503c3b7fa053,8a02d747fa97..000000000000
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@@ -1170,9 -1207,9 +1201,9 @@@ static unsigned f2fs_max_namelen(struc
  			inode->i_sb->s_blocksize : F2FS_NAME_LEN;
  }
  
- static struct fscrypt_operations f2fs_cryptops = {
+ static const struct fscrypt_operations f2fs_cryptops = {
 +	.key_prefix	= "f2fs:",
  	.get_context	= f2fs_get_context,
 -	.key_prefix	= f2fs_key_prefix,
  	.set_context	= f2fs_set_context,
  	.is_encrypted	= f2fs_encrypted_inode,
  	.empty_dir	= f2fs_empty_dir,
