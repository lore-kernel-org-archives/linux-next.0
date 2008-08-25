From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  x86 tree build failure
Date: Mon, 25 Aug 2008 20:22:21 +1000
Message-ID: <20080825202221.18567cfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50740 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755229AbYHYKW2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 06:22:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Rene Herman <rene.herman@keyaccess.nl>

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/char/agp/uninorth-agp.c:541: error: unknown field 'agp_destroy_paged' specified in initializer

Caused by commit 5f310b63781f6777bf4e812570560ec0f8ea42d8 ("agp: enable optimized agp_alloc_pages methods").  A simple typo ...

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Aug 2008 20:16:07 +1000
Subject: [PATCH] agp: fix typo in uninorth-agp

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/agp/uninorth-agp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 2accc97..0f004b6 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -538,7 +538,7 @@ const struct agp_bridge_driver u3_agp_driver = {
 	.agp_alloc_page		= agp_generic_alloc_page,
 	.agp_alloc_pages	= agp_generic_alloc_pages,
 	.agp_destroy_page	= agp_generic_destroy_page,
-	.agp_destroy_paged	= agp_generic_destroy_pages,
+	.agp_destroy_pages	= agp_generic_destroy_pages,
 	.agp_type_to_mask_type  = agp_generic_type_to_mask_type,
 	.cant_use_aperture	= true,
 	.needs_scratch_page	= true,
-- 
1.5.6.3
