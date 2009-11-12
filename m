From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i7core_edac tree build failure
Date: Thu, 12 Nov 2009 16:58:52 +1100
Message-ID: <20091112165852.855d1e5d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39217 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751357AbZKLF6t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 00:58:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aristeu Rozanski <aris@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

tmp_exports-asm.o: In function `__ksymtab_pci_legacy_init':
(__ksymtab_gpl_sorted+0x3120): undefined reference to `pci_legacy_init'

Caused by commit a120a84ebbc4cbc9c1addddd2b491e3683b842a6 ("pci: Add a
probing code that seeks for an specific bus") (which applies
EXPORT_SYMBOL_GPL() to a static function) interacting with the rr tree's
changes.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Nov 2009 16:55:38 +1100
Subject: [PATCH] i7core_edac: do not export static functions

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/pci/legacy.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/x86/pci/legacy.c b/arch/x86/pci/legacy.c
index 5e22d83..a8194c8 100644
--- a/arch/x86/pci/legacy.c
+++ b/arch/x86/pci/legacy.c
@@ -38,7 +38,6 @@ static int __init pci_legacy_init(void)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pci_legacy_init);
 
 void pcibios_scan_specific_bus(int busn)
 {
-- 
1.6.5.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
