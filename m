From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] mtd: fix nand/docg4.c printk format warnings
Date: Mon, 30 Jan 2012 19:08:16 -0800
Message-ID: <4F275B20.6010105@xenotime.net>
References: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:44032 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752960Ab2AaCKO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2012 21:10:14 -0500
In-Reply-To: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings for resource_size_t:

drivers/mtd/nand/docg4.c:1277:4: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
drivers/mtd/nand/docg4.c:1277:4: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	David Woodhouse <dwmw2@infradead.org>
Cc:	linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/docg4.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20120130.orig/drivers/mtd/nand/docg4.c
+++ linux-next-20120130/drivers/mtd/nand/docg4.c
@@ -1273,8 +1273,9 @@ static int __init probe_docg4(struct pla
 	virtadr = ioremap(r->start, resource_size(r));
 	if (!virtadr) {
 		dev_err(dev, "Diskonchip ioremap failed: "
-			"0x%x bytes at 0x%x\n",
-			resource_size(r), r->start);
+			"0x%llx bytes at 0x%llx\n",
+			(unsigned long long)resource_size(r),
+			(unsigned long long)r->start);
 		return -EIO;
 	}
 
