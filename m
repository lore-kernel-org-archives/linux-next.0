From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 05 Nov 2009 00:00:12 -0800 (PST)
Message-ID: <20091105.000012.61292273.davem@davemloft.net>
References: <20091105185014.76dd0d31.sfr@canb.auug.org.au>
	<20091104.235315.18303666.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52800
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751115AbZKEH7r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2009 02:59:47 -0500
In-Reply-To: <20091104.235315.18303666.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kristoffer@gaisler.com

From: David Miller <davem@davemloft.net>
Date: Wed, 04 Nov 2009 23:53:15 -0800 (PST)

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 5 Nov 2009 18:50:14 +1100
> 
>> Caused by commit d4ac42a582e46d7f86f0acb4253a310423c72c4c ("sparc:
>> Support for GRLIB APBUART serial port").  I added the following patch for
>> today.
> 
> Thanks, the real fix is to simply remove that include, it isn't
> actually needed and the CONFIG_OF dependency is sufficient.

Hmm, it took a tiny bit more than that :-)  Here's what I commited
to fix this, thanks.

apbuart: Kill dependency on deprecated Sparc-only PROM interfaces.

Use the proper modern OF ones instead.

Noticed by Stephen Rothwell.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/serial/apbuart.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/serial/apbuart.c b/drivers/serial/apbuart.c
index c7883a3..5f9dec3 100644
--- a/drivers/serial/apbuart.c
+++ b/drivers/serial/apbuart.c
@@ -29,7 +29,6 @@
 #include <linux/io.h>
 #include <linux/serial_core.h>
 #include <asm/irq.h>
-#include <asm/oplib.h>
 
 #include "apbuart.h"
 
@@ -596,10 +595,9 @@ static struct of_platform_driver grlib_apbuart_of_driver = {
 static void grlib_apbuart_configure(void)
 {
 	static int enum_done;
-	struct device_node *np;
+	struct device_node *np, *rp;
 	struct uart_port *port = NULL;
-
-	int node;
+	const u32 *prop;
 	int freq_khz;
 	int v = 0, d = 0;
 	unsigned int addr;
@@ -610,8 +608,10 @@ static void grlib_apbuart_configure(void)
 		return;
 
 	/* Get bus frequency */
-	node = prom_getchild(prom_root_node);
-	freq_khz = prom_getint(node, "clock-frequency");
+	rp = of_find_node_by_name(NULL, "/");
+	rp = of_get_next_child(rp, NULL);
+	prop = of_get_property(rp, "clock-frequency", NULL);
+	freq_khz = *prop;
 
 	line = 0;
 	for_each_matching_node(np, apbuart_match) {
-- 
1.6.5.2
