From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 23 Nov 2008 21:29:29 -0800 (PST)
Message-ID: <20081123.212929.13595907.davem@davemloft.net>
References: <20081123.210452.160784844.davem@davemloft.net>
	<20081124162044.f3333fcf.sfr@canb.auug.org.au>
	<20081123.212339.131214270.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57750
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750704AbYKXF3a (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:29:30 -0500
In-Reply-To: <20081123.212339.131214270.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com, sam@ravnborg.org

From: David Miller <davem@davemloft.net>
Date: Sun, 23 Nov 2008 21:23:39 -0800 (PST)

> I'll try to get it turned back on,

Ok the following seems to build on sparc64, so after some
sparc 32-bit build tests I'll check this into sparc-next-2.6

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 41c4cd2..10945c3 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -435,24 +435,6 @@ config MCA
 	help
 	  MCA is not supported.
 
-config PCMCIA
-	tristate
-	---help---
-	  Say Y here if you want to attach PCMCIA- or PC-cards to your Linux
-	  computer.  These are credit-card size devices such as network cards,
-	  modems or hard drives often used with laptops computers.  There are
-	  actually two varieties of these cards: the older 16 bit PCMCIA cards
-	  and the newer 32 bit CardBus cards.  If you want to use CardBus
-	  cards, you need to say Y here and also to "CardBus support" below.
-
-	  To use your PC-cards, you will need supporting software from David
-	  Hinds' pcmcia-cs package (see the file <file:Documentation/Changes>
-	  for location).  Please also read the PCMCIA-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>.
-
-	  To compile this driver as modules, choose M here: the
-	  modules will be called pcmcia_core and ds.
-
 config SBUS
 	bool
 	default y
@@ -497,6 +479,8 @@ config PCI_SYSCALL
 
 source "drivers/pci/Kconfig"
 
+source "drivers/pcmcia/Kconfig"
+
 config SUN_OPENPROMFS
 	tristate "Openprom tree appears in /proc/openprom"
 	help
