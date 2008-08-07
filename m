From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mtd tree build failure
Date: Thu, 7 Aug 2008 13:30:05 +1000
Message-ID: <20080807133005.d37ea7b8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58249 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756302AbYHGDaK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Aug 2008 23:30:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Alexey Korolev <akorolev@infradead.org>

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "qry_present" [drivers/mtd/chips/cfi_probe.ko] undefined!
ERROR: "qry_mode_off" [drivers/mtd/chips/cfi_probe.ko] undefined!
ERROR: "qry_mode_on" [drivers/mtd/chips/cfi_probe.ko] undefined!

Caused by commit 2e489e077a6ad118c4f247faedf330117b107cce ("[MTD] [NOR]
Add qry_mode_on()/qry_omde_off() to deal with odd chips").

I added the following patch.

Those names are very generic for kernel global symbols ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 6e7b82917d1b8621c6520581c3e036956d16f8ab Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Aug 2008 13:28:04 +1000
Subject: [PATCH] mtd: export qry_{preset,mode_on,mode_off}

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mtd/chips/cfi_util.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 8d75536..4a60408 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -50,6 +50,7 @@ int __xipram qry_present(struct map_info *map, __u32 base,
 
 	return 1; 	/* "QRY" found */
 }
+EXPORT_SYMBOL_GPL(qry_present);
 
 int __xipram qry_mode_on(uint32_t base, struct map_info *map,
 				struct cfi_private *cfi)
@@ -73,12 +74,15 @@ int __xipram qry_mode_on(uint32_t base, struct map_info *map,
 	/* QRY not found */
 	return 0;
 }
+EXPORT_SYMBOL_GPL(qry_mode_on);
+
 void __xipram qry_mode_off(uint32_t base, struct map_info *map,
 				struct cfi_private *cfi)
 {
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
 }
+EXPORT_SYMBOL_GPL(qry_mode_off);
 
 struct cfi_extquery *
 __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* name)
-- 
1.5.6.3
