From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the usb tree
Date: Mon, 1 May 2017 14:09:49 +1000
Message-ID: <20170501140949.2c07b08d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750811AbdEAEJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 00:09:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, Gilad Ben-Yossef <gilad@benyossef.com>, Michael Zoran <mzoran@crowfest.net>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/Makefile

between commit:

  f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")

from the usb tree and commit:

  051420a997a5 ("staging: bcm2835-audio: Move driver under vc04_services")
  abefd6741d54 ("staging: ccree: introduce CryptoCell HW driver")

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

diff --cc drivers/staging/Makefile
index 682127c20da5,422fae4ea0f3..000000000000
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@@ -41,4 -42,5 +43,4 @@@ obj-$(CONFIG_MOST)		+= most
  obj-$(CONFIG_KS7010)		+= ks7010/
  obj-$(CONFIG_GREYBUS)		+= greybus/
  obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
- obj-$(CONFIG_SND_BCM2835)	+= bcm2835-audio/
+ obj-$(CONFIG_CRYPTO_DEV_CCREE)	+= ccree/
 -
