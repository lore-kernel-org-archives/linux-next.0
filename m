From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the alacrity tree with Linus' tree
Date: Fri, 25 Mar 2011 15:06:34 +1100
Message-ID: <20110325150634.aa405d4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51795 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750732Ab1CYEGj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Mar 2011 00:06:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory Haskins <gregory.haskins@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Gregory,

Today's linux-next merge of the alacrity tree got a conflict in
arch/x86/Kconfig between commit 388b78adc989 ("rapidio: modify
configuration to support PCI-SRIO controller") from Linus' tree and
commit 18dc365707fd ("vbus: add a "vbus-proxy" bus model for vbus_driver
objects") from the alacrity tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/Kconfig
index cc6c53a,035edb7..0000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -2097,16 -2067,8 +2097,18 @@@ source "drivers/pcmcia/Kconfig
  
  source "drivers/pci/hotplug/Kconfig"
  
 +config RAPIDIO
 +	bool "RapidIO support"
 +	depends on PCI
 +	default n
 +	help
 +	  If you say Y here, the kernel will include drivers and
 +	  infrastructure code to support RapidIO interconnect devices.
 +
 +source "drivers/rapidio/Kconfig"
 +
+ source "drivers/vbus/Kconfig"
+ 
  endmenu
  
  
