From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] x86: fix build error when CONFIG_K8_NB=n
Date: Thu, 02 Apr 2009 08:29:41 -0700
Message-ID: <49D4D9E5.2060705@oracle.com>
References: <20090402170432.9bc4fbf8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:48801 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbZDBPbD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2009 11:31:03 -0400
In-Reply-To: <20090402170432.9bc4fbf8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build error when CONFIG_K8_NB=n:

arch/x86/mm/built-in.o:(.bss+0x5c0): multiple definition of `k8_northbridges'
arch/x86/kernel/built-in.o:(.bss+0x18c8): first defined here

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/include/asm/k8.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090402.orig/arch/x86/include/asm/k8.h
+++ linux-next-20090402/arch/x86/include/asm/k8.h
@@ -9,7 +9,7 @@ extern int early_is_k8_nb(u32 value);
 #ifdef CONFIG_K8_NB
 extern struct pci_dev **k8_northbridges;
 #else
-struct pci_dev **k8_northbridges;
+static struct pci_dev **k8_northbridges;
 #endif
 extern int num_k8_northbridges;
 extern int cache_k8_northbridges(void);
