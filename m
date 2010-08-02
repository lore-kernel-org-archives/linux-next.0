From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging-next tree with the pcmcia
 tree
Date: Mon, 2 Aug 2010 13:57:40 +1000
Message-ID: <20100802135740.bfdfc58c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37757 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752191Ab0HBD5o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Aug 2010 23:57:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Gustavo Silva <silvagustavosilva@gmail.com>

Hi Greg,

Today's linux-next merge of the staging-next tree got a conflict in
drivers/staging/comedi/drivers/quatech_daqp_cs.c between commit
9b3efec734d2d79d82a6f5cef25a618d41a6b2c5 ("pcmcia: do not use io_req_t
after call to pcmcia_request_io()") from the pcmcia tree and commit
3420f6b4c1ac731e80d0911e0092705992cef14f ("Staging: comedi: drivers: fix
coding style issues in quatech_daqp_cs.c") from the staging-next tree.

Just context changes.  I fixed it up (see below) and can carry the fixes
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/comedi/drivers/quatech_daqp_cs.c
index 25f4e67e,8b49cb1..0000000
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@@ -1150,11 -1151,13 +1148,11 @@@ static void daqp_cs_config(struct pcmci
  	/* Finally, report what we've done */
  	dev_info(&link->dev, "index 0x%02x", link->conf.ConfigIndex);
  	if (link->conf.Attributes & CONF_ENABLE_IRQ)
- 		printk(", irq %u", link->irq);
+ 		printk(KERN_INFO ", irq %u", link->irq);
 -	if (link->io.NumPorts1)
 -		printk(", io 0x%04x-0x%04x", link->io.BasePort1,
 -		       link->io.BasePort1 + link->io.NumPorts1 - 1);
 -	if (link->io.NumPorts2)
 -		printk(" & 0x%04x-0x%04x", link->io.BasePort2,
 -		       link->io.BasePort2 + link->io.NumPorts2 - 1);
 +	if (link->resource[0])
 +		printk(" & %pR", link->resource[0]);
 +	if (link->resource[1])
 +		printk(" & %pR", link->resource[1]);
  	printk("\n");
  
  	return;
