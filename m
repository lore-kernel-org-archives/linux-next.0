From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the thermal-soc tree with Linus' tree
Date: Mon, 30 Oct 2017 16:42:22 +0000
Message-ID: <20171030164222.yuykqxtlvzo2c7jq@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6d5nl74abdcoqkma"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33440 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751475AbdJ3Qmj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2017 12:42:39 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Zhang Rui <rui.zhang@intel.com>, Kevin Wangtao <kevin.wangtao@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--6d5nl74abdcoqkma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

Today's linux-next merge of the thermal-soc tree got a conflict in:

  drivers/thermal/hisi_thermal.c

between commit:

  3fe156f1dd9909 ("thermal: hisilicon: constify thermal_zone_of_device_ops =
structures")

=66rom Linus' tree and various commits from the thermal-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/thermal/hisi_thermal.c
index bd3572c41585,6a4e866a3596..000000000000
--- a/drivers/thermal/hisi_thermal.c
+++ b/drivers/thermal/hisi_thermal.c
@@@ -206,20 -403,50 +403,50 @@@ static int hi6220_thermal_probe(struct=20
  	return 0;
  }
 =20
- static const struct thermal_zone_of_device_ops hisi_of_thermal_ops =3D {
- 	.get_temp =3D hisi_thermal_get_temp,
- };
+ static int hi3660_thermal_probe(struct hisi_thermal_data *data)
+ {
+ 	struct platform_device *pdev =3D data->pdev;
+ 	struct device *dev =3D &pdev->dev;
+ 	struct resource *res;
+=20
+ 	data->get_temp =3D hi3660_thermal_get_temp;
+ 	data->enable_sensor =3D hi3660_thermal_enable_sensor;
+ 	data->disable_sensor =3D hi3660_thermal_disable_sensor;
+ 	data->irq_handler =3D hi3660_thermal_irq_handler;
+=20
+ 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ 	data->regs =3D devm_ioremap_resource(dev, res);
+ 	if (IS_ERR(data->regs)) {
+ 		dev_err(dev, "failed to get io address\n");
+ 		return PTR_ERR(data->regs);
+ 	}
 =20
- static irqreturn_t hisi_thermal_alarm_irq(int irq, void *dev)
+ 	data->irq =3D platform_get_irq(pdev, 0);
+ 	if (data->irq < 0)
+ 		return data->irq;
+=20
+ 	data->sensor.id =3D HI3660_DEFAULT_SENSOR;
+=20
+ 	return 0;
+ }
+=20
+ static int hisi_thermal_get_temp(void *__data, int *temp)
  {
- 	struct hisi_thermal_data *data =3D dev;
+ 	struct hisi_thermal_data *data =3D __data;
+ 	struct hisi_thermal_sensor *sensor =3D &data->sensor;
 =20
- 	disable_irq_nosync(irq);
- 	data->irq_enabled =3D false;
+ 	*temp =3D data->get_temp(data);
 =20
- 	return IRQ_WAKE_THREAD;
+ 	dev_dbg(&data->pdev->dev, "id=3D%d, temp=3D%d, thres=3D%d\n",
+ 		sensor->id, *temp, sensor->thres_temp);
+=20
+ 	return 0;
  }
 =20
 -static struct thermal_zone_of_device_ops hisi_of_thermal_ops =3D {
++static const struct thermal_zone_of_device_ops hisi_of_thermal_ops =3D {
+ 	.get_temp =3D hisi_thermal_get_temp,
+ };
+=20
  static irqreturn_t hisi_thermal_alarm_irq_thread(int irq, void *dev)
  {
  	struct hisi_thermal_data *data =3D dev;

--6d5nl74abdcoqkma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3Vm4ACgkQJNaLcl1U
h9CX5wf/WiBbj4H863/6/orB9CptTjrfk/9TN0eEM/QsDc/DbaAZRgDLUgH/9H0v
Kd7U0of6K4yvNA8jO+pe291qQAfhe5XA5lNg3kLlugfP55NtZhJLPLiKSQJ7LgZq
cU4v+XnftNlfWI2sSr0n5/TUlws2+JLrX6Dz3P/fgwCo0sanZVCNwf33NlMukhGz
6VGrT7x2VGbDm1y3q51N1NatrezuVQCWEDMiwuzjNqsHUOcowLuhuhUUbozoGgva
LHl89enp853nbm+1LishuGBZatkTc+DMlbWmYN7U6GXKI/4seZ7EHcbdvU0JTdeQ
FD5jjCCDOXWskWyBqgZ8pcCLD7NEBw==
=QoWk
-----END PGP SIGNATURE-----

--6d5nl74abdcoqkma--
