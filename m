From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] i2c: fix xiic build error
Date: Thu, 04 Feb 2010 12:11:09 -0800
Message-ID: <4B6B29DD.7060502@oracle.com>
References: <20100204185736.6628ab9a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100204185736.6628ab9a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, khali@linux-fr.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Add header file to fix build error:

drivers/i2c/busses/i2c-xiic.c:493: error: implicit declaration of function 'mdelay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
  drivers/i2c/busses/i2c-xiic.c |    1 +
  1 file changed, 1 insertion(+)

--- linux-next-20100204.orig/drivers/i2c/busses/i2c-xiic.c
+++ linux-next-20100204/drivers/i2c/busses/i2c-xiic.c
@@ -31,6 +31,7 @@
  #include <linux/module.h>
  #include <linux/init.h>
  #include <linux/errno.h>
+#include <linux/delay.h>
  #include <linux/platform_device.h>
  #include <linux/i2c.h>
  #include <linux/interrupt.h>
