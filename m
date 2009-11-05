From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] staging: iio: Fix up the module build.
Date: Thu, 5 Nov 2009 15:09:00 +0900
Message-ID: <20091105060900.GD26910@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:60224 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944AbZKEGJR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2009 01:09:17 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org

Both the max1363 and lis3l02dq modules rely on IIO trigger support in
their ring buffer implementations, which is presently a separate config
option. In the case of IIO_RING_BUFFER=y and IIO_TRIGGER=n, we end up
with the following:

ERROR: "iio_trigger_attach_poll_func" [drivers/staging/iio/adc/max1363.ko] undefined!
ERROR: "iio_trigger_dettach_poll_func" [drivers/staging/iio/adc/max1363.ko] undefined!
ERROR: "iio_trigger_unregister" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_trigger_notify_done" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_trigger_read_name" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_trigger_poll" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_trigger_attach_poll_func" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_trigger_register" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_free_trigger" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_trigger_dettach_poll_func" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
ERROR: "iio_allocate_trigger" [drivers/staging/iio/accel/lis3l02dq.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

This adds an IIO_TRIGGER select for these two drivers conditional on
IIO ring buffer support. Caught with an SH randconfig in -next.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 drivers/staging/iio/accel/Kconfig |    1 +
 drivers/staging/iio/adc/Kconfig   |    1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/iio/accel/Kconfig b/drivers/staging/iio/accel/Kconfig
index fef3da4..c245644 100644
--- a/drivers/staging/iio/accel/Kconfig
+++ b/drivers/staging/iio/accel/Kconfig
@@ -13,6 +13,7 @@ config KXSD9
 config LIS3L02DQ
 	tristate "ST Microelectronics LIS3L02DQ Accelerometer Driver"
 	depends on SPI
+	select IIO_TRIGGER if IIO_RING_BUFFER
 	help
 	  Say yes here to build SPI support for the ST microelectronics
 	  accelerometer. The driver supplies direct access via sysfs files
diff --git a/drivers/staging/iio/adc/Kconfig b/drivers/staging/iio/adc/Kconfig
index b8c2858..a2f1626 100644
--- a/drivers/staging/iio/adc/Kconfig
+++ b/drivers/staging/iio/adc/Kconfig
@@ -6,6 +6,7 @@ comment "Analog to digital convertors"
 config MAX1363
 	tristate "MAXIM max1363 ADC driver"
 	depends on I2C
+	select IIO_TRIGGER if IIO_RING_BUFFER
 	help
 	  Say yes here to build support for many MAXIM i2c analog to digital
 	  convertors (ADC). (max1361, max1362, max1363, max1364, max1136,
