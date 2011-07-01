From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (akpm tree
 related)
Date: Fri, 1 Jul 2011 15:45:08 +1000
Message-ID: <20110701154508.92c8b685.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45413 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751762Ab1GAFpM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Jul 2011 01:45:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/video/backlight/ams369fg06.o:(.bss+0x510): multiple definition of `before_power'
drivers/video/backlight/s6e63m0.o:(.bss+0x5e0): first defined here

Caused by commit 45193c8486ef ("Add the ams369fg06 amoled panel driver.
The ams369fg06 amoled panel (480").  The variable should probably be
static in both files.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 1 Jul 2011 15:34:22 +1000
Subject: [PATCH] backlight: make some varibales static

fixes this build error:

drivers/video/backlight/ams369fg06.o:(.bss+0x510): multiple definition of `before_power'
drivers/video/backlight/s6e63m0.o:(.bss+0x5e0): first defined here

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/video/backlight/ams369fg06.c |    2 +-
 drivers/video/backlight/s6e63m0.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/ams369fg06.c b/drivers/video/backlight/ams369fg06.c
index 86a7daf..d1d8237 100644
--- a/drivers/video/backlight/ams369fg06.c
+++ b/drivers/video/backlight/ams369fg06.c
@@ -560,7 +560,7 @@ static int __devexit ams369fg06_remove(struct spi_device *spi)
 }
 
 #if defined(CONFIG_PM)
-unsigned int before_power;
+static unsigned int before_power;
 
 static int ams369fg06_suspend(struct spi_device *spi, pm_message_t mesg)
 {
diff --git a/drivers/video/backlight/s6e63m0.c b/drivers/video/backlight/s6e63m0.c
index 322040f..e1803ba 100644
--- a/drivers/video/backlight/s6e63m0.c
+++ b/drivers/video/backlight/s6e63m0.c
@@ -840,7 +840,7 @@ static int __devexit s6e63m0_remove(struct spi_device *spi)
 }
 
 #if defined(CONFIG_PM)
-unsigned int before_power;
+static unsigned int before_power;
 
 static int s6e63m0_suspend(struct spi_device *spi, pm_message_t mesg)
 {
-- 
1.7.5.4


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
