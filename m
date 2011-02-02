From: Sourav Poddar <sourav.poddar@ti.com>
Subject: [PATCH -next] arm: fix compilation warning in next-20110202 build
Date: Wed,  2 Feb 2011 20:57:00 +0530
Message-ID: <1296660420-27840-1-git-send-email-sourav.poddar@ti.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:44917 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754339Ab1BBP1N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Feb 2011 10:27:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-arm-kernel@vger.kernel.org, Sourav Poddar <sourav.poddar@ti.com>, Russell King <rmk+kernel@arm.linux.org.uk>

Building linux-next:next-20110202 with omap2plus_defconfig
results in the following compilation warning.

arch/arm/kernel/module.c:272: warning: 'find_mod_section' defined but not used.

Call to find_mod_section function is under a compilation flag but the
same is not true for its definition. Putting compilation flag around its
definition removes the warning.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/kernel/module.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
index 74e25ab..ba65805 100644
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@ -269,6 +269,7 @@ struct mod_unwind_map {
 	const Elf_Shdr *txt_sec;
 };
 
+#ifdef CONFIG_ARM_PATCH_PHYS_VIRT
 static const Elf_Shdr *find_mod_section(const Elf32_Ehdr *hdr,
 	const Elf_Shdr *sechdrs, const char *name)
 {
@@ -281,6 +282,7 @@ static const Elf_Shdr *find_mod_section(const Elf32_Ehdr *hdr,
 
 	return NULL;
 }
+#endif
 
 extern void fixup_pv_table(const void *, unsigned long);
 
-- 
1.7.0.4
