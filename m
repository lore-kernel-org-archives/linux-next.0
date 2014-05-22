From: Sebastian Ott <sebott@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Thu, 22 May 2014 08:49:21 +0200 (CEST)
Message-ID: <alpine.LFD.2.11.1405220845150.1594@denkbrett>
References: <20140522140916.1a5f3801@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:60756 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750984AbaEVGt1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 May 2014 02:49:27 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <sebott@linux.vnet.ibm.com>;
	Thu, 22 May 2014 07:49:25 +0100
In-Reply-To: <20140522140916.1a5f3801@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Thu, 22 May 2014, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> After merging the pci tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/pci/pci-sysfs.c: In function 'devspec_show':
> drivers/pci/pci-sysfs.c:426:22: error: dereferencing pointer to incomplete type
> drivers/pci/pci-sysfs.c:428:30: error: dereferencing pointer to incomplete type
> drivers/pci/pci-sysfs.c:429:1: warning: control reaches end of non-void function [-Wreturn-type]
> 
> Caused by commit da647bb30834 ("PCI: Move Open Firmware devspec
> attribute to PCI common code").  Presumably a forgotten include.
> 
> I have used the pci tree from next-20140521 for today.

Oops, sry for that one - this should fix it:

pci: fix compile failure on arm

Fix this compile error introduced by "PCI: Move Open Firmware
devspec attribute to PCI common code":

drivers/pci/pci-sysfs.c: In function 'devspec_show':
drivers/pci/pci-sysfs.c:426:22: error: dereferencing pointer to incomplete type
drivers/pci/pci-sysfs.c:428:30: error: dereferencing pointer to incomplete type
drivers/pci/pci-sysfs.c:429:1: warning: control reaches end of non-void function [-Wreturn-type]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sebastian Ott <sebott@linux.vnet.ibm.com>
---
 drivers/pci/pci-sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 4e0acef..d6e61ae 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/vgaarb.h>
 #include <linux/pm_runtime.h>
+#include <linux/of.h>
 #include "pci.h"
 
 static int sysfs_initialized;	/* = 0 */
-- 
1.8.5.5
