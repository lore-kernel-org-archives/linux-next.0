From: Tony Luck <tony.luck@intel.com>
Subject: EXPORT_SYMBOL(min_low_pfn);
Date: Tue, 5 Feb 2013 11:31:22 -0800
Message-ID: <CA+8MBbLW333z1Subx=fLu46u2RQXkNB1iTbORuKbq7YpZi1X_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:35164 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754880Ab3BETjo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Feb 2013 14:39:44 -0500
Received: by mail-vc0-f180.google.com with SMTP id fo13so307290vcb.39
        for <linux-next@vger.kernel.org>; Tue, 05 Feb 2013 11:39:42 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sanjay Lal <sanjayl@kymasys.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org

Today i noticed in linux-next this commit:

commit b0d9c17503444c2df8cb8e93ccfa4877edd71933
Author: Sanjay Lal <sanjayl@kymasys.com>
Date:   Wed Nov 21 18:34:14 2012 -0800

    MIPS: Export symbols used by KVM/MIPS module

which causes this kernel build warning on ia64:

WARNING: vmlinux: 'min_low_pfn' exported twice. Previous export was in vmlinux


We just need to delete the arch/ia64 specific export (and grep says
for arch/metag too):

$ git grep min_low_pfn | grep EXPORT
arch/ia64/kernel/ia64_ksyms.c:EXPORT_SYMBOL(min_low_pfn);	/* defined
by bootmem.c, but not exported by generic code */
arch/metag/kernel/metag_ksyms.c:EXPORT_SYMBOL(min_low_pfn);
mm/bootmem.c:EXPORT_SYMBOL(min_low_pfn);


Can you do this in the same branch as the mips change so the bits
will flow to Linus together in the next window?

ia64 change (which gmail will no doubt mangle)

From: "Luck, Tony" <tony.luck@intel.com>

min_low_pfn is now exported by generic code

Signed-off-by: Tony Luck <tony.luck@intel.com>

---

diff --git a/arch/ia64/kernel/ia64_ksyms.c b/arch/ia64/kernel/ia64_ksyms.c
index 5b7791d..ca95c8b 100644
--- a/arch/ia64/kernel/ia64_ksyms.c
+++ b/arch/ia64/kernel/ia64_ksyms.c
@@ -25,7 +25,6 @@ EXPORT_SYMBOL(copy_page);

 #ifdef CONFIG_VIRTUAL_MEM_MAP
 #include <linux/bootmem.h>
-EXPORT_SYMBOL(min_low_pfn);    /* defined by bootmem.c, but not
exported by generic code */
 EXPORT_SYMBOL(max_low_pfn);    /* defined by bootmem.c, but not
exported by generic code */
 #endif
