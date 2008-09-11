From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pxa tree
Date: Fri, 12 Sep 2008 08:35:15 +1000
Message-ID: <20080912083515.19517514.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44789 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752478AbYIKWfX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Sep 2008 18:35:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org

Hi Eric,

Today's linux-next merge of the pxa tree got a conflict in
arch/arm/mach-pxa/corgi.c arch/arm/mach-pxa/spitz.c between commit
fced80c735941fa518ac67c0b61bbe153fb8c050 ("[ARM] Convert asm/io.h to
linux/io.h") from the arm tree and commits
c22e92f200a2b5ab8b3571747865afe3dcc7b6b3 ("[ARM] pxa/corgi: use SPI-based
driver for ads7846, corgi-lcd and max1111"),
db710817e3432af4d30896cdc41f144e4da7c7e2 ("[ARM] pxa/akita: use pca953x
instead of akita-ioexp") and 43d5f82350734562e22b9ad9de3ad0aaec6aaffe
("[ARM] pxa/spitz: use SPI-based driver for ads7846, corgi-lcd and
max1111") from the pxa tree.

Just overlapping additions of includes.  I fixed it up (see below) and
can carry the fixup.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/mach-pxa/corgi.c
index 4cbf08b,201b49a..0000000
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@@ -20,8 -20,11 +20,12 @@@
  #include <linux/interrupt.h>
  #include <linux/mmc/host.h>
  #include <linux/pm.h>
+ #include <linux/gpio.h>
  #include <linux/backlight.h>
 +#include <linux/io.h>
+ #include <linux/spi/spi.h>
+ #include <linux/spi/ads7846.h>
+ #include <linux/spi/corgi_lcd.h>
  #include <video/w100fb.h>
  
  #include <asm/setup.h>
diff --cc arch/arm/mach-pxa/spitz.c
index 7e181afc,08efb44..0000000
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@@ -22,7 -24,11 +24,12 @@@
  #include <linux/mmc/host.h>
  #include <linux/pm.h>
  #include <linux/backlight.h>
 +#include <linux/io.h>
+ #include <linux/i2c.h>
+ #include <linux/i2c/pca953x.h>
+ #include <linux/spi/spi.h>
+ #include <linux/spi/ads7846.h>
+ #include <linux/spi/corgi_lcd.h>
  
  #include <asm/setup.h>
  #include <asm/memory.h>
