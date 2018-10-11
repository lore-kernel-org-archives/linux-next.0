From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pinctrl tree
Date: Thu, 11 Oct 2018 14:17:28 +1100
Message-ID: <20181011141728.50b2d17c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8.DqxVfOzuY8hRVXYWhqNy0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?= =?UTF-8?B?Y2tp?= <rafal@milecki.pl>
List-Id: linux-next.vger.kernel.org

--Sig_/8.DqxVfOzuY8hRVXYWhqNy0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/pinctrl/bcm/pinctrl-ns.c: In function 'ns_pinctrl_probe':
drivers/pinctrl/bcm/pinctrl-ns.c:288:29: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
  ns_pinctrl->chipset_flag =3D (unsigned int)of_id->data;
                             ^
drivers/pinctrl/bcm/pinctrl-ns.c:310:27: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
   unsigned int chipsets =3D (unsigned int)src->drv_data;
                           ^

Introduced by commit

  c12fb1774dea ("pinctrl: bcm: add Northstar driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/8.DqxVfOzuY8hRVXYWhqNy0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu+wMgACgkQAVBC80lX
0Gw/wgf9Fxbmn2osdiFhONHX+ecrEpvks39dvxzEBHBHAcL0VoZ5/HqKNg1zxpwp
DULh6/9Y3HeoBKq8FuM5kKuZj84dIo/wqEhOpVeA0jrpEMldK+LaoMu0tA4FX7cN
jtdjA1cz9Epv+J8cIiqC0yildKSEgyCpNRduLS8uaymxW43SLYiCZB7za92zC8+z
Qs+J/n6DGKTKasU4msEG6SVTNO+jI2rarroW/dV8BG6FYokZB+9qrEzvkY7sCsHy
OtR53RX1Q/W/duMIJbud+9u/Z/5gvWr+7Z0YyZipZWv+tiFNyG34pmn38dJn2wwV
z2RtrA0pPWxqunQ4o49UHrzeTFzfAA==
=xsJW
-----END PGP SIGNATURE-----

--Sig_/8.DqxVfOzuY8hRVXYWhqNy0--
