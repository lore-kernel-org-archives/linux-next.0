From: Russ Anderson <rja@sgi.com>
Subject: [patch bugfix] UV system table in bios accessed after unmap
Date: Mon, 30 Mar 2009 17:52:40 -0500
Message-ID: <20090330225240.GA22776@sgi.com>
Reply-To: Russ Anderson <rja@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:46147 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751869AbZC3Wwn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2009 18:52:43 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
Cc: Russ Anderson <rja@sgi.com>

Use the copy of UV system table in kernel memory, not the one in
bios after unmapping.

Signed-off-by: Russ Anderson <rja@sgi.com>

---
 arch/x86/kernel/bios_uv.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux-next/arch/x86/kernel/bios_uv.c
===================================================================
--- linux-next.orig/arch/x86/kernel/bios_uv.c	2009-03-30 17:39:26.622178261 -0500
+++ linux-next/arch/x86/kernel/bios_uv.c	2009-03-30 17:44:12.703957062 -0500
@@ -182,7 +182,8 @@ void uv_bios_init(void)
 	memcpy(&uv_systab, tab, sizeof(struct uv_systab));
 	iounmap(tab);
 
-	printk(KERN_INFO "EFI UV System Table Revision %d\n", tab->revision);
+	printk(KERN_INFO "EFI UV System Table Revision %d\n",
+					uv_systab.revision);
 }
 #else	/* !CONFIG_EFI */
 
-- 
Russ Anderson, OS RAS/Partitioning Project Lead  
SGI - Silicon Graphics Inc          rja@sgi.com
