Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789748;
	b=bAhSNcdmqRig+NdeYTbHPYEucpu5VSEr532NjTYizstQCvZbSRmubtiGYMJoxdn/QtQ6
	 oXqswdGhn2K1m32PNK9leTbN9OW5c//bpMND08KFHuPrUZfPA0SDL/u6GaFa86A2YtFEe
	 fvU0GLPgP9rc5oFTW3EOt5PwxeUi5N3pRTBMatd6dSwZW1B60UoBRPgzUkKZW4lSWP88j
	 vkZR2ILe998PU1n9s3n9omlP2DzfM3Vg0v0VKv2IMH9jrwtZp9A9uKDruHtYDmRGUcpzP
	 YP8Lym3oTUbSrnd9pYvOE2GtCmsHfA5prA9Ze1pYjyDBuXpzyJPBGvces5IQcU9jF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789748;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=OOhOpEtUmi8NqmWv0fX2VMmD2P8zJirJDmX8ubh4x6U=;
	b=NlGStU6/KlvsmCVlVkbwO9McEwSmPmbLqaLBkZoxf1Us2ink9sf7nH2k29F4lUKOIZuD
	 Rlcrk/TwGxExb/3NRq2Mp2UZuLzcbKhLDl0A7+CrFKplNAzU0bg1hgbK8vJ5/+JEZugBC
	 C76FlxtS/OPEqnyU7rJMAEoFKbgqSNAWP98ONw6T59VNWs3q+Ni0I8kSk4LadNiWYCLAH
	 e6YSij3kdkqKa+n2F9LlcTL6Tzu/xzoCw+2ieucHd+hs3Lk24a2rOFID6nQM8RdEgIlsX
	 GIRjZiYVMCW3G1Y1fKDCAlfkmlGcnfMQ0QSAKncwYa17gMqmLI4BkM1nbidNfHu1lIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LKRdEty6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5BE606A695;
	Fri, 27 Nov 2026 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LKRdEty6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573DC1F00893;
	Fri, 27 Nov 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789747;
	bh=OOhOpEtUmi8NqmWv0fX2VMmD2P8zJirJDmX8ubh4x6U=;
	h=Date:From:To:Cc:Subject;
	b=LKRdEty6GMyNmKVjFsaWhMjhsXGxfFL6ps+exawhwew41JcoyyhafZb13MOsfYhzV
	 Nfd+lyKIRCmqjVaQJrlBKZX8tXk788XaTNzDqvU0PC6p/ynuvMkzg/xOuq0Z/7+bvp
	 taWIotWjGjA3ZNdY3jM+nqusy7jBcppyNnOhLtfiqd3Bb61JiyrVrxpSx8bJF8kDnJ
	 rm/AJRurdGCeQr/HPLMg0G5+TtK0rmUnBggA7k1mSfG+zu60KFOA/toMkkpDEo6DSZ
	 WnzOLk5QTldWAperBavLQJxOeWMkQQrBW5fRycAxNlNNSPIwYpf0mcA1qSzOhm3Xwx
	 rDFOzz0bkg/tg==
Date: Fri, 27 Nov 2026 14:29:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christopher de Guzman <christopher.deguzman@analog.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the hwmon-staging tree with the
 hwmon-fixes tree
Message-ID: <awmTr2ry8AkoVBc5@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mgZZrDGW4FKx88eO"
Content-Disposition: inline


--mgZZrDGW4FKx88eO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hwmon-staging tree got a conflict in:

  drivers/hwmon/pmbus/ltc2978.c

