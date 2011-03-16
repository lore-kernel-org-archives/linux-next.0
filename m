From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb: fix ips1760-hcd printk format warning
Date: Tue, 15 Mar 2011 17:09:10 -0700
Message-ID: <20110315170910.9b6f1c58.randy.dunlap@oracle.com>
References: <20110315194543.a5d56c0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110315194543.a5d56c0c.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sebastian Siewior <bigeasy@linutronix.de>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format build warning and grammar typo on same line.

drivers/usb/host/isp1760-hcd.c:300: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/host/isp1760-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110315.orig/drivers/usb/host/isp1760-hcd.c
+++ linux-next-20110315/drivers/usb/host/isp1760-hcd.c
@@ -295,7 +295,7 @@ static void alloc_mem(struct usb_hcd *hc
 	}
 
 	dev_err(hcd->self.controller,
-				"%s: Can not allocate %lu bytes of memory\n"
+				"%s: Cannot allocate %zu bytes of memory\n"
 				"Current memory map:\n",
 				__func__, qtd->length);
 	for (i = 0; i < BLOCKS; i++) {
