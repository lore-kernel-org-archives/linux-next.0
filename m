From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] staging:iio:ad7298: Fix linker error due to missing IIO kfifo
 buffer
Date: Mon, 11 Jun 2012 15:09:21 +0200
Message-ID: <1339420161-23760-1-git-send-email-lars@metafoo.de>
References: <4FD23340.70108@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <4FD23340.70108@xenotime.net>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>
List-Id: linux-next.vger.kernel.org

The ad7298 drivers buffer implementation uses the IIO kfifo buffer, so it needs
to select IIO_KFIFO_BUF. Otherwise (if no other driver selects the symbol) the
following linker error will occur:

drivers/built-in.o: In function `ad7298_register_ring_funcs_and_init':
	(.text+0x245cf2): undefined reference to `iio_kfifo_allocate'
drivers/built-in.o: In function `ad7298_register_ring_funcs_and_init':
	(.text+0x245d7d): undefined reference to `iio_kfifo_free'
drivers/built-in.o: In function `ad7298_ring_cleanup':
	(.text+0x245dcd): undefined reference to `iio_kfifo_free'

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Reported-by: Randy Dunlap <rdunlap@xenotime.net>

---
The patch is only required for 3.5-rc1+. Versions prior to 3.5-rc1 require a
different patch (IIO_SW_RING instead of IIO_KFIFO_BUF) which I'll send to stable
once this patch is in Linus' tree.
---
 drivers/staging/iio/adc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/iio/adc/Kconfig b/drivers/staging/iio/adc/Kconfig
index 2490dd2..8f1b3af 100644
--- a/drivers/staging/iio/adc/Kconfig
+++ b/drivers/staging/iio/adc/Kconfig
@@ -13,6 +13,7 @@ config AD7291
 config AD7298
 	tristate "Analog Devices AD7298 ADC driver"
 	depends on SPI
+	select IIO_KFIFO_BUF if IIO_BUFFER
 	help
 	  Say yes here to build support for Analog Devices AD7298
 	  8 Channel ADC with temperature sensor.
-- 
1.7.10
