From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH -next] Fix "W" macro in unified.h
Date: Sun, 6 Sep 2009 01:02:40 +0400
Message-ID: <20090905210240.GA3525@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f227.google.com ([209.85.219.227]:35101 "EHLO
	mail-ew0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbZIEVCn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Sep 2009 17:02:43 -0400
Received: by ewy27 with SMTP id 27so1885956ewy.40
        for <linux-next@vger.kernel.org>; Sat, 05 Sep 2009 14:02:43 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: catalin.marinas@arm.com
Cc: linux-next@vger.kernel.org, sfr@canb.auug.org.au

Please, fold into 0becb088501886f37ade38762c8eaaf4263572cc
aka "Thumb-2: Add macros for the unified assembler syntax"

otherwise:

	crypto/cast6.c:372:39: error: macro "W" passed 2 arguments, but takes just 1

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/arm/include/asm/unified.h |    4 ++++
 1 file changed, 4 insertions(+)

--- a/arch/arm/include/asm/unified.h
+++ b/arch/arm/include/asm/unified.h
@@ -35,7 +35,9 @@
 
 #define ARM(x...)
 #define THUMB(x...)	x
+#ifdef __ASSEMBLY__
 #define W(instr)	instr.w
+#endif
 #define BSYM(sym)	sym + 1
 
 #else	/* !CONFIG_THUMB2_KERNEL */
@@ -45,7 +47,9 @@
 
 #define ARM(x...)	x
 #define THUMB(x...)
+#ifdef __ASSEMBLY__
 #define W(instr)	instr
+#endif
 #define BSYM(sym)	sym
 
 #endif	/* CONFIG_THUMB2_KERNEL */