between commit:

  43f641c028fed ("hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754 c=
hips")

=66rom the hwmon-fixes tree and commits:

  f1354de07181d ("hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754 c=
hips")
  5ced04b8f54e0 ("hwmon: (pmbus/ltc2978) Add support for LT7175 and LT7176P=
")

=66rom the hwmon-staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/hwmon/pmbus/ltc2978.c
index bd58f786693bf,ca94a3c17e9aa..0000000000000
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@@ -23,8 -23,8 +23,8 @@@ enum chips=20
  	/* Managers */
  	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
  	/* Controllers */
- 	lt7170, lt7171, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
- 	ltc3889, ltc7132, ltc7841, ltc7880,
+ 	lt7170, lt7171, lt7175, lt7176p, ltc3880, ltc3882, ltc3883, ltc3884,
+ 	ltc3886, ltc3887, ltc3889, ltc7132, ltc7841, ltc7880,
  	/* Modules */
  	ltm2987, ltm4664, ltm4673, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680,
  	ltm4686, ltm4700,
@@@ -566,6 -566,8 +566,8 @@@ static int ltc2978_write_word_data(stru
  static const struct i2c_device_id ltc2978_id[] =3D {
  	{ .name =3D "lt7170", .driver_data =3D lt7170 },
  	{ .name =3D "lt7171", .driver_data =3D lt7171 },
+ 	{ .name =3D "lt7175", .driver_data =3D lt7175 },
+ 	{ .name =3D "lt7176p", .driver_data =3D lt7176p },
  	{ .name =3D "ltc2972", .driver_data =3D ltc2972 },
  	{ .name =3D "ltc2974", .driver_data =3D ltc2974 },
  	{ .name =3D "ltc2975", .driver_data =3D ltc2975 },
@@@ -656,6 -658,7 +658,7 @@@ static int ltc2978_get_id(struct i2c_cl
  	chip_id &=3D LTC2978_ID_MASK;
 =20
  	if (chip_id =3D=3D LT7170_ID) {
+ 		const struct i2c_device_id *id;
  		u8 buf[I2C_SMBUS_BLOCK_MAX];
  		int ret;
 =20
@@@ -664,13 -667,11 +667,11 @@@
  		if (ret < 0)
  			return ret;
 =20
- 		if (ret < 6)
- 			return -ENODEV;
-=20
- 		if (!strncmp(buf, "LT7170", 6))
- 			return lt7170;
- 		if (!strncmp(buf, "LT7171", 6))
- 			return lt7171;
+ 		for (id =3D &ltc2978_id[0]; strlen(id->name); id++) {
+ 			if (ret >=3D strlen(id->name) &&
+ 			    !strncasecmp(id->name, buf, strlen(id->name)))
+ 				return (int)id->driver_data;
+ 		}
 =20
  		return -ENODEV;
  	}
@@@ -787,6 -788,8 +788,8 @@@ static int ltc2978_probe(struct i2c_cli
  	switch (data->id) {
  	case lt7170:
  	case lt7171:
+ 	case lt7175:
+ 	case lt7176p:
  		data->features |=3D FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING |
  				  FEAT_IEEE754;
  		data->vin_max =3D ltc_peak_max_init(data);
@@@ -999,6 -1002,8 +1002,8 @@@
  static const struct of_device_id ltc2978_of_match[] =3D {
  	{ .compatible =3D "lltc,lt7170" },
  	{ .compatible =3D "lltc,lt7171" },
+ 	{ .compatible =3D "lltc,lt7175" },
+ 	{ .compatible =3D "lltc,lt7176p" },
  	{ .compatible =3D "lltc,ltc2972" },
  	{ .compatible =3D "lltc,ltc2974" },
  	{ .compatible =3D "lltc,ltc2975" },

--mgZZrDGW4FKx88eO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJk68ACgkQJNaLcl1U
h9AXvwf+MtfXDZKOqQxdr9Qqg3P1rj6gx4je/XnbGbrwdebYWBaQMZbZ3QcvVbO5
3mhf+Kz4WjlOn7RqKZziix9zAL3PsaTzBz/M+33jqc5WNh3jIvAQEn+Mxtb3zuVI
iPQKRoU0IoQ6w74npgQpwpaGbtHOtBAHj2blqe2MvK/krCye5Xk7a/h92tC/J50d
SrQJzeq9hUuAu/n6uHXnHFCCz9rBz+Xfo9nVvZdeDmkPPmJro6FH3Cu9wvncE+8G
vF4NvKSxMjUeWle475b6nUkAGGtovGEgXZglGMtuHaS5BRI636y6x4A4qTsniDNv
leOc2MPBbeuzebDftgyaoZUKOiHf7g==
=lw4u
-----END PGP SIGNATURE-----

--mgZZrDGW4FKx88eO--
