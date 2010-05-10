From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: memrar depends on RAR_REGISTER
Date: Mon, 10 May 2010 10:53:04 -0700
Message-ID: <20100510105304.7a4bcb92.randy.dunlap@oracle.com>
References: <20100510160234.54f76c0a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:40221 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884Ab0EJRyc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2010 13:54:32 -0400
In-Reply-To: <20100510160234.54f76c0a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ossama Othman <ossama.othman@intel.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>

From: Randy Dunlap <randy.dunlap@oracle.com>

Alan said that memrar should depend on RAR_REGISTER
(instead of selecting it).

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Ossama Othman <ossama.othman@intel.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
---
 drivers/staging/memrar/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100510.orig/drivers/staging/memrar/Kconfig
+++ linux-next-20100510/drivers/staging/memrar/Kconfig
@@ -1,6 +1,6 @@
 config MRST_RAR_HANDLER
 	tristate "RAR handler driver for Intel Moorestown platform"
-	select RAR_REGISTER
+	depends on RAR_REGISTER
 	---help---
 	  This driver provides a memory management interface to
 	  restricted access regions (RAR) available on the Intel
