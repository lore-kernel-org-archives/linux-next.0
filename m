From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] SOC audio: fix PM=n build
Date: Tue, 17 Jun 2008 09:46:29 -0700
Message-ID: <20080617094629.4859e2c2.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:27635 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754064AbYFQQrY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jun 2008 12:47:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: liam.girdwood@wolfsonmicro.com, broonie@opensource.wolfsonmicro.com, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix sound/soc build failure when CONFIG_PM=n:

linux-next-20080617/sound/soc/soc-core.c:829: error: 'soc_resume_deferred' undeclared (first use in this function)
soc3.out:make[3]: *** [sound/soc/soc-core.o] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 sound/soc/soc-core.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20080617.orig/sound/soc/soc-core.c
+++ linux-next-20080617/sound/soc/soc-core.c
@@ -825,8 +825,10 @@ static int soc_probe(struct platform_dev
 
 	/* DAPM stream work */
 	INIT_DELAYED_WORK(&socdev->delayed_work, close_delayed_work);
+#ifdef CONFIG_PM
 	/* deferred resume work */
 	INIT_WORK(&socdev->deferred_resume_work, soc_resume_deferred);
+#endif
 
 	return 0;
 
