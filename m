Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8683F23A2;
	Mon,  8 Jun 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931027; cv=none; b=Ey04Q8gtB8/mgt+2OVw/N35Eg/CnIAURlBKnUL+UzONi+CTlU+QfYDbBW8DBd/Qoa60qRs0KtSDAlKr9os8TxgGmzdqlST+gKhdeUg0+/YoQBbcWW9mYTF0i8mSrLeZp+yU0oRAq41Ms5CGyz1DVNMKTL2dByMr5K9SW+b0vglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931027; c=relaxed/simple;
	bh=ed1jqJ5LohxR4aAjVzfbp3cO7CPpAsm0wXvA8lSmAwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saRZkVzmt7EvCAb3a+07iTTOvPOlBywQwAkF1sq99zjhB7X8MKQXG8eVd40mF35r8cl53ufHCtN1fG4gw9TZ1/R6x2HJ8bVD1gsKiG367qMCErB9+oPYGvpezgcuVnLS03KxI1xzyxjmNzoo2Q88LSjHyH5pyO9mKw3Ds84YZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lh81DtzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lh81DtzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2F61F008A5;
	Mon,  8 Jun 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931023;
	bh=jyZQQ+LKqZi/XcqaaYDqMGOyUuL9LPhIXWvaf+umohQ=;
	h=Date:From:To:Cc:Subject;
	b=lh81DtzB5HS5Ye8yCFgZpDkxi2wWSWCSlTd5j4R0knhDrfccfFx+DhbICTWBlSXJM
	 Hsn688zzYaRHLNUGkpsIt+JDmwym29XQs6djtY6r4cMexk1Bh1N3Qxh+4OgXp7B3bT
	 kC1hdR0zMpddAGeoiLDx010POh4jPjOmW77X+qmMPoWLV08uERjgBGbQnVipiA20gD
	 TXWflnVj5HcR9Uqwzmy+5C+/0OP2PQkZ14PLf/rwKSjWN1ebzl4IPdOKPa3BMsn1EW
	 yP/fVrbsoTaNCpYmXA++L452BUqYx6f8hXBAEx+UwGEn7NWkaYDSXmNETXXHtHnoCp
	 EGfWDVOrQqw4w==
Date: Mon, 8 Jun 2026 16:03:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <aibZy5rrdX3ltGpr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RYgmSG9BO/4yJA9I"
Content-Disposition: inline


--RYgmSG9BO/4yJA9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/platform/arm64/qcom-hamoa-ec.c:394:64: error: incom=
patible pointer to integer conversion passing 'void *' to parameter of type=
 'u32' (aka 'unsigned int') [-Wint-conversion]
  394 |                 ec_cdev->cdev =3D devm_thermal_of_cooling_device_re=
gister(dev, NULL, name, ec_cdev,
      |                                                                    =
          ^~~~
/tmp/next/build/include/linux/stddef.h:8:14: note: expanded from macro 'NUL=
L'
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~
/tmp/next/build/include/linux/thermal.h:210:65: note: passing argument to p=
arameter 'cdev_id' here
  210 | devm_thermal_of_cooling_device_register(struct device *dev, u32 cde=
v_id,
      |                           =20

Caused by commit

   5c44f48e91dee (platform: arm64: Add driver for EC found on Qualcomm refe=
rence devices)

interacting with=20

  37324803f049b (thermal/of: Add cooling device ID support)
  3570cb58e3171 (thermal/of: Pass cdev_id and introduce devm registration h=
elper)

=66rom the thermal tree.  I have fixed this up as below and can carry
this, but this will need to be dealt with during the merge window.

=46rom 7402d20e88c7a0f8a3ce34e660ac40683092b547 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 8 Jun 2026 14:51:40 +0100
Subject: [PATCH] drivers-x86: hamoa: Fix up semantic conflit with thermal t=
ree

/tmp/next/build/drivers/platform/arm64/qcom-hamoa-ec.c:394:64: error: incom=
patible pointer to integer conversion passing 'void *' to parameter of type=
 'u32' (aka 'unsigned int') [-Wint-conversion]
  394 |                 ec_cdev->cdev =3D devm_thermal_of_cooling_device_re=
gister(dev, NULL, name, ec_cdev,
      |                                                                    =
          ^~~~
/tmp/next/build/include/linux/stddef.h:8:14: note: expanded from macro 'NUL=
L'
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~
/tmp/next/build/include/linux/thermal.h:210:65: note: passing argument to p=
arameter 'cdev_id' here
  210 | devm_thermal_of_cooling_device_register(struct device *dev, u32 cde=
v_id,
      |

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm6=
4/qcom-hamoa-ec.c
index a018f7bf35d2a..6c1ff6a14b0cf 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
 		ec_cdev->fan_id =3D i + 1;
 		ec_cdev->parent_dev =3D dev;
=20
-		ec_cdev->cdev =3D devm_thermal_of_cooling_device_register(dev, NULL, nam=
e, ec_cdev,
+		ec_cdev->cdev =3D devm_thermal_of_cooling_device_register(dev, 0, NULL, =
ec_cdev,
 									&qcom_ec_thermal_ops);
 		if (IS_ERR(ec_cdev->cdev)) {
 			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
--=20
2.47.3


--RYgmSG9BO/4yJA9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmom2coACgkQJNaLcl1U
h9BysAf9H3iy9PcbW8u6fcPJKWOEzZX/Q8AHUGU5ftjWXUliTjaReSYEeRiGd2QX
3FxHe3Cmq6k5eObO1XYdnmrrxTNqPpnatHqReF/Lo4EAt/k7lMr3Tv1Jl8Kxw0u+
io9QGnT4FsFVkFDQfk1RRvy2xFGKodw6l/sMOGEopMlTobicauyLwJpI8NzRS8qj
4TeUlkBJAI5+eWybsJXApZp6HBD13X8m9eg/rK8KWsDi9exzBcH7xkfpxXXeYRSk
AgqS8JIWJBg3rOo1q/UhRaTMBTeJZd1U6B+UdpxeWLBpGhBtH5Hdrl9nrhTGpAfG
p3PG2jar+PxAtug4CjVCfHgHCX/CGA==
=CQmV
-----END PGP SIGNATURE-----

--RYgmSG9BO/4yJA9I--
