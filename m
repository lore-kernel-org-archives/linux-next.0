From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with Linus' tree
Date: Wed, 15 May 2019 10:05:12 +1000
Message-ID: <20190515100512.24b80412@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fw7YPhm.nz2ZqvqOBVXFdQi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Stefan Wahren <stefan.wahren@i2se.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fw7YPhm.nz2ZqvqOBVXFdQi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the thermal-soc tree got a conflict in:

  drivers/hwmon/pwm-fan.c

between commits:

  6b1ec4789fb1 ("hwmon: (pwm-fan) Add RPM support via external interrupt")
  841cf6767bf6 ("hwmon: (pwm-fan) Report probe errors consistently")

from Linus' tree and commit:

  37bcec5d9f71 ("hwmon: (pwm-fan) Use devm_thermal_of_cooling_device_regist=
er")

from the thermal-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/hwmon/pwm-fan.c
index eead8afe6447,0243ba70107e..000000000000
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@@ -280,9 -225,8 +291,9 @@@ static int pwm_fan_probe(struct platfor
  	struct device *hwmon;
  	int ret;
  	struct pwm_state state =3D { };
 +	u32 ppr =3D 2;
 =20
- 	ctx =3D devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+ 	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
  	if (!ctx)
  		return -ENOMEM;
 =20
@@@ -300,11 -244,7 +311,11 @@@
 =20
  	platform_set_drvdata(pdev, ctx);
 =20
 +	ctx->irq =3D platform_get_irq(pdev, 0);
 +	if (ctx->irq =3D=3D -EPROBE_DEFER)
 +		return ctx->irq;
 +
- 	ctx->reg_en =3D devm_regulator_get_optional(&pdev->dev, "fan");
+ 	ctx->reg_en =3D devm_regulator_get_optional(dev, "fan");
  	if (IS_ERR(ctx->reg_en)) {
  		if (PTR_ERR(ctx->reg_en) !=3D -ENODEV)
  			return PTR_ERR(ctx->reg_en);
@@@ -328,93 -269,38 +340,66 @@@
 =20
  	ret =3D pwm_apply_state(ctx->pwm, &state);
  	if (ret) {
- 		dev_err(&pdev->dev, "Failed to configure PWM: %d\n", ret);
- 		goto err_reg_disable;
 -		dev_err(dev, "Failed to configure PWM\n");
++		dev_err(dev, "Failed to configure PWM: %d\n", ret);
+ 		return ret;
  	}
+ 	devm_add_action_or_reset(dev, pwm_fan_pwm_disable, ctx->pwm);
 =20
 +	timer_setup(&ctx->rpm_timer, sample_timer, 0);
 +
- 	of_property_read_u32(pdev->dev.of_node, "pulses-per-revolution", &ppr);
++	of_property_read_u32(dev->of_node, "pulses-per-revolution", &ppr);
 +	ctx->pulses_per_revolution =3D ppr;
 +	if (!ctx->pulses_per_revolution) {
- 		dev_err(&pdev->dev, "pulses-per-revolution can't be zero.\n");
++		dev_err(dev, "pulses-per-revolution can't be zero.\n");
 +		ret =3D -EINVAL;
- 		goto err_pwm_disable;
++		return ret;
 +	}
 +
 +	if (ctx->irq > 0) {
- 		ret =3D devm_request_irq(&pdev->dev, ctx->irq, pulse_handler, 0,
++		ret =3D devm_request_irq(dev, ctx->irq, pulse_handler, 0,
 +				       pdev->name, ctx);
 +		if (ret) {
- 			dev_err(&pdev->dev,
- 				"Failed to request interrupt: %d\n", ret);
- 			goto err_pwm_disable;
++			dev_err(dev, "Failed to request interrupt: %d\n", ret);
++			return ret;
 +		}
 +		ctx->sample_start =3D ktime_get();
 +		mod_timer(&ctx->rpm_timer, jiffies + HZ);
 +	}
 +
- 	hwmon =3D devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
+ 	hwmon =3D devm_hwmon_device_register_with_groups(dev, "pwmfan",
  						       ctx, pwm_fan_groups);
  	if (IS_ERR(hwmon)) {
 -		dev_err(dev, "Failed to register hwmon device\n");
 -		return PTR_ERR(hwmon);
 +		ret =3D PTR_ERR(hwmon);
- 		dev_err(&pdev->dev,
- 			"Failed to register hwmon device: %d\n", ret);
++		dev_err(dev, "Failed to register hwmon device: %d\n", ret);
 +		goto err_del_timer;
  	}
 =20
- 	ret =3D pwm_fan_of_get_cooling_data(&pdev->dev, ctx);
+ 	ret =3D pwm_fan_of_get_cooling_data(dev, ctx);
  	if (ret)
 -		return ret;
 +		goto err_del_timer;
 =20
  	ctx->pwm_fan_state =3D ctx->pwm_fan_max_state;
  	if (IS_ENABLED(CONFIG_THERMAL)) {
- 		cdev =3D thermal_of_cooling_device_register(pdev->dev.of_node,
- 							  "pwm-fan", ctx,
- 							  &pwm_fan_cooling_ops);
+ 		cdev =3D devm_thermal_of_cooling_device_register(dev,
+ 			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
  		if (IS_ERR(cdev)) {
 +			ret =3D PTR_ERR(cdev);
- 			dev_err(&pdev->dev,
+ 			dev_err(dev,
 -				"Failed to register pwm-fan as cooling device");
 -			return PTR_ERR(cdev);
 +				"Failed to register pwm-fan as cooling device: %d\n",
 +				ret);
 +			goto err_del_timer;
  		}
  		ctx->cdev =3D cdev;
  		thermal_cdev_update(cdev);
  	}
 =20
  	return 0;
 +
 +err_del_timer:
 +	del_timer_sync(&ctx->rpm_timer);
-=20
- err_pwm_disable:
- 	state.enabled =3D false;
- 	pwm_apply_state(ctx->pwm, &state);
-=20
- err_reg_disable:
- 	if (ctx->reg_en)
- 		regulator_disable(ctx->reg_en);
-=20
 +	return ret;
  }
 =20
- static int pwm_fan_remove(struct platform_device *pdev)
- {
- 	struct pwm_fan_ctx *ctx =3D platform_get_drvdata(pdev);
-=20
- 	thermal_cooling_device_unregister(ctx->cdev);
- 	del_timer_sync(&ctx->rpm_timer);
-=20
- 	if (ctx->pwm_value)
- 		pwm_disable(ctx->pwm);
-=20
- 	if (ctx->reg_en)
- 		regulator_disable(ctx->reg_en);
-=20
- 	return 0;
- }
-=20
  #ifdef CONFIG_PM_SLEEP
  static int pwm_fan_suspend(struct device *dev)
  {

--Sig_/fw7YPhm.nz2ZqvqOBVXFdQi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzbV7gACgkQAVBC80lX
0GyJzAgAoShr0xTPeKgu+K7+KSQrqWdMox5hEee+WIQTaJiV8zShfgQSsR9nHZ00
rZpwXVqbtjYfclkIye+Pyrx4lJ2Lo3fR3MWMoenUhIdXvEC00Rjg2wTRlnz31llY
EEds+PDK6XTig99yfXwz1/x316mi4V8e8Nv8JY1+u1hUeRW+hu8aMBJjsfYuNdKZ
QTB3CJRV+qxd1nixDJr98xFR3BNdfVK2KDTsH+uIOuw8/5Of1i7hQwmgqZEBR2h/
Ovsa/+t7/JwGPPUJisiXRkR+DqLbW+nDqKT/qFoRTrxI1X8V1bNM3LuaPc6jpe4W
PZBn3aYqiOs1FBtGS8gnf6wS0SGrEg==
=bA0s
-----END PGP SIGNATURE-----

--Sig_/fw7YPhm.nz2ZqvqOBVXFdQi--
