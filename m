From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Mon, 25 Feb 2019 15:52:19 +1100
Message-ID: <20190225155219.3ed4979c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Q5yfiHQ1x7dkA5sHNRDHoyX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-Id: linux-next.vger.kernel.org

--Sig_/Q5yfiHQ1x7dkA5sHNRDHoyX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpio/gpio-amd-fch.c: In function 'amd_fch_gpio_probe':
drivers/gpio/gpio-amd-fch.c:164:49: warning: passing argument 2 of 'devm_io=
remap_resource' discards 'const' qualifier from pointer target type [-Wdisc=
arded-qualifiers]
  priv->base =3D devm_ioremap_resource(&pdev->dev, &amd_fch_gpio_iores);
                                                 ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/platform_device.h:14,
                 from drivers/gpio/gpio-amd-fch.c:15:
include/linux/device.h:709:15: note: expected 'struct resource *' but argum=
ent is of type 'const struct resource *'
 void __iomem *devm_ioremap_resource(struct device *dev, struct resource *r=
es);
               ^~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  e09d168f13f0 ("gpio: AMD G-Series PCH gpio driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q5yfiHQ1x7dkA5sHNRDHoyX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxzdIMACgkQAVBC80lX
0Gwgugf/S+ddkjwOvu8aDpA+Q59Cmr6zPSTiRHYymhFK5M3BtNbclN63WTKNhTzS
NfxsRBgNoGdy4M1wKi7WiQ74kYGyUCin8EV6piBy8x57sE8XPgkwJKddu2bGain1
Lsj5uvS9z3so7RO8Y29wzSSLXduemaMcekWZ8rIfXaWzQitYPc1Tt13P6YLj4z84
2xkFj1FOrfPPeadx+KKYle9Brn33wJ3J/4KK28HOOxAlug25lWZapmWX2FT2Mluv
YJsIc6Tulj6xsqKkGbKJ46DCx5n5jyi4XyBKdBx7+Gve0L44JDA5u9vWiwW5ca4X
f+LKP4eqSI599OSSju4cduQMQFLE0A==
=rkTb
-----END PGP SIGNATURE-----

--Sig_/Q5yfiHQ1x7dkA5sHNRDHoyX--
