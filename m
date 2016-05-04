From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arc tree
Date: Wed, 4 May 2016 13:02:36 +1000
Message-ID: <20160504130236.12482401@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52575 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751372AbcEDDCi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 May 2016 23:02:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Noam Camus <noamc@ezchip.com>, Marc Zyngier <marc.zyngier@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/irqchip/Kconfig

between commit:

  df1a714d52c4 ("irqchip: add nps Internal and external irqchips")

from the arc tree and commit:

  9e2c986cb460 ("irqchip: Add per-cpu interrupt partitioning library")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/Kconfig
index 1ab632a94db3,6c17de7997b9..000000000000
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@@ -245,8 -246,5 +246,11 @@@ config MVEBU_ODM
  	bool
  	select GENERIC_MSI_IRQ_DOMAIN
  
 +config EZNPS_GIC
 +	bool "NPS400 Global Interrupt Manager (GIM)"
 +	select IRQ_DOMAIN
 +	help
 +	  Support the EZchip NPS400 global interrupt controller
++
+ config PARTITION_PERCPU
+ 	bool
