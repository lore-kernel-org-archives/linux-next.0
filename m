From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 08:59:53 +0200
Message-ID: <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150721132945.7ffc443b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150721132945.7ffc443b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@pengutronix.de
List-Id: linux-next.vger.kernel.org

The gpiod functions include variants for managed gpiod resources. Use i=
t
to simplify the remove function.

As the driver handles a device node without a specification of dvs gpio=
s
just fine, additionally use the variant of gpiod_get exactly for this
use case. This makes error checking more strict.

As a third benefit this patch makes the driver use the flags parameter
of gpiod_get* which will not be optional any more after 4.2 and so
prevents a build failure when the respective gpiod commit is merged.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

this is the more complete fix of the issue that Stephen found while cre=
ating
next-20150721 (see commit f51ec04cf8be9f7ef795f1f39ada17c19f725650).

Best regards
Uwe

 drivers/regulator/rk808-regulator.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk=
808-regulator.c
index ca913fd15598..3738e49beb75 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -94,7 +94,7 @@ static int rk808_buck1_2_get_voltage_sel_regmap(struc=
t regulator_dev *rdev)
 	unsigned int val;
 	int ret;
=20
-	if (IS_ERR(gpio) || gpiod_get_value(gpio) =3D=3D 0)
+	if (!gpio || gpiod_get_value(gpio) =3D=3D 0)
 		return regulator_get_voltage_sel_regmap(rdev);
=20
 	ret =3D regmap_read(rdev->regmap,
@@ -168,7 +168,7 @@ static int rk808_buck1_2_set_voltage_sel(struct reg=
ulator_dev *rdev,
 	unsigned old_sel;
 	int ret, gpio_level;
=20
-	if (IS_ERR(gpio))
+	if (!gpio)
 		return rk808_buck1_2_i2c_set_voltage_sel(rdev, sel);
=20
 	gpio_level =3D gpiod_get_value(gpio);
@@ -205,7 +205,7 @@ static int rk808_buck1_2_set_voltage_time_sel(struc=
t regulator_dev *rdev,
 	struct gpio_desc *gpio =3D pdata->dvs_gpio[id];
=20
 	/* if there is no dvs1/2 pin, we don't need wait extra time here. */
-	if (IS_ERR(gpio))
+	if (!gpio)
 		return 0;
=20
 	return regulator_set_voltage_time_sel(rdev, old_selector, new_selecto=
r);
@@ -540,14 +540,19 @@ static int rk808_regulator_dt_parse_pdata(struct =
device *dev,
 		goto dt_parse_end;
=20
 	for (i =3D 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
-		pdata->dvs_gpio[i] =3D gpiod_get_index(client_dev, "dvs", i);
+		pdata->dvs_gpio[i] =3D
+			devm_gpiod_get_index_optional(client_dev, "dvs", i,
+						      GPIOD_OUT_LOW);
 		if (IS_ERR(pdata->dvs_gpio[i])) {
+			dev_err(dev, "failed to get dvs%d gpio\n", i);
+			return PTR_ERR(pdata->dvs_gpio[i]);
+		}
+
+		if (!pdata->dvs_gpio[i]) {
 			dev_warn(dev, "there is no dvs%d gpio\n", i);
 			continue;
 		}
=20
-		gpiod_direction_output(pdata->dvs_gpio[i], 0);
-
 		tmp =3D i ? RK808_DVS2_POL : RK808_DVS1_POL;
 		ret =3D regmap_update_bits(map, RK808_IO_POL_REG, tmp,
 				gpiod_is_active_low(pdata->dvs_gpio[i]) ?
@@ -561,14 +566,6 @@ dt_parse_end:
=20
 static int rk808_regulator_remove(struct platform_device *pdev)
 {
-	struct rk808_regulator_data *pdata =3D platform_get_drvdata(pdev);
-	int i;
-
-	for (i =3D 0; i < ARRAY_SIZE(pdata->dvs_gpio); i++) {
-		if (!IS_ERR(pdata->dvs_gpio[i]))
-			gpiod_put(pdata->dvs_gpio[i]);
-	}
-
 	return 0;
 }
=20
--=20
2.1.4
