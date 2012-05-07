From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] powerpc: fix compile fail in hugetlb cmdline parsing
Date: Mon,  7 May 2012 10:32:22 -0400
Message-ID: <1336401142-18733-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:46810 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756099Ab2EGOcu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 10:32:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Rusty Russell <rusty@rustcorp.com.au>, Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Becky Bruce <beckyb@kernel.crashing.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

Commit 9fb48c744ba6a4bf58b666f4e6fdac3008ea1bd4

    "params: add 3rd arg to option handler callback signature"

added an extra arg to the function, but didn't catch all the use
cases needing it, causing this compile fail in mpc85xx_defconfig:

 arch/powerpc/mm/hugetlbpage.c:316:4: error: passing argument 7 of
 'parse_args' from incompatible pointer type [-Werror]

 include/linux/moduleparam.h:317:12: note: expected
	 'int (*)(char *, char *, const char *)' but argument is of type
	 'int (*)(char *, char *)'

This function has no need to printk out the "doing" value, so
just add the arg as an "unused".

Cc: Rusty Russell <rusty@rustcorp.com.au>
Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Jason Baron <jbaron@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Becky Bruce <beckyb@kernel.crashing.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index fb05b12..1a6de0a 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -271,7 +271,8 @@ int alloc_bootmem_huge_page(struct hstate *hstate)
 
 unsigned long gpage_npages[MMU_PAGE_COUNT];
 
-static int __init do_gpage_early_setup(char *param, char *val)
+static int __init do_gpage_early_setup(char *param, char *val,
+				       const char *unused)
 {
 	static phys_addr_t size;
 	unsigned long npages;
-- 
1.7.9.1
