From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound build failure
Date: Wed, 21 May 2008 13:20:58 +1000
Message-ID: <20080521132058.4b8ff51c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47205 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753904AbYEUDVH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 23:21:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org

Hi Takashi,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

sound/aoa/Kconfig:3: invalid option
make[2]: *** [ppc64_defconfig] Error 1

Caused by commit 6a5751b42420dce9267d7d915eed8f8673d16fdd ("sound:
Convert to menuconfig") from the sound tree.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 206a3c1db3cf96b8cebf3a873f26044ff436723c Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 21 May 2008 13:13:15 +1000
Subject: [PATCH] sound: "depends" requires "on"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/aoa/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/aoa/Kconfig b/sound/aoa/Kconfig
index eeae9e3..c081e18 100644
--- a/sound/aoa/Kconfig
+++ b/sound/aoa/Kconfig
@@ -1,6 +1,6 @@
 menuconfig SND_AOA
 	tristate "Apple Onboard Audio driver"
-	depends PPC_PMAC
+	depends on PPC_PMAC
 	select SND_PCM
 	---help---
 	This option enables the new driver for the various
-- 
1.5.5.1

