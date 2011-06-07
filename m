From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the slave-dma tree
Date: Tue, 7 Jun 2011 12:57:23 +1000
Message-ID: <20110607125723.8e591e42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41318 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753541Ab1FGC5b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jun 2011 22:57:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, H Hartley Sweeten <hartleys@visionengravers.com>, Mika Westerberg <mika.westerberg@iki.fi>, Vinod Koul <vinod.koul@intel.com>

Hi Grant,

Today's linux-next merge of the gpio tree got a conflict in
arch/arm/mach-ep93xx/Makefile between commit 8e4a93008db7 ("ep93xx:
remove the old M2P DMA code") from the slave-dma tree and commit
c6b52c13de44 ("gpio/ep93xx: move driver to drivers/gpio") from the gpio
tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-ep93xx/Makefile
index 21e721a,6b7c41d..0000000
--- a/arch/arm/mach-ep93xx/Makefile
+++ b/arch/arm/mach-ep93xx/Makefile
@@@ -1,7 -1,7 +1,7 @@@
  #
  # Makefile for the linux kernel.
  #
- obj-y			:= core.o clock.o gpio.o
 -obj-y			:= core.o clock.o dma-m2p.o
++obj-y			:= core.o clock.o
  obj-m			:=
  obj-n			:=
  obj-			:=
