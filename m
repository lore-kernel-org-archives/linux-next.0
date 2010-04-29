From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] memrar: fix printk format warning
Date: Thu, 29 Apr 2010 10:46:32 -0700
Message-ID: <20100429104632.8558f75c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Cc: devel@driverdev.osuosl.org, gregkh@suse.de, Ossama Othman <ossama.othman@intel.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning in memrar:
drivers/staging/memrar/memrar_handler.c:393: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Ossama Othman <ossama.othman@intel.com>
---
 drivers/staging/memrar/memrar_handler.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100429.orig/drivers/staging/memrar/memrar_handler.c
+++ linux-next-20100429/drivers/staging/memrar/memrar_handler.c
@@ -390,7 +390,7 @@ static int memrar_init_rar_resources(cha
 			(unsigned long) low,
 			(unsigned long) high);
 
-		pr_info("%s: BRAR[%d] size = %u KiB\n",
+		pr_info("%s: BRAR[%d] size = %zu KiB\n",
 			devname,
 			z,
 			rar->allocator->capacity / 1024);
