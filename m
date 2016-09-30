From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the v4l-dvb tree
Date: Fri, 30 Sep 2016 13:33:19 +1000
Message-ID: <20160930133319.57ac11a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53287 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751171AbcI3DdW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Sep 2016 23:33:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Songjun Wu <songjun.wu@microchip.com>, Nicolas Ferre <nicolas.ferre@atmel.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  MAINTAINERS

between commit:

  71fb2c74287d ("[media] MAINTAINERS: atmel-isc: add entry for Atmel ISC")

from the v4l-dvb tree and commit:

  5615c3715749 ("MAINTAINERS: update entry for atmel_serial driver")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 8c86c07409c8,4e2ae17c478e..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -7848,14 -7745,12 +7843,20 @@@ T:	git git://git.monstr.eu/linux-2.6-mi
  S:	Supported
  F:	arch/microblaze/
  
+ MICROCHIP / ATMEL AT91 / AT32 SERIAL DRIVER
+ M:	Richard Genoud <richard.genoud@gmail.com>
+ S:	Maintained
+ F:	drivers/tty/serial/atmel_serial.c
+ F:	include/linux/atmel_serial.h
+ 
 +MICROCHIP / ATMEL ISC DRIVER
 +M:	Songjun Wu <songjun.wu@microchip.com>
 +L:	linux-media@vger.kernel.org
 +S:	Supported
 +F:	drivers/media/platform/atmel/atmel-isc.c
 +F:	drivers/media/platform/atmel/atmel-isc-regs.h
 +F:	devicetree/bindings/media/atmel-isc.txt
 +
  MICROSOFT SURFACE PRO 3 BUTTON DRIVER
  M:	Chen Yu <yu.c.chen@intel.com>
  L:	platform-driver-x86@vger.kernel.org
