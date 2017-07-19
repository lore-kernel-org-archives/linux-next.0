From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 19 Jul 2017 13:07:28 +1000
Message-ID: <20170719130728.3adcae81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Marcus Wolf <linux@Wolf-Entwicklungen.de>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/Kconfig
  drivers/staging/Makefile

between commit:

  dd55d44f4084 ("staging: vboxvideo: Add vboxvideo to drivers/staging")

from the staging.current tree and commit:

  874bcba65f9a ("staging: pi433: New driver")

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

diff --cc drivers/staging/Kconfig
index ef28a1cb64ae,fdf060c4c494..000000000000
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@@ -110,6 -110,6 +110,8 @@@ source "drivers/staging/ccree/Kconfig
  
  source "drivers/staging/typec/Kconfig"
  
 +source "drivers/staging/vboxvideo/Kconfig"
 +
+ source "drivers/staging/pi433/Kconfig"
+ 
  endif # STAGING
diff --cc drivers/staging/Makefile
index 2918580bdb9e,998f6441e3aa..000000000000
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@@ -44,4 -44,4 +44,5 @@@ obj-$(CONFIG_KS7010)		+= ks7010
  obj-$(CONFIG_GREYBUS)		+= greybus/
  obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
  obj-$(CONFIG_CRYPTO_DEV_CCREE)	+= ccree/
 +obj-$(CONFIG_DRM_VBOXVIDEO)	+= vboxvideo/
+ obj-$(CONFIG_PI433)		+= pi433/
