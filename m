From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Tue, 5 Apr 2016 13:03:26 +1000
Message-ID: <20160405130326.03c74125@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49089 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751264AbcDEDDa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Apr 2016 23:03:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Irina Tirdea <irina.tirdea@intel.com>, Jonathan Cameron <jic23@kernel.org>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/iio/gyro/bmg160_core.c

between commit:

  b475c59b113d ("iio: gyro: bmg160: fix buffer read values")

from the staging.current tree and commit:

  7e3d1eb123d8 ("iio: accel: bmg160: optimize transfers in trigger handler")

from the staging tree.

I fixed it up (I used the version from the staging tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
