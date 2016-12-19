From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-bva tree with Linus' tree
Date: Mon, 19 Dec 2016 12:28:50 +1100
Message-ID: <20161219122850.246a698e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752502AbcLSB2y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Dec 2016 20:28:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

Hi Bart,

Today's linux-next merge of the target-bva tree got a conflict in:

  drivers/target/target_core_configfs.c

between commit:

  450630975da9 ("don't open-code file_inode()")

from Linus' tree and commit:

  8cc3bb0789ea ("target: Use NULL instead of 0 to represent a pointer")

from the target-bva tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/target/target_core_configfs.c
index a35a347ec357,3bf6384c0f96..000000000000
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@@ -143,8 -143,8 +143,8 @@@ static ssize_t target_core_item_dbroot_
  		pr_err("db_root: cannot open: %s\n", db_root_stage);
  		return -EINVAL;
  	}
 -	if (!S_ISDIR(fp->f_inode->i_mode)) {
 +	if (!S_ISDIR(file_inode(fp)->i_mode)) {
- 		filp_close(fp, 0);
+ 		filp_close(fp, NULL);
  		mutex_unlock(&g_tf_lock);
  		pr_err("db_root: not a directory: %s\n", db_root_stage);
  		return -EINVAL;
