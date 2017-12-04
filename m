From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Mon, 4 Dec 2017 12:58:11 +1100
Message-ID: <20171204125811.787cba01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53273 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751465AbdLDB6N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 20:58:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian Gromm <christian.gromm@microchip.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/most/cdev/cdev.c

between commit:

  afc9a42b7464 ("the rest of drivers/*: annotate ->poll() instances")

from the vfs tree and commit:

  1fd923f38610 ("staging: most: cdev: replace function prefix")

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

diff --cc drivers/staging/most/cdev/cdev.c
index 69f530972273,dd9456fd2cd6..000000000000
--- a/drivers/staging/most/cdev/cdev.c
+++ b/drivers/staging/most/cdev/cdev.c
@@@ -287,10 -283,10 +283,10 @@@ comp_read(struct file *filp, char __use
  	return copied;
  }
  
- static __poll_t aim_poll(struct file *filp, poll_table *wait)
 -static unsigned int comp_poll(struct file *filp, poll_table *wait)
++static __poll_t comp_poll(struct file *filp, poll_table *wait)
  {
- 	struct aim_channel *c = filp->private_data;
+ 	struct comp_channel *c = filp->private_data;
 -	unsigned int mask = 0;
 +	__poll_t mask = 0;
  
  	poll_wait(filp, &c->wq, wait);
  
