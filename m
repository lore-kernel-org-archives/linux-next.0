From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/p9auth: fix dependency/build error
Date: Tue, 10 Mar 2009 11:59:36 -0700
Message-ID: <49B6B898.6010902@oracle.com>
References: <20090310195534.8f8f3c7a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:51371 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551AbZCJS5y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2009 14:57:54 -0400
In-Reply-To: <20090310195534.8f8f3c7a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix p9auth dependency/build failure.  It needs to depend on
CRYPTO.

p9auth.c:(.text+0x107297): undefined reference to `crypto_alloc_base'
p9auth.c:(.text+0x1073d4): undefined reference to `crypto_destroy_tfm'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/p9auth/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090310.orig/drivers/staging/p9auth/Kconfig
+++ linux-next-20090310/drivers/staging/p9auth/Kconfig
@@ -1,6 +1,7 @@
 config PLAN9AUTH
 	tristate "Plan 9 style capability device implementation"
 	default n
+	depends on CRYPTO
 	help
 	  This module implements the Plan 9 style capability device.
 
