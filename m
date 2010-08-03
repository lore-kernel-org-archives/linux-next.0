From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] pcmcia: avoid buffer overflow in pcmcia_setup_isa_irq
Date: Tue, 3 Aug 2010 09:42:57 +0200
Message-ID: <20100803074257.GA28420@comet.dominikbrodowski.net>
References: <1280795899.11158.52.camel@lovely.krouter>
 <20100803074022.GA28158@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar-3.linta.de ([188.40.101.200]:57111 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752171Ab0HCHnm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 03:43:42 -0400
Content-Disposition: inline
In-Reply-To: <20100803074022.GA28158@comet.dominikbrodowski.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Fritz <chf.fritz@googlemail.com>, linux-pcmcia@lists.infradead.org, linux-next <linux-next@vger.kernel.org>

The corresponding fix for 2.6.34 and earlier would be:

diff --git a/drivers/pcmcia/pcmcia_resource.c b/drivers/pcmcia/pcmcia_resource.c
index 7c3d03b..cfcf868 100644
--- a/drivers/pcmcia/pcmcia_resource.c
+++ b/drivers/pcmcia/pcmcia_resource.c
@@ -41,7 +41,7 @@ module_param(io_speed, int, 0444);
 #ifdef CONFIG_PCMCIA_PROBE
 #include <asm/irq.h>
 /* mask of IRQs already reserved by other cards, we should avoid using them */
-static u8 pcmcia_used_irq[NR_IRQS];
+static u8 pcmcia_used_irq[32];
 #endif
 
 static int pcmcia_adjust_io_region(struct resource *res, unsigned long start,
@@ -768,6 +768,9 @@ int pcmcia_request_irq(struct pcmcia_device *p_dev, irq_req_t *req)
 		for (try = 0; try < 64; try++) {
 			irq = try % 32;
 
+			if (irq > NR_IRQS)
+				continue;
+
 			/* marked as available by driver, and not blocked by userspace? */
 			if (!((mask >> irq) & 1))
 				continue;
