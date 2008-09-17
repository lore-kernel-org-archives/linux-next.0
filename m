From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pxa tree
Date: Thu, 18 Sep 2008 06:31:09 +1000
Message-ID: <20080918063109.5aee733d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35090 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbYIQUbR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 16:31:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Eric,

Today's linux-next merge of the pxa tree got a conflict in
arch/arm/mach-pxa/spitz.c between commit
fced80c735941fa518ac67c0b61bbe153fb8c050 ("[ARM] Convert asm/io.h to
linux/io.h") from the arm tree and commit
546ed5880bf813e1386696c02d288d7ffba517d6 ("[ARM] pxa/spitz: use SPI-based
driver for ads7846, corgi-lcd and max1111") from the pxa tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/mach-pxa/spitz.c
index 7e181afc,8b06b7a..0000000
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@@ -22,7 -23,9 +23,10 @@@
  #include <linux/mmc/host.h>
  #include <linux/pm.h>
  #include <linux/backlight.h>
 +#include <linux/io.h>
+ #include <linux/spi/spi.h>
+ #include <linux/spi/ads7846.h>
+ #include <linux/spi/corgi_lcd.h>
  
  #include <asm/setup.h>
  #include <asm/memory.h>
