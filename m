From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] x86_32: fix printk formats
Date: Thu, 12 Feb 2009 10:43:04 -0800
Message-ID: <49946DB8.9030801@oracle.com>
References: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:23345 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756076AbZBLSnG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Feb 2009 13:43:06 -0500
In-Reply-To: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings and also change 2 %ld to %lu for unsigned long
variables.

arch/x86/mm/init_32.c:727: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
arch/x86/mm/init_32.c:735: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'long unsigned int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/mm/init_32.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20090212.orig/arch/x86/mm/init_32.c
+++ linux-next-20090212/arch/x86/mm/init_32.c
@@ -721,7 +721,7 @@ void __init find_low_pfn_range(void)
 			highmem_pages = 0;
 #ifdef CONFIG_HIGHMEM
 		if (highmem_pages >= max_pfn) {
-			printk(KERN_ERR "highmem size specified (%uMB) is "
+			printk(KERN_ERR "highmem size specified (%luMB) is "
 				"bigger than pages available (%luMB)!.\n",
 				pages_to_mb(highmem_pages),
 				pages_to_mb(max_pfn));
@@ -730,7 +730,7 @@ void __init find_low_pfn_range(void)
 		if (highmem_pages) {
 			if (max_low_pfn - highmem_pages <
 			    64*1024*1024/PAGE_SIZE){
-				printk(KERN_ERR "highmem size %uMB results in "
+				printk(KERN_ERR "highmem size %luMB results in "
 				"smaller than 64MB lowmem, ignoring it.\n"
 					, pages_to_mb(highmem_pages));
 				highmem_pages = 0;
@@ -755,7 +755,7 @@ void __init initmem_init(unsigned long s
 		highstart_pfn = max_low_pfn;
 	memory_present(0, 0, highend_pfn);
 	e820_register_active_regions(0, 0, highend_pfn);
-	printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
+	printk(KERN_NOTICE "%luMB HIGHMEM available.\n",
 		pages_to_mb(highend_pfn - highstart_pfn));
 	num_physpages = highend_pfn;
 	high_memory = (void *) __va(highstart_pfn * PAGE_SIZE - 1) + 1;
@@ -768,7 +768,7 @@ void __init initmem_init(unsigned long s
 #ifdef CONFIG_FLATMEM
 	max_mapnr = num_physpages;
 #endif
-	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
+	printk(KERN_NOTICE "%luMB LOWMEM available.\n",
 			pages_to_mb(max_low_pfn));
 
 	setup_bootmem_allocator();
