From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] k8.h: add struct bootnode
Date: Wed, 28 Oct 2009 16:09:55 -0700
Message-ID: <20091028160955.d27ccb16.randy.dunlap@oracle.com>
References: <20091028190643.627f10aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:26443 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752094AbZJ1XOs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2009 19:14:48 -0400
In-Reply-To: <20091028190643.627f10aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

k8.h uses struct bootnode but does not #include a header file
for it, so provide a simple declaration for it.

arch/x86/include/asm/k8.h:13: warning: 'struct bootnode' declared inside parameter list
arch/x86/include/asm/k8.h:13: warning: its scope is only this definition or declaration, which is probably not what you want

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/include/asm/k8.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20091028.orig/arch/x86/include/asm/k8.h
+++ linux-next-20091028/arch/x86/include/asm/k8.h
@@ -4,6 +4,7 @@
 #include <linux/pci.h>
 
 extern struct pci_device_id k8_nb_ids[];
+struct bootnode;
 
 extern int early_is_k8_nb(u32 value);
 extern struct pci_dev **k8_northbridges;
