From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH] xen PVonHVM: fix compile warning in init_hvm_pv_info
Date: Thu, 29 Nov 2012 15:32:26 +0100
Message-ID: <1354199546-25229-1-git-send-email-olaf@aepfle.de>
References: <20121129142530.37630048cd37048f884b17e9@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mo-p00-ob.rzone.de ([81.169.146.160]:56879 "EHLO
	mo-p00-ob.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165Ab2K2Ocy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Nov 2012 09:32:54 -0500
In-Reply-To: <20121129142530.37630048cd37048f884b17e9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, konrad.wilk@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Olaf Hering <olaf@aepfle.de>

After merging the xen-two tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

arch/x86/xen/enlighten.c: In function 'init_hvm_pv_info':
arch/x86/xen/enlighten.c:1617:16: warning: unused variable 'ebx' [-Wunused-variable]
arch/x86/xen/enlighten.c:1617:11: warning: unused variable 'eax' [-Wunused-variable]

Introduced by commit 9d02b43dee0d ("xen PVonHVM: use E820_Reserved area
for shared_info").

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 arch/x86/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index a90c3bb..46156f5 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -1557,7 +1557,7 @@ static void __init xen_hvm_init_shared_info(void)
 
 static void __init init_hvm_pv_info(void)
 {
-	uint32_t eax, ebx, ecx, edx, pages, msr, base;
+	uint32_t ecx, edx, pages, msr, base;
 	u64 pfn;
 
 	base = xen_cpuid_base();
-- 
1.8.0
