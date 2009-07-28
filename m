From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usbtmc: fix printk format warnings
Date: Tue, 28 Jul 2009 11:22:41 -0700
Message-ID: <20090728112241.b32a684b.randy.dunlap@oracle.com>
References: <20090728174224.647cc3ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755431AbZG1SXM@vger.kernel.org>
In-Reply-To: <20090728174224.647cc3ba.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>, gregkh <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings:
drivers/usb/class/usbtmc.c:466: warning: format '%zu' expects type 'size_t', but argument 4 has type 'u32'
drivers/usb/class/usbtmc.c:466: warning: format '%zu' expects type 'size_t', but argument 5 has type 'int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/class/usbtmc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090728.orig/drivers/usb/class/usbtmc.c
+++ linux-next-20090728/drivers/usb/class/usbtmc.c
@@ -463,7 +463,7 @@ static ssize_t usbtmc_read(struct file *
 
 		/* Ensure the instrument doesn't lie about it */
 		if(n_characters > actual - 12) {
-			dev_err(dev, "Device lies about message size: %zu > %zu\n", n_characters, actual - 12);
+			dev_err(dev, "Device lies about message size: %u > %d\n", n_characters, actual - 12);
 			n_characters = actual - 12;
 		}
 



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
