From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: [PATCH] Staging: IIO: add selection of IIO_SW_RING to LIS3L02DQ as
 needed
Date: Mon, 07 Dec 2009 15:19:17 +0000
Message-ID: <4B1D1CF5.6030502@cam.ac.uk>
References: <20091204203014.e8ee54ca.sfr@canb.auug.org.au> <20091206101225.7d8ce4a4.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-6.csi.cam.ac.uk ([131.111.8.136]:35397 "EHLO
	ppsw-6.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932683AbZLGPS0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2009 10:18:26 -0500
In-Reply-To: <20091206101225.7d8ce4a4.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
---

 Thanks to Randy for the report. Sorry for the slow response.
 I've been meaning to carefully check for any remaining cases like
 this.
 Here I've kept the selection of IIO_SW_RING separate from
 IIO_TRIGGER as it will go away fairly shortly when the ring buffer
 type becomes configurable on a per device basis, whereas the
 IIO_TRIGGER select will remain. Whether to retain the option to
 remove the support for ring buffers entirely is one for after that
 support is in place.

 Touch wood I think this is the last one, but I'll try a selection of
 unusual combinations now and post others as replies to this email.

 drivers/staging/iio/accel/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/iio/accel/Kconfig b/drivers/staging/iio/accel/Kconfig
index 4044663..3d3c333 100644
--- a/drivers/staging/iio/accel/Kconfig
+++ b/drivers/staging/iio/accel/Kconfig
@@ -14,6 +14,7 @@ config LIS3L02DQ
 	tristate "ST Microelectronics LIS3L02DQ Accelerometer Driver"
 	depends on SPI
 	select IIO_TRIGGER if IIO_RING_BUFFER
+	select IIO_SW_RING if IIO_RING_BUFFER
 	help
 	  Say yes here to build SPI support for the ST microelectronics
 	  accelerometer. The driver supplies direct access via sysfs files
-- 
1.6.4.4
