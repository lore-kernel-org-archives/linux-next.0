From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the arm tree
Date: Thu, 25 Aug 2011 13:30:14 +1000
Message-ID: <20110825133014.4ca16d7b383f7582c7a52d46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49391 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750835Ab1HYDaW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Aug 2011 23:30:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Medhurst <tixy@yxit.co.uk>, Russell King <rmk@arm.linux.org.uk>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in
arch/arm/mach-shmobile/board-ap4evb.c between commit 9b742024026c ("ARM:
mach-shmobile: Setup consistent dma size at boot time") from the arm tree
and commit 2f82df20d71c ("PM: Move clock-related definitions and headers
to separate file") from the pm tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-shmobile/board-ap4evb.c
index ec8f9d9,4a21a50..0000000
--- a/arch/arm/mach-shmobile/board-ap4evb.c
+++ b/arch/arm/mach-shmobile/board-ap4evb.c
@@@ -42,7 -42,7 +42,8 @@@
  #include <linux/leds.h>
  #include <linux/input/sh_keysc.h>
  #include <linux/usb/r8a66597.h>
 +#include <linux/dma-mapping.h>
+ #include <linux/pm_clock.h>
  
  #include <media/sh_mobile_ceu.h>
  #include <media/sh_mobile_csi2.h>
