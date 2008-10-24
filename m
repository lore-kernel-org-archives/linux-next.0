From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] PCI hotplug printk format
Date: Thu, 23 Oct 2008 18:14:55 -0700
Message-ID: <20081023181455.336e5d03.randy.dunlap@oracle.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

I made this patch for linux-next, but now mainline has this same code/warning.


From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning:

linux-next-20081023/drivers/pci/hotplug/acpiphp_ibm.c:207: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'long long unsigned int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/pci/hotplug/acpiphp_ibm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20081023.orig/drivers/pci/hotplug/acpiphp_ibm.c
+++ linux-next-20081023/drivers/pci/hotplug/acpiphp_ibm.c
@@ -204,7 +204,7 @@ static int ibm_set_attention_status(stru
 		err("APLS evaluation failed:  0x%08x\n", stat);
 		return -ENODEV;
 	} else if (!rc) {
-		err("APLS method failed:  0x%08lx\n", rc);
+		err("APLS method failed:  0x%08llx\n", rc);
 		return -ERANGE;
 	}
 	return 0;
