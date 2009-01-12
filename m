From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] scsi_debug: needs CRC_T10DIF
Date: Mon, 12 Jan 2009 10:53:04 -0800
Message-ID: <496B9190.5030503@oracle.com>
References: <20090112154539.4857f533.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:36467 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752959AbZALSxy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 13:53:54 -0500
In-Reply-To: <20090112154539.4857f533.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, James Bottomley <James.Bottomley@HansenPartnership.com>, Andrew Morton <akpm@linux-foundation.org>, mkp@mkp.net

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix scsi_debug build error:

drivers/built-in.o: In function `resp_read':
scsi_debug.c:(.text+0x21379a): undefined reference to `crc_t10dif'
drivers/built-in.o: In function `resp_write':
scsi_debug.c:(.text+0x213fca): undefined reference to `crc_t10dif'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/scsi/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090112.orig/drivers/scsi/Kconfig
+++ linux-next-20090112/drivers/scsi/Kconfig
@@ -1535,6 +1535,7 @@ config SCSI_NSP32
 config SCSI_DEBUG
 	tristate "SCSI debugging host simulator"
 	depends on SCSI
+	select CRC_T10DIF
 	help
 	  This is a host adapter simulator that can simulate multiple hosts
 	  each with multiple dummy SCSI devices (disks). It defaults to one
