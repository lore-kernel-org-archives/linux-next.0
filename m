From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the overlayfs tree with the ext4 tree
Date: Thu, 24 Mar 2016 10:51:52 +1100
Message-ID: <20160324105152.56d66cca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47780 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751477AbcCWXv4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Mar 2016 19:51:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miklos,

Today's linux-next merge of the overlayfs tree got a conflict in:

  include/linux/fs.h
  fs/overlayfs/super.c
  include/linux/dcache.h

between commit:

  a7f7fb45f728 ("vfs: add file_dentry()")

from the ext4 tree and commit:

  83c2715a73fc ("fs: add file_dentry()")

from the overlayfs tree.

This looks like 2 incompatible versions of the same patch committed to
2 different trees :-(  Guys you can't work like this.

Either the patch set was not ready and Ted should not have applied it,
or the new version should not have been added to the overlayfs tree
(especially now, during the merge window).  If it was meant to be applied
to more than one tree, it should have been put in a non-rebaing separate
branch that could be merged by each tree.

I fixed it up (I dropped the overlayfs tree for today) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
