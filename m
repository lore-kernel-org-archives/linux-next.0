From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Date: Mon, 19 May 2014 11:03:10 +0200
Message-ID: <20140519090310.GD29466@lukather>
References: <20140519165947.619886fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:49722 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752884AbaESJFO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 May 2014 05:05:14 -0400
Content-Disposition: inline
In-Reply-To: <20140519165947.619886fc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, May 19, 2014 at 04:59:47PM +1000, Stephen Rothwell wrote:
> Hi Linus,
>=20
> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig among others) produced this warning:
>=20
> drivers/pinctrl/sunxi/Kconfig:3:error: recursive dependency detected!
> drivers/pinctrl/sunxi/Kconfig:3:	symbol PINCTRL_SUNXI is selected by PINC=
TRL_SUN4I_A10
> drivers/pinctrl/sunxi/Kconfig:9:	symbol PINCTRL_SUN4I_A10 default value c=
ontains PINCTRL_SUNXI
>=20
> Introduced by commit 3b582f7e1542 ("pinctrl: sunxi: Enable the pinctrl
> Kconfig options by default").

This should be fixed with the patch I sent on saturday:
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/257411.html

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTecjOAAoJEBx+YmzsjxAgwmAP/04lLUBVMLHcsEIFBjKSXojd
GiFkXhwq6fZv0/6XZxRvPl4h1ggPe9kI5fygW2H6FbcUGrWqK9zQ13X7aqwQZVzO
cdzEH8WoX2DSRDWviRaZ2CJlwV10ymEJJBp+piP98v479gYyxMg3rtuusvIOrXTq
4yaK072w/dz2c15iL8nFXtV05hc+CEah8fuI/G0oN2rzU3PLavMRlsUtUL8fYNPZ
VYL1CFuBzvy0uaikgyqiniBwt7hi+ZzYa5hG784XUGj1vJJFuNYbYdLCUeaxDU5T
8G2+zxNSrntsWy4Clh0AXGGn+gNh8XRFat+/o/+lp3xonRJ1CdCNTfpHWnPFAjVB
UrDwHN30gXeS0/3Z9eB/Z7Uq+80LpvlvBCDyX+HRuvuj7PIXTpxKh+OAjVHEvP/0
KNya4ug4eFc3xzIaXixpgDgvE2ishTpy5XYc02isqQav3yMJYSnrFZp783DCnrXj
Pxr1QypI+WJ8V475hwKHSAsYLmKJRwEaj/80h72+ohFaHa6Z9ieTTtPytb3VHfmc
XFTF3gES7gV9M+Qwb6fv273KQt3XBCvwia50XHtFdb6eHwRSlkZKik6QAQGDRYQT
olvLRpfaUJAm0TJ2R1PK5CkJ8FlTuVJJBJpkdY1MvpB37826QUiCQCzbFM5Lzv5x
ZKZFx4l5QTeiXe+jmmoY
=639x
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
