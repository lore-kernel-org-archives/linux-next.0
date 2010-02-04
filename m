From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] pci hotplug: fix ibmphp build error
Date: Thu, 04 Feb 2010 12:12:23 -0800
Message-ID: <4B6B2A27.9070600@oracle.com>
References: <20100204185736.6628ab9a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20100204185736.6628ab9a.sfr@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Add header file to fix build error:

drivers/pci/hotplug/ibmphp_hpc.c:135: error: implicit declaration of function 'init_MUTEX'
drivers/pci/hotplug/ibmphp_hpc.c:136: error: implicit declaration of function 'init_MUTEX_LOCKED'
drivers/pci/hotplug/ibmphp_hpc.c:797: error: implicit declaration of function 'down'
drivers/pci/hotplug/ibmphp_hpc.c:807: error: implicit declaration of function 'up'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
  drivers/pci/hotplug/ibmphp_hpc.c |    1 +
  1 file changed, 1 insertion(+)

--- linux-next-20100204.orig/drivers/pci/hotplug/ibmphp_hpc.c
+++ linux-next-20100204/drivers/pci/hotplug/ibmphp_hpc.c
@@ -35,6 +35,7 @@
  #include <linux/init.h>
  #include <linux/mutex.h>
  #include <linux/sched.h>
+#include <linux/semaphore.h>
  #include <linux/kthread.h>
  #include "ibmphp.h"
  
