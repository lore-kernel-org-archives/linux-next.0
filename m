From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the integrity tree with the iversion
 tree
Date: Tue, 2 Jan 2018 13:41:16 +1100
Message-ID: <20180102134116.0187e064@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37653 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752707AbeABClS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jan 2018 21:41:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Jeff Layton <jlayton@kernel.org>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  security/integrity/ima/ima_main.c

between commits:

  ac0bf025d2c0 ("ima: Use i_version only when filesystem supports it")
  57fe39d33423 ("IMA: switch IMA over to new i_version API")

from the iversion tree and commit:

  0d73a55208e9 ("ima: re-introduce own integrity cache lock")
  a2a2c3c8580a ("ima: Use i_version only when filesystem supports it")

from the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc security/integrity/ima/ima_main.c
index 06a70c5a2329,6d78cb26784d..000000000000
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@@ -126,10 -129,12 +130,12 @@@ static void ima_check_last_writer(struc
  	if (!(mode & FMODE_WRITE))
  		return;
  
- 	inode_lock(inode);
+ 	mutex_lock(&iint->mutex);
  	if (atomic_read(&inode->i_writecount) == 1) {
+ 		update = test_and_clear_bit(IMA_UPDATE_XATTR,
+ 					    &iint->atomic_flags);
  		if (!IS_I_VERSION(inode) ||
 -		    (iint->version != inode->i_version) ||
 +		    inode_cmp_iversion(inode, iint->version) ||
  		    (iint->flags & IMA_NEW_FILE)) {
  			iint->flags &= ~(IMA_DONE_MASK | IMA_NEW_FILE);
  			iint->measured_pcrs = 0;
