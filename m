From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Mon, 4 Dec 2017 13:06:49 +1100
Message-ID: <20171204130649.65e1c2c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751385AbdLDCGw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 21:06:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian Gromm <christian.gromm@microchip.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/most/video/video.c

between commit:

  afc9a42b7464 ("the rest of drivers/*: annotate ->poll() instances")

from the vfs tree and commit:

  1b10a0316e2d ("staging: most: video: remove aim designators")

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

diff --cc drivers/staging/most/video/video.c
index 7783bc2dd9f5,098873851646..000000000000
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@@ -209,11 -203,11 +203,11 @@@ static ssize_t comp_vdev_read(struct fi
  	return ret;
  }
  
- static __poll_t aim_vdev_poll(struct file *filp, poll_table *wait)
 -static unsigned int comp_vdev_poll(struct file *filp, poll_table *wait)
++static __poll_t comp_vdev_poll(struct file *filp, poll_table *wait)
  {
- 	struct aim_fh *fh = filp->private_data;
+ 	struct comp_fh *fh = filp->private_data;
  	struct most_video_dev *mdev = fh->mdev;
 -	unsigned int mask = 0;
 +	__poll_t mask = 0;
  
  	/* only wait if no data is available */
  	if (!data_ready(mdev))
