From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] target: fix tfc_io.c printk format warning
Date: Mon, 23 May 2011 11:35:55 -0700
Message-ID: <20110523113555.e37bc856.randy.dunlap@oracle.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62751 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756121Ab1EWSgz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 14:36:55 -0400
In-Reply-To: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Nicholas A. Bellinger" <nab@kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning:

drivers/target/tcm_fc/tfc_io.c:209: warning: format '%x' expects type 'unsigned int', but argument 5 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/target/tcm_fc/tfc_io.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

and please put an entry in the MAINTAINERS file for drivers/target/


--- linux-next-20110523.orig/drivers/target/tcm_fc/tfc_io.c
+++ linux-next-20110523/drivers/target/tcm_fc/tfc_io.c
@@ -203,7 +203,7 @@ int ft_queue_data_in(struct se_cmd *se_c
 			/* XXX For now, initiator will retry */
 			if (printk_ratelimit())
 				printk(KERN_ERR "%s: Failed to send frame %p, "
-						"xid <0x%x>, remaining <0x%x>, "
+						"xid <0x%x>, remaining <0x%zx>, "
 						"lso_max <0x%x>\n",
 						__func__, fp, ep->xid,
 						remaining, lport->lso_max);
