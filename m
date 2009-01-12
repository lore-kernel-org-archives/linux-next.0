From: Balaji Rao <balajirrao@openmoko.org>
Subject: Re: linux-next: mfd tree build failure
Date: Mon, 12 Jan 2009 15:37:55 +0530
Message-ID: <20090112100753.GA21301@fedora.yogi>
References: <20090112140318.e25cd2bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.openmoko.org ([88.198.124.205]:44666 "EHLO
	mail.openmoko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141AbZALKI5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 05:08:57 -0500
Content-Disposition: inline
In-Reply-To: <20090112140318.e25cd2bf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org

On Mon, Jan 12, 2009 at 02:03:18PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "__set_irq_handler" [drivers/mfd/pcf50633-core.ko] undefined!
> ERROR: "handle_level_irq" [drivers/mfd/pcf50633-core.ko] undefined!
> 
> Immediate cause is clearly commit
> f52046b14b1e1a8a02ae48d0c69d39c5e204644f ("mfd: PCF50633 core driver")
> which introduces this code.  The above functions don't appear to be
> exported to modules.
> 
> I have dropped the mfd tree for today.

Oh, sorry about this. I can actually do without this. Here's the patch.
Sameo, can you please apply it ?

    pcf50633: Remove references to non-exported functions
    
    Remove references to set_irq_type and handle_level_irq which are not
    exported to modules.
    
    Signed-off-by: Balaji Rao <balajirrao@openmoko.org>

diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index 24508e2..ea9488e 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -626,7 +626,6 @@ static int __devinit pcf50633_probe(struct i2c_client *client,
 	}
 
 	if (client->irq) {
-		set_irq_handler(client->irq, handle_level_irq);
 		ret = request_irq(client->irq, pcf50633_irq,
 				IRQF_TRIGGER_LOW, "pcf50633", pcf);
 
