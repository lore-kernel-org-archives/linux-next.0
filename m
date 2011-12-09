From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] xshm: fix build errors, depends on NET
Date: Fri, 09 Dec 2011 14:21:50 -0800
Message-ID: <4EE289FE.90006@xenotime.net>
References: <20111209163247.1de15dcb5b735ca5e1ad030b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:59689 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751843Ab1LIVWT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2011 16:22:19 -0500
In-Reply-To: <20111209163247.1de15dcb5b735ca5e1ad030b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sjur Brendeland <sjur.brandeland@stericsson.com>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build errors in xshm.  xshm uses netlink, so it
should depend on NET.

ERROR: "genl_unregister_family" [drivers/xshm/xshm.ko] undefined!
ERROR: "netlink_unicast" [drivers/xshm/xshm.ko] undefined!
ERROR: "genl_register_family_with_ops" [drivers/xshm/xshm.ko] undefined!
ERROR: "init_net" [drivers/xshm/xshm.ko] undefined!
ERROR: "__alloc_skb" [drivers/xshm/xshm.ko] undefined!
ERROR: "kfree_skb" [drivers/xshm/xshm.ko] undefined!
ERROR: "skb_put" [drivers/xshm/xshm.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Sjur Brendeland <sjur.brandeland@stericsson.com>
---
 drivers/xshm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20111209.orig/drivers/xshm/Kconfig
+++ linux-next-20111209/drivers/xshm/Kconfig
@@ -5,6 +5,7 @@ config XSHM
 
 config XSHM_CHR
 	tristate "Character device for External Shared Memory (XSHM)"
+	depends on NET
 	select XSHM
 	default n
 	---help---
