From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the moduleh tree with the staging tree
Date: Wed, 24 Aug 2011 15:00:49 +1000
Message-ID: <20110824150049.c7668a56930ab2fe2809dd88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58308 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750921Ab1HXFAz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Aug 2011 01:00:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>, Greg KH <greg@kroah.com>

Hi Paul,

Today's linux-next merge of the moduleh tree got a conflict in
drivers/staging/iio/accel/adis16220_core.c between commit 7991029a55fa
("staging:iio:accel:adis16220 iio_chan_spec conversion") from the staging
tree and commit dcf6be043de1 ("staging: Add module.h to drivers/staging
users") from the moduleh tree.

Just context changes.  I have fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/iio/accel/adis16220_core.c
index 075e40f,e119874..0000000
--- a/drivers/staging/iio/accel/adis16220_core.c
+++ b/drivers/staging/iio/accel/adis16220_core.c
@@@ -13,6 -16,8 +13,7 @@@
  #include <linux/spi/spi.h>
  #include <linux/slab.h>
  #include <linux/sysfs.h>
 -#include <linux/list.h>
+ #include <linux/module.h>
  
  #include "../iio.h"
  #include "../sysfs.h"
