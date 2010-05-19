From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fbmem: fix printk format warnings
Date: Wed, 19 May 2010 11:13:58 -0700
Message-ID: <20100519111358.c0c527d4.randy.dunlap@oracle.com>
References: <20100519163554.80c7fcd3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:21120 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058Ab0ESSPh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2010 14:15:37 -0400
In-Reply-To: <20100519163554.80c7fcd3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk formats:

drivers/video/fbmem.c: In function 'fb_do_apertures_overlap':
drivers/video/fbmem.c:1494: warning: format '%llx' expects type 'long long unsigned int', but argument 2 has type 'resource_size_t'
drivers/video/fbmem.c:1494: warning: format '%llx' expects type 'long long unsigned int', but argument 3 has type 'resource_size_t'
drivers/video/fbmem.c:1494: warning: format '%llx' expects type 'long long unsigned int', but argument 4 has type 'resource_size_t'
drivers/video/fbmem.c:1494: warning: format '%llx' expects type 'long long unsigned int', but argument 5 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/video/fbmem.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20100519.orig/drivers/video/fbmem.c
+++ linux-next-20100519/drivers/video/fbmem.c
@@ -1491,7 +1491,10 @@ static bool fb_do_apertures_overlap(stru
 		for (j = 0; j < gena->count; ++j) {
 			struct aperture *g = &gena->ranges[j];
 			printk(KERN_DEBUG "checking generic (%llx %llx) vs hw (%llx %llx)\n",
-				g->base, g->size, h->base, h->size);
+				(unsigned long long)g->base,
+				(unsigned long long)g->size,
+				(unsigned long long)h->base,
+				(unsigned long long)h->size);
 			if (apertures_overlap(g, h))
 				return true;
 		}
