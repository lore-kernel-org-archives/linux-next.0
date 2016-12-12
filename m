From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Mon, 12 Dec 2016 15:21:51 +1100
Message-ID: <20161212152151.5b8d59cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751677AbcLLEVy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Dec 2016 23:21:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Yong <fan.yong@intel.com>, Li Xi <lixi@ddn.com>, James Simmons <jsimmons@infradead.org>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lustre/llite/statahead.c

between commit:

  7126bc2e8d60 ("lustre: switch to use of ->d_init()")

from the vfs tree and commit:

  3c8fb1b105cd ("staging: lustre: statahead: set sai_index_wait with lli_sa_lock held")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/lustre/lustre/llite/statahead.c
index 166323fddc44,4769a2230ae1..000000000000
--- a/drivers/staging/lustre/lustre/llite/statahead.c
+++ b/drivers/staging/lustre/lustre/llite/statahead.c
@@@ -1512,8 -1519,9 +1519,7 @@@ out_unplug
  	 * dentry_may_statahead().
  	 */
  	ldd = ll_d2d(*dentryp);
- 	lli = ll_i2info(dir);
 -	/* ldd can be NULL if llite lookup failed. */
 -	if (ldd)
 -		ldd->lld_sa_generation = lli->lli_sa_generation;
 +	ldd->lld_sa_generation = lli->lli_sa_generation;
  	sa_put(sai, entry);
  	return rc;
  }
