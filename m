From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 14 May 2015 20:39:54 +0530
Message-ID: <878ucr42m5.fsf@linux.vnet.ibm.com>
References: <20150514182114.73d2ae1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:35756 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932679AbbENPKC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2015 11:10:02 -0400
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Thu, 14 May 2015 20:39:59 +0530
In-Reply-To: <20150514182114.73d2ae1c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (sparc
> defconfig) failed like this:
>
> In file included from arch/sparc/include/asm/pgtable_32.h:437:0,
>                  from arch/sparc/include/asm/pgtable.h:6,
>                  from include/linux/mm.h:53,
>                  from include/linux/ring_buffer.h:5,
>                  from include/linux/ftrace_event.h:5,
>                  from include/trace/syscall.h:6,
>                  from include/linux/syscalls.h:81,
>                  from init/initramfs.c:19:
> include/asm-generic/pgtable.h: In function 'pmdp_collapse_flush':
> include/asm-generic/pgtable.h:211:2: error: implicit declaration of function '__pmd' [-Werror=implicit-function-declaration]
>   return __pmd(0);
>   ^
> include/asm-generic/pgtable.h:211:2: error: incompatible types when returning type 'int' but 'pmd_t' was expected
>
> Caused by commit b0593c13d7f6 ("mm/thp: split out pmd collapse/flush
> into separate functions").
>
> sparc 32 has no __pmd().  I applied this temporary fix for today just
> to get it building:


The change in question is

diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 39f1d6a2b04d..9e200e55a52b 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -189,6 +189,26 @@ extern void pmdp_splitting_flush(struct vm_area_struct *vma,
 				 unsigned long address, pmd_t *pmdp);
 #endif
 
+#ifndef pmdp_collapse_flush
+#define pmdp_collapse_flush pmdp_collapse_flush
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
+					unsigned long address,
+					pmd_t *pmdp)
+{
+	return pmdp_clear_flush(vma, address, pmdp);
+}
+#else
+static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
+					unsigned long address,
+					pmd_t *pmdp)
+{
+	BUILD_BUG();
+	return __pmd(0);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+#endif
+
 #ifndef __HAVE_ARCH_PGTABLE_DEPOSIT
 extern void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 				       pgtable_t pgtable);


This also introduced warnings for frv and m68k.  May be we should drop
the #else part and let the build fail during linking ? ie, do

+#ifndef pmdp_collapse_flush
+#define pmdp_collapse_flush pmdp_collapse_flush
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
+					unsigned long address,
+					pmd_t *pmdp)
+{
+	return pmdp_clear_flush(vma, address, pmdp);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+#endif


-aneesh
