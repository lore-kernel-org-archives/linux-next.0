From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH] arm/rpc: avoid static keyword removal via define
Date: Mon, 15 Dec 2014 09:48:07 +0100
Message-ID: <1418633287-5019-2-git-send-email-borntraeger@de.ibm.com>
References: <1418633287-5019-1-git-send-email-borntraeger@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:33579 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926AbaLOIsQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Dec 2014 03:48:16 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Mon, 15 Dec 2014 08:48:14 -0000
In-Reply-To: <1418633287-5019-1-git-send-email-borntraeger@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>

commit 4486b86368d7 ("[ARM] riscpc: fix decompressor font file handling")
introduced Makefile magic to avoid building a file two times. Using
-Dstatic= does break some assumptions on compiler.h that were introduced
for READ_ONCE.

Lets just use sed on the copy instead of using a define.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Russell King <linux@arm.linux.org.uk>
---
 arch/arm/boot/compressed/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 3ea230a..198f12a 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -196,10 +196,11 @@ $(obj)/piggy.$(suffix_y): $(obj)/../Image FORCE
 
 $(obj)/piggy.$(suffix_y).o:  $(obj)/piggy.$(suffix_y) FORCE
 
-CFLAGS_font.o := -Dstatic=
-
+# use the font from lib/fonts/. We have to make the font global,
+# for the decompressor so lets remove the static declaration
 $(obj)/font.c: $(FONTC)
 	$(call cmd,shipped)
+	sed -i s/static//g $@
 
 $(obj)/hyp-stub.S: $(srctree)/arch/$(SRCARCH)/kernel/hyp-stub.S
 	$(call cmd,shipped)
-- 
1.8.5.5
