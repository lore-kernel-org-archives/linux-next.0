From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the spi tree
Date: Mon, 2 Nov 2015 00:41:49 +1100
Message-ID: <20151102004149.7e1b6072@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/iio/adc/max1027.c
  drivers/iio/adc/mcp320x.c
  drivers/iio/adc/ti-adc128s052.c
  drivers/iio/dac/ad7303.c
  drivers/iio/frequency/adf4350.c
  drivers/iio/proximity/as3935.c

between commit:

  3821a065f567 ("spi: Drop owner assignment from spi_drivers")

from the spi tree and various commits from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/iio/adc/max1027.c
index 3bc059c69824,54a8302aaace..000000000000
--- a/drivers/iio/adc/max1027.c
+++ b/drivers/iio/adc/max1027.c
@@@ -508,6 -508,8 +508,7 @@@ static int max1027_remove(struct spi_de
  static struct spi_driver max1027_driver = {
  	.driver = {
  		.name	= "max1027",
+ 		.of_match_table = of_match_ptr(max1027_adc_dt_ids),
 -		.owner	= THIS_MODULE,
  	},
  	.probe		= max1027_probe,
  	.remove		= max1027_remove,
diff --cc drivers/iio/adc/mcp320x.c
index d5d8b4180914,41a21e986c1a..000000000000
--- a/drivers/iio/adc/mcp320x.c
+++ b/drivers/iio/adc/mcp320x.c
@@@ -404,6 -404,8 +404,7 @@@ MODULE_DEVICE_TABLE(spi, mcp320x_id)
  static struct spi_driver mcp320x_driver = {
  	.driver = {
  		.name = "mcp320x",
+ 		.of_match_table = of_match_ptr(mcp320x_dt_ids),
 -		.owner = THIS_MODULE,
  	},
  	.probe = mcp320x_probe,
  	.remove = mcp320x_remove,
diff --cc drivers/iio/adc/ti-adc128s052.c
index 76b619649409,98c0d2b444bf..000000000000
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@@ -184,6 -191,8 +191,7 @@@ MODULE_DEVICE_TABLE(spi, adc128_id)
  static struct spi_driver adc128_driver = {
  	.driver = {
  		.name = "adc128s052",
+ 		.of_match_table = of_match_ptr(adc128_of_match),
 -		.owner = THIS_MODULE,
  	},
  	.probe = adc128_probe,
  	.remove = adc128_remove,
diff --cc drivers/iio/dac/ad7303.c
index 399de2cfeb16,18a4ad5ff8c5..000000000000
--- a/drivers/iio/dac/ad7303.c
+++ b/drivers/iio/dac/ad7303.c
@@@ -290,6 -296,8 +296,7 @@@ MODULE_DEVICE_TABLE(spi, ad7303_spi_ids
  static struct spi_driver ad7303_driver = {
  	.driver = {
  		.name = "ad7303",
+ 		.of_match_table = of_match_ptr(ad7303_spi_of_match),
 -		.owner = THIS_MODULE,
  	},
  	.probe = ad7303_probe,
  	.remove = ad7303_remove,
diff --cc drivers/iio/frequency/adf4350.c
index b83534cc2ab1,73f27e0a08dd..000000000000
--- a/drivers/iio/frequency/adf4350.c
+++ b/drivers/iio/frequency/adf4350.c
@@@ -625,6 -633,8 +633,7 @@@ MODULE_DEVICE_TABLE(spi, adf4350_id)
  static struct spi_driver adf4350_driver = {
  	.driver = {
  		.name	= "adf4350",
+ 		.of_match_table = of_match_ptr(adf4350_of_match),
 -		.owner	= THIS_MODULE,
  	},
  	.probe		= adf4350_probe,
  	.remove		= adf4350_remove,
diff --cc drivers/iio/proximity/as3935.c
index 2865aa63f4f1,e95035136889..000000000000
--- a/drivers/iio/proximity/as3935.c
+++ b/drivers/iio/proximity/as3935.c
@@@ -443,6 -449,8 +449,7 @@@ MODULE_DEVICE_TABLE(spi, as3935_id)
  static struct spi_driver as3935_driver = {
  	.driver = {
  		.name	= "as3935",
+ 		.of_match_table = of_match_ptr(as3935_of_match),
 -		.owner	= THIS_MODULE,
  		.pm	= AS3935_PM_OPS,
  	},
  	.probe		= as3935_probe,
