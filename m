From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging-next tree with the pcmcia
 tree
Date: Wed, 28 Apr 2010 16:11:53 +1000
Message-ID: <20100428161153.e683cb12.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60629 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750864Ab0D1GLz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Apr 2010 02:11:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>

Hi Greg,

Today's linux-next merge of the staging-next tree got a conflict in
drivers/staging/netwave/netwave_cs.c between commit
c8bf6e66c254bba7d0ea3f5d02420776dceac657 ("pcmcia: re-work
pcmcia_request_irq()") from the pcmcia tree and commit
3c7475d0aaad3614f6b1db291310c577eee3fb33 ("Staging: netwave: fixed
trailing whitespace style issue in netwave_cs.c") from the staging-next
tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/netwave/netwave_cs.c
index f1ee2cb,7b31621..0000000
--- a/drivers/staging/netwave/netwave_cs.c
+++ b/drivers/staging/netwave/netwave_cs.c
@@@ -377,10 -378,14 +377,10 @@@ static int netwave_probe(struct pcmcia_
      /* The io structure describes IO port mapping */
      link->io.NumPorts1 = 16;
      link->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
-     /* link->io.NumPorts2 = 16; 
+     /* link->io.NumPorts2 = 16;
         link->io.Attributes2 = IO_DATA_PATH_WIDTH_16; */
      link->io.IOAddrLines = 5;
-     
+ 
 -    /* Interrupt setup */
 -    link->irq.Attributes = IRQ_TYPE_DYNAMIC_SHARING;
 -    link->irq.Handler = &netwave_interrupt;
 -
      /* General socket configuration */
      link->conf.Attributes = CONF_ENABLE_IRQ;
      link->conf.IntType = INT_MEMORY_AND_IO;
