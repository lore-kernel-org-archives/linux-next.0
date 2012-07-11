From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: [PATCH] iio: ad5064: Move bus write callbacks to #if protected sections
Date: Wed, 11 Jul 2012 10:01:30 +0200
Message-ID: <1341993690-19125-1-git-send-email-lars@metafoo.de>
References: <4FFD1458.6000404@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FFD1458.6000404-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Move the SPI and I2C specific write callbacks to the respective
"#if IS_ENABLED(CONFIG_SPI_MASTER)" and "#if IS_ENABLED(CONFIG_I2C)"
protected sections of the code.

This fixes the following warning which occurs if CONFIG_I2C is not set:
	drivers/iio/dac/ad5064.c: In function =E2=80=98ad5064_i2c_write=E2=80=99=
:
	drivers/iio/dac/ad5064.c:132: error: implicit declaration of function =
=E2=80=98i2c_master_send=E2=80=99

And the follwing warning which occurs when CONFIG_SPI_MASTER is not set=
:
	drivers/iio/dac/ad5064.c:137: warning: =E2=80=98ad5064_spi_write=E2=80=
=99 defined but not used

Reported-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Signed-off-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
---
 drivers/iio/dac/ad5064.c |   38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
index aa739c4..de2c368 100644
--- a/drivers/iio/dac/ad5064.c
+++ b/drivers/iio/dac/ad5064.c
@@ -122,25 +122,6 @@ enum ad5064_type {
 	ID_AD5668_2,
 };
=20
-static int ad5064_i2c_write(struct ad5064_state *st, unsigned int cmd,
-	unsigned int addr, unsigned int val)
-{
-	struct i2c_client *i2c =3D to_i2c_client(st->dev);
-
-	st->data.i2c[0] =3D (cmd << 4) | addr;
-	put_unaligned_be16(val, &st->data.i2c[1]);
-	return i2c_master_send(i2c, st->data.i2c, 3);
-}
-
-static int ad5064_spi_write(struct ad5064_state *st, unsigned int cmd,
-	unsigned int addr, unsigned int val)
-{
-	struct spi_device *spi =3D to_spi_device(st->dev);
-
-	st->data.spi =3D cpu_to_be32(AD5064_CMD(cmd) | AD5064_ADDR(addr) | va=
l);
-	return spi_write(spi, &st->data.spi, sizeof(st->data.spi));
-}
-
 static int ad5064_write(struct ad5064_state *st, unsigned int cmd,
 	unsigned int addr, unsigned int val, unsigned int shift)
 {
@@ -533,6 +514,15 @@ static int __devexit ad5064_remove(struct device *=
dev)
=20
 #if IS_ENABLED(CONFIG_SPI_MASTER)
=20
+static int ad5064_spi_write(struct ad5064_state *st, unsigned int cmd,
+	unsigned int addr, unsigned int val)
+{
+	struct spi_device *spi =3D to_spi_device(st->dev);
+
+	st->data.spi =3D cpu_to_be32(AD5064_CMD(cmd) | AD5064_ADDR(addr) | va=
l);
+	return spi_write(spi, &st->data.spi, sizeof(st->data.spi));
+}
+
 static int __devinit ad5064_spi_probe(struct spi_device *spi)
 {
 	const struct spi_device_id *id =3D spi_get_device_id(spi);
@@ -596,6 +586,16 @@ static inline void ad5064_spi_unregister_driver(vo=
id) { }
=20
 #if IS_ENABLED(CONFIG_I2C)
=20
+static int ad5064_i2c_write(struct ad5064_state *st, unsigned int cmd,
+	unsigned int addr, unsigned int val)
+{
+	struct i2c_client *i2c =3D to_i2c_client(st->dev);
+
+	st->data.i2c[0] =3D (cmd << 4) | addr;
+	put_unaligned_be16(val, &st->data.i2c[1]);
+	return i2c_master_send(i2c, st->data.i2c, 3);
+}
+
 static int __devinit ad5064_i2c_probe(struct i2c_client *i2c,
 	const struct i2c_device_id *id)
 {
--=20
1.7.10.4
