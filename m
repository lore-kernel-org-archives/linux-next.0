From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86 tree build failure
Date: Fri, 12 Sep 2008 09:56:18 +1000
Message-ID: <20080912095618.728658a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38584 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754393AbYIKX4a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Sep 2008 19:56:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/k8.c:20: error: 'PCI_DEVICE_ID_AMD_10H_NB_MISC' undeclared here (not in a function)

Introduced by commit cf169702ba6928cee9d4f4adf3e932b643b8db7a ("x86,
gart: add detection of AMD family 0x11 northbridges").  I applied the
following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Sep 2008 09:52:19 +1000
Subject: [PATCH] x86: fix arch/x86/kernel/k8.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/k8.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/k8.c b/arch/x86/kernel/k8.c
index 304d8ba..3f5b832 100644
--- a/arch/x86/kernel/k8.c
+++ b/arch/x86/kernel/k8.c
@@ -17,7 +17,7 @@ static u32 *flush_words;
 
 struct pci_device_id k8_nb_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_K8_NB_MISC) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_10H_NB_MISC) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x1203) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_11H_NB_MISC) },
 	{}
 };
-- 
1.5.6.3
