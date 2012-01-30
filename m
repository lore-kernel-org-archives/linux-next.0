From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] cpufreq: fix gx-suspmod.c build
Date: Mon, 30 Jan 2012 11:40:50 -0800
Message-ID: <4F26F242.1060903@xenotime.net>
References: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:46853 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752930Ab2A3Sms (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2012 13:42:48 -0500
In-Reply-To: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Hiroshi Miura <miura@da-cha.org>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build error & warnings:

drivers/cpufreq/gx-suspmod.c:175:35: error: macro "MODULE_DEVICE_TABLE" requires 2 arguments, but only 1 given
drivers/cpufreq/gx-suspmod.c:175:1: warning: data definition has no type or storage class
drivers/cpufreq/gx-suspmod.c:175:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Hiroshi Miura <miura@da-cha.org>
Cc:	Dave Jones <davej@redhat.com>
Cc:	cpufreq@vger.kernel.org
---
 drivers/cpufreq/gx-suspmod.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120130.orig/drivers/cpufreq/gx-suspmod.c
+++ linux-next-20120130/drivers/cpufreq/gx-suspmod.c
@@ -172,7 +172,7 @@ static struct pci_device_id gx_chipset_t
 	{ PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5510), },
 	{ 0, },
 };
-MODULE_DEVICE_TABLE(gx_chipset_tbl);
+MODULE_DEVICE_TABLE(x86cpu, gx_chipset_tbl);
 
 static void gx_write_byte(int reg, int value)
 {
