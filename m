From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH-next] pcmcia: fix sparse integer as NULL pointer warning
Date: Wed, 23 Jul 2008 18:34:08 -0700
Message-ID: <1216863248.30386.61.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.238]:8377 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbYGXBeI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 21:34:08 -0400
Received: by rv-out-0506.google.com with SMTP id k40so2638886rvb.1
        for <linux-next@vger.kernel.org>; Wed, 23 Jul 2008 18:34:06 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@brodo.de>
Cc: linux-next <linux-next@vger.kernel.org>

drivers/pcmcia/rsrc_nonstatic.c:278:30: warning: Using plain integer as NULL pointer

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
 drivers/pcmcia/rsrc_nonstatic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index d0c1d63..31e6a03 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -275,7 +275,7 @@ static int readable(struct pcmcia_socket *s, struct resource *res,
 		destroy_cis_cache(s);
 	}
 	s->cis_mem.res = NULL;
-	if ((ret != 0) || (count == 0))
+	if ((ret != 0) || (count == NULL))
 		return 0;
 	return 1;
 }
-- 
1.5.6.4.570.g052e
