From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: linux-next: net tree build failure
Date: Wed, 22 Apr 2009 04:37:59 +0400
Message-ID: <20090422003759.GA12784@orion>
References: <20090422102906.7604dfb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:49950 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbZDVAiH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2009 20:38:07 -0400
Received: by fxm2 with SMTP id 2so2823850fxm.37
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2009 17:38:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20090422102906.7604dfb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Wed, Apr 22, 2009 at 10:29:06AM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Building next-20090421 (arm assabet_defconfig and several others) fails like
> this:
> 
> drivers/net/irda/sa1100_ir.c:928: error: 'struct net_device' has no member named 'ir'
> 
> Caused by commit a1de966682551debbe690672e760487cc555c05f
> ("irda/sa1100_ir: convert to net_device_ops").
> 
> A simple typo - more care needed ...

Yes, my bad. Thanks!

>From 53312aaa78cfbb3db6fc6062de67e3a47e773270 Mon Sep 17 00:00:00 2001
From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Wed, 22 Apr 2009 04:34:47 +0400
Subject: [PATCH] sa1100_ir: fix build breakage

Fix simple typo. Caused by commit
a1de966682551debbe690672e760487cc555c05f
("irda/sa1100_ir: convert to net_device_ops").

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/net/irda/sa1100_ir.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/irda/sa1100_ir.c b/drivers/net/irda/sa1100_ir.c
index 4ed7636..2aeb2e6 100644
--- a/drivers/net/irda/sa1100_ir.c
+++ b/drivers/net/irda/sa1100_ir.c
@@ -925,7 +925,7 @@ static int sa1100_irda_probe(struct platform_device *pdev)
 		goto err_mem_5;
 
 	dev->netdev_ops	= &sa1100_irda_netdev_ops;
-	dev->ir		= IRQ_Ser2ICP;
+	dev->irq	= IRQ_Ser2ICP;
 
 	irda_init_max_qos_capabilies(&si->qos);
 
-- 
1.6.2.3
