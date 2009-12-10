From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] net: niu uses crc32, so select CRC32
Date: Thu, 10 Dec 2009 09:31:03 -0800
Message-ID: <20091210093103.eda05dfe.randy.dunlap@oracle.com>
References: <20091210175919.340b4c0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:46474 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756781AbZLJRbk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2009 12:31:40 -0500
In-Reply-To: <20091210175919.340b4c0c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, davem@davemloft.net

From: Randy Dunlap <randy.dunlap@oracle.com>

niu drivers uses crc32 functions, so it needs to select CRC32.

niu.c:(.text+0x18a7f8): undefined reference to `crc32_le'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/net/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20091210.orig/drivers/net/Kconfig
+++ linux-next-20091210/drivers/net/Kconfig
@@ -2698,6 +2698,7 @@ config NETXEN_NIC
 config NIU
 	tristate "Sun Neptune 10Gbit Ethernet support"
 	depends on PCI
+	select CRC32
 	help
 	  This enables support for cards based upon Sun's
 	  Neptune chipset.
---
~Randy
