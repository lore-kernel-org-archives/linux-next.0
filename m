From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Mon, 2 Feb 2009 14:13:28 +1100
Message-ID: <20090202141328.eaad3432.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55964 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753614AbZBBDNe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 22:13:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Matt Waddel <Matt.Waddel@freescale.com>, Greg Ungerer <gerg@uclinux.org>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/Kconfig between commit
d4732d3c59b84bb093e11c8f755f32801b4bf86d ("m68knommu: add ColdFire M532x
to the FEC configuration options") from Linus' tree and commit
196719ecec0c526de273dcb902f0be956a193232 ("fec: Add support for Freescale
MX27") from the net tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/Kconfig
index 6bdfd47,0ec01e4..0000000
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@@ -1828,11 -1828,11 +1828,11 @@@ config 68360_ENE
  	  the Motorola 68360 processor.
  
  config FEC
- 	bool "FEC ethernet controller (of ColdFire CPUs)"
- 	depends on M523x || M527x || M5272 || M528x || M520x || M532x
+ 	bool "FEC ethernet controller (of ColdFire and some i.MX CPUs)"
 -	depends on M523x || M527x || M5272 || M528x || M520x || MACH_MX27
++	depends on M523x || M527x || M5272 || M528x || M520x || M532x || MACH_MX27
  	help
  	  Say Y here if you want to use the built-in 10/100 Fast ethernet
- 	  controller on some Motorola ColdFire processors.
+ 	  controller on some Motorola ColdFire and Freescale i.MX processors.
  
  config FEC2
  	bool "Second FEC ethernet controller (on some ColdFire CPUs)"
