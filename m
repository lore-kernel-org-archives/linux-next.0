From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ext4 tree with Linus' tree
Date: Mon, 21 Mar 2016 11:29:28 +1100
Message-ID: <20160321112928.1be53991@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38720 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751348AbcCUA3c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Mar 2016 20:29:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konstantin Khlebnikov <koct9i@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>

Hi Theodore,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/overlayfs/super.c

between commit:

  b5891cfab08f ("ovl: fix working on distributed fs as lower layer")

from Linus' tree and commit:

  a7f7fb45f728 ("vfs: add file_dentry()")

from the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/overlayfs/super.c
index 619ad4b016d2,10dbdc7da69d..000000000000
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@@ -343,7 -356,7 +358,8 @@@ static const struct dentry_operations o
  
  static const struct dentry_operations ovl_reval_dentry_operations = {
  	.d_release = ovl_dentry_release,
 +	.d_select_inode = ovl_d_select_inode,
+ 	.d_native_dentry = ovl_d_native_dentry,
  	.d_revalidate = ovl_dentry_revalidate,
  	.d_weak_revalidate = ovl_dentry_weak_revalidate,
  };
