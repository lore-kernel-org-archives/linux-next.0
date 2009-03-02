From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] staging/line6: depends on SND
Date: Mon, 02 Mar 2009 09:54:57 -0800
Message-ID: <49AC1D71.4050303@oracle.com>
References: <20090302182217.90ca3356.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:24158 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289AbZCBRz0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2009 12:55:26 -0500
In-Reply-To: <20090302182217.90ca3356.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

line6 code has lots of dependencies on ALSA (and build errors),
so express that in Kconfig.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/line6/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090302.orig/drivers/staging/line6/Kconfig
+++ linux-next-20090302/drivers/staging/line6/Kconfig
@@ -1,6 +1,6 @@
 config LINE6_USB
 	tristate "Line6 USB support"
-	depends on USB
+	depends on USB && SND
 	help
 	  This is a driver for the guitar amp, cab, and effects modeller
 	  PODxt Pro by Line6 (and similar devices), supporting the
