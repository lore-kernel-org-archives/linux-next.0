From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] pci-sysfs: fix printk warnings
Date: Sat, 13 Nov 2010 08:44:33 -0800
Message-ID: <20101113084433.67a92e8f.randy.dunlap@oracle.com>
References: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-pci@vger.kernel.org, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Cast pci_resource_start() and pci_resource_len() to u64 for printk.

drivers/pci/pci-sysfs.c:753: warning: format '%16Lx' expects type 'long long unsigned int', but argument 9 has type 'resource_size_t'
drivers/pci/pci-sysfs.c:753: warning: format '%16Lx' expects type 'long long unsigned int', but argument 10 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/pci/pci-sysfs.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20101112.orig/drivers/pci/pci-sysfs.c
+++ linux-next-20101112/drivers/pci/pci-sysfs.c
@@ -754,7 +754,8 @@ pci_mmap_resource(struct kobject *kobj, 
 			"at page 0x%08lx on %s BAR %d (start 0x%16Lx, size 0x%16Lx)\n",
 			current->comm, vma->vm_end-vma->vm_start, vma->vm_pgoff,
 			pci_name(pdev), i,
-			pci_resource_start(pdev, i), pci_resource_len(pdev, i));
+			(u64)pci_resource_start(pdev, i),
+			(u64)pci_resource_len(pdev, i));
 		return -EINVAL;
 	}
 
