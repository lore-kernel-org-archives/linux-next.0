From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the tip tree
Date: Wed, 2 Mar 2016 14:35:06 +1100
Message-ID: <20160302143506.5f75d279@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56834 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752356AbcCBDfI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 22:35:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "J. German Rivera" <German.Rivera@freescale.com>, Qais Yousef <qais.yousef@imgtec.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  include/linux/irqdomain.h

between commit:

  29d5c8db26ad ("genirq: Add DOMAIN_BUS_IPI")

from the tip tree and commit:

  9b1b282ccd81 ("irqdomain: Added domain bus token DOMAIN_BUS_FSL_MC_MSI")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/irqdomain.h
index ed48594e96d2,0934d06c8b00..000000000000
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@@ -74,7 -74,7 +74,8 @@@ enum irq_domain_bus_token 
  	DOMAIN_BUS_PCI_MSI,
  	DOMAIN_BUS_PLATFORM_MSI,
  	DOMAIN_BUS_NEXUS,
 +	DOMAIN_BUS_IPI,
+ 	DOMAIN_BUS_FSL_MC_MSI,
  };
  
  /**
