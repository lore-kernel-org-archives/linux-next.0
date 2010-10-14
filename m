From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] x86: olpc-xo1 uses/depends on PCI
Date: Thu, 14 Oct 2010 10:13:13 -0700
Message-ID: <20101014101313.adf7eb2a.randy.dunlap@oracle.com>
References: <20101014152642.ef280a33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:46278 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755566Ab0JNROi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2010 13:14:38 -0400
In-Reply-To: <20101014152642.ef280a33.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Drake <dsd@laptop.org>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

olpc-xo1 uses pci_*() interfaces so it should depend on PCI.

arch/x86/kernel/olpc-xo1.c:65: error: implicit declaration of function 'pci_enable_device_io'
arch/x86/kernel/olpc-xo1.c:71: error: implicit declaration of function 'pci_request_region'
arch/x86/kernel/olpc-xo1.c:80: error: implicit declaration of function 'pci_release_region'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Daniel Drake <dsd@laptop.org>
---
 arch/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20101014.orig/arch/x86/Kconfig
+++ linux-next-20101014/arch/x86/Kconfig
@@ -2018,7 +2018,7 @@ config OLPC
 
 config OLPC_XO1
 	tristate "OLPC XO-1 support"
-	depends on OLPC
+	depends on OLPC && PCI
 	---help---
 	  Add support for non-essential features of the OLPC XO-1 laptop.
 
