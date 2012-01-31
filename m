From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] ramoops: fix printk format warnings
Date: Mon, 30 Jan 2012 19:49:13 -0800
Message-ID: <4F2764B9.6000402@xenotime.net>
References: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:53997 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752166Ab2AaCvL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2012 21:51:11 -0500
In-Reply-To: <20120130144102.8d202c7d8eccd503a86b3053@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings for phys_addr_t type variables:

drivers/char/ramoops.c:246:3: warning: format '%llx' expects type 'long long unsigned int', but argument 3 has type 'phys_addr_t'
drivers/char/ramoops.c:273:2: warning: format '%llx' expects type 'long long unsigned int', but argument 3 has type 'phys_addr_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Greg K-H <gregkh@suse.de>
---
 drivers/char/ramoops.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20120130.orig/drivers/char/ramoops.c
+++ linux-next-20120130/drivers/char/ramoops.c
@@ -244,7 +244,7 @@ static int __init ramoops_probe(struct p
 
 	if (!request_mem_region(cxt->phys_addr, cxt->size, "ramoops")) {
 		pr_err("request mem region (0x%lx@0x%llx) failed\n",
-			cxt->size, cxt->phys_addr);
+			cxt->size, (unsigned long long)cxt->phys_addr);
 		err = -EINVAL;
 		goto fail_buf;
 	}
@@ -271,7 +271,8 @@ static int __init ramoops_probe(struct p
 	dump_oops = pdata->dump_oops;
 
 	pr_info("attached 0x%lx@0x%llx (%ux0x%zx)\n",
-		cxt->size, cxt->phys_addr, cxt->max_count, cxt->record_size);
+		cxt->size, (unsigned long long)cxt->phys_addr,
+		cxt->max_count, cxt->record_size);
 
 	return 0;
 
