From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Sat, 15 Jan 2011 10:40:04 +1100
Message-ID: <20110115104004.64335bc5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41560 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752536Ab1ANXkI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Jan 2011 18:40:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

Hi all,

While building Linus' tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "arbitrary_virt_to_machine" [drivers/xen/xen-gntdev.ko] undefined!

Caused by commit ba5d1012292403c8037adf4a54c4ec50dfe846c4 ("xen/gntdev:
stop using "token" argument").

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 15 Jan 2011 10:36:26 +1100
Subject: [PATCH] xen: export arbitrary_virt_to_machine

fixes build error:

ERROR: "arbitrary_virt_to_machine" [drivers/xen/xen-gntdev.ko] undefined!

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/xen/mmu.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/xen/mmu.c b/arch/x86/xen/mmu.c
index 7575e55..5e92b61 100644
--- a/arch/x86/xen/mmu.c
+++ b/arch/x86/xen/mmu.c
@@ -201,6 +201,7 @@ xmaddr_t arbitrary_virt_to_machine(void *vaddr)
 	offset = address & ~PAGE_MASK;
 	return XMADDR(((phys_addr_t)pte_mfn(*pte) << PAGE_SHIFT) + offset);
 }
+EXPORT_SYMBOL_GPL(arbitrary_virt_to_machine);
 
 void make_lowmem_page_readonly(void *vaddr)
 {
-- 
1.7.2.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
