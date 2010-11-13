From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix iio/gyro typos, build errors
Date: Sat, 13 Nov 2010 08:44:35 -0800
Message-ID: <20101113084435.3850deb6.randy.dunlap@oracle.com>
References: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Sender: devel-bounces@linuxdriverproject.org
Errors-To: devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, driverdevel <devel@driverdev.osuosl.org>
Cc: akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Typo causes build errors.  Did anyone even build this driver?

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/iio/gyro/adis16251.h |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Also has section mismatch warnings:

WARNING: drivers/staging/built-in.o(.data+0xe9b8): Section mismatch in reference from the variable spi_adis16255_drv to the function .devinit.text:spi_adis16255_probe()
The variable spi_adis16255_drv references
the function __devinit spi_adis16255_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console, 

WARNING: drivers/staging/built-in.o(.data+0xe9c0): Section mismatch in reference from the variable spi_adis16255_drv to the function .devexit.text:spi_adis16255_remove()
The variable spi_adis16255_drv references
the function __devexit spi_adis16255_remove()
If the reference is valid then annotate the
variable with __exit* (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,


--- linux-next-20101112.orig/drivers/staging/iio/gyro/adis16251.h
+++ linux-next-20101112/drivers/staging/iio/gyro/adis16251.h
@@ -56,14 +56,14 @@
 #define ADIS16251_DIAG_STAT_POWER_HIGH	(1<<1)
 #define ADIS16251_DIAG_STAT_POWER_LOW	(1<<0)
 
-#define ADIS16251_DIAG_STAT_ERR_MASK (ADIS16261_DIAG_STAT_ALARM2 | \
-				      ADIS16261_DIAG_STAT_ALARM1 | \
-				      ADIS16261_DIAG_STAT_SELF_TEST | \
-				      ADIS16261_DIAG_STAT_OVERFLOW | \
-				      ADIS16261_DIAG_STAT_SPI_FAIL | \
-				      ADIS16261_DIAG_STAT_FLASH_UPT | \
-				      ADIS16261_DIAG_STAT_POWER_HIGH | \
-				      ADIS16261_DIAG_STAT_POWER_LOW)
+#define ADIS16251_DIAG_STAT_ERR_MASK (ADIS16251_DIAG_STAT_ALARM2 | \
+				      ADIS16251_DIAG_STAT_ALARM1 | \
+				      ADIS16251_DIAG_STAT_SELF_TEST | \
+				      ADIS16251_DIAG_STAT_OVERFLOW | \
+				      ADIS16251_DIAG_STAT_SPI_FAIL | \
+				      ADIS16251_DIAG_STAT_FLASH_UPT | \
+				      ADIS16251_DIAG_STAT_POWER_HIGH | \
+				      ADIS16251_DIAG_STAT_POWER_LOW)
 
 /* GLOB_CMD */
 #define ADIS16251_GLOB_CMD_SW_RESET	(1<<7)
