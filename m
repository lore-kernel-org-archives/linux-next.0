From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH linux-next] serio: add ifdef for i8042 build fix
Date: Thu, 29 May 2008 09:56:33 -0700
Message-ID: <20080529095633.8893b4ec.randy.dunlap@oracle.com>
References: <20080529182556.2994310a.sfr@canb.auug.org.au>
	<20080529094454.3605aa5c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:57446 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093AbYE2QoN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 12:44:13 -0400
In-Reply-To: <20080529094454.3605aa5c.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, dmitry.torokhov@gmail.com, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Restrict variable usage by bounding it with ifdef/endif CONFIG_PNP.

linux-next-20080529/drivers/input/serio/i8042-x86ia64io.h:590: error: 'i8042_nopnp' undeclared (first use in this function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/input/serio/i8042-x86ia64io.h |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20080529.orig/drivers/input/serio/i8042-x86ia64io.h
+++ linux-next-20080529/drivers/input/serio/i8042-x86ia64io.h
@@ -586,9 +586,11 @@ static int __init i8042_platform_init(vo
 	i8042_aux_irq = I8042_MAP_IRQ(12);
 
 #if defined(__i386__) || defined(__x86_64__)
+#ifdef CONFIG_PNP
 	if (dmi_check_system(i8042_dmi_nopnp_table))
 		i8042_nopnp = 1;
 #endif
+#endif
 	retval = i8042_pnp_init();
 	if (retval)
 		return retval;



---
