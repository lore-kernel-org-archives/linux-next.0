From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next]  i2c: uses/select RT_MUTEXES
Date: Fri, 25 Sep 2009 15:20:03 -0700
Message-ID: <4ABD4213.9010700@oracle.com>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753132AbZIYWT4@vger.kernel.org>
In-Reply-To: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>, "Jean Delvare (PC drivers, core)" <khali@linux-fr.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

i2c-core uses rt mutexes, so it needs to select that
kconfig symbol since there is no prompt for it.

ERROR: "rt_mutex_lock" [drivers/i2c/i2c-core.ko] undefined!
ERROR: "__rt_mutex_init" [drivers/i2c/i2c-core.ko] undefined!
ERROR: "rt_mutex_trylock" [drivers/i2c/i2c-core.ko] undefined!
ERROR: "rt_mutex_unlock" [drivers/i2c/i2c-core.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/i2c/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090925.orig/drivers/i2c/Kconfig
+++ linux-next-20090925/drivers/i2c/Kconfig
@@ -5,6 +5,7 @@
 menuconfig I2C
 	tristate "I2C support"
 	depends on HAS_IOMEM
+	select RT_MUTEXES
 	---help---
 	  I2C (pronounce: I-square-C) is a slow serial bus protocol used in
 	  many micro controller applications and developed by Philips.  SMBus,
