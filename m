From: <michael.hennerich@analog.com>
Subject: [PATCH] staging: iio: ad7476: fix !CONFIG_IIO_RING_BUFFER build issue reported by Randy Dunlap
Date: Thu, 14 Oct 2010 10:17:18 +0200
Message-ID: <1287044238-20220-1-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nwd2mail11.analog.com ([137.71.25.57]:13625 "EHLO
	nwd2mail11.analog.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754945Ab0JNIYD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2010 04:24:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com
Cc: linux-iio@vger.kernel.org, drivers@analog.com, jic23@cam.ac.uk, device-drivers-devel@blackfin.uclinux.org, randy.dunlap@oracle.com, devel@driverdev.osuosl.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>

From: Michael Hennerich <michael.hennerich@analog.com>

Fix function function decalration
Enable CONFIG_IIO_RING_BUFFER for the ad7476 driver

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/staging/iio/adc/Kconfig  |    3 +++
 drivers/staging/iio/adc/ad7476.h |    4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/Kconfig b/drivers/staging/iio/adc/Kconfig
index 81a7d45..acb6767 100644
--- a/drivers/staging/iio/adc/Kconfig
+++ b/drivers/staging/iio/adc/Kconfig
@@ -50,6 +50,9 @@ config AD799X_RING_BUFFER
 config AD7476
 	tristate "Analog Devices AD7475/6/7/8 AD7466/7/8 and AD7495 ADC driver"
 	depends on SPI
+	select IIO_RING_BUFFER	
+	select IIO_SW_RING
+	select IIO_TRIGGER 	
 	help
 	  Say yes here to build support for Analog Devices
 	  AD7475, AD7476, AD7477, AD7478, AD7466, AD7467, AD7468, AD7495
diff --git a/drivers/staging/iio/adc/ad7476.h b/drivers/staging/iio/adc/ad7476.h
index 6e4a85b..b51b49e 100644
--- a/drivers/staging/iio/adc/ad7476.h
+++ b/drivers/staging/iio/adc/ad7476.h
@@ -59,9 +59,7 @@ int ad7476_scan_from_ring(struct ad7476_state *st);
 int ad7476_register_ring_funcs_and_init(struct iio_dev *indio_dev);
 void ad7476_ring_cleanup(struct iio_dev *indio_dev);
 #else /* CONFIG_IIO_RING_BUFFER */
-static inline ssize_t ad7476_scan_from_ring(struct device *dev,
-					     struct device_attribute *attr,
-					     char *buf)
+static inline int ad7476_scan_from_ring(struct ad7476_state *st)
 {
 	return 0;
 }
-- 
1.6.0.2
