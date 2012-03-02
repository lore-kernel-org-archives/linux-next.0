From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re:
 "usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt" breaks
 sparc
Date: Sat, 3 Mar 2012 10:41:42 +1100
Message-ID: <20120303104142.9615e7a2d9330a5443e0e027@canb.auug.org.au>
References: <4F51432C.8020204@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sat__3_Mar_2012_10_41_42_+1100_Fw63Za_/B7u=91rX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42434 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755873Ab2CBXl4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Mar 2012 18:41:56 -0500
In-Reply-To: <4F51432C.8020204@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: tomoya.rohm@gmail.com, Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Sat__3_Mar_2012_10_41_42_+1100_Fw63Za_/B7u=91rX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Just cc'ing Greg as this commit is in the usb tree]

On Fri, 2 Mar 2012 17:01:16 -0500 Paul Gortmaker <paul.gortmaker@windriver.=
com> wrote:
>
> This commit:
>=20
> ---------------
> commit 637b78eb31e0b167ed913f1750bb645dfeda38f0
> Author: Tomoya MORINAGA <tomoya.rohm@gmail.com>
> Date:   Fri Feb 3 16:14:18 2012 +0900
>=20
>     usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt
>    =20
>     Problem:
>      pch_udc continues operation even if VBUS becomes Low.
>      pch_udc performs D+ pulling up before VBUS becomes High.
>      USB device should be controlled according to VBUS state.
>    =20
>     Root cause:
>      The current pch_udc is not always monitoring VBUS.
>    =20
>     Solution:
>      The change of VBUS is detected using an interrupt of GPIO.
>      If VBUS became Low, pch_udc handles 'disconnect'.
>      After VBUS became High, a pull improves D+, and pch_udc
>      handles 'connect'.
>    =20
>     [ balbi@ti.com : make it actually compile ]
>    =20
>     Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
>     Signed-off-by: Felipe Balbi <balbi@ti.com>
> ---------------
>=20
> breaks the sparc builds in next:
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/5771890/
> http://kisskb.ellerman.id.au/kisskb/buildresult/5771905/
>=20
> Thanks,
> Paul.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Sat__3_Mar_2012_10_41_42_+1100_Fw63Za_/B7u=91rX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPUVq2AAoJEECxmPOUX5FEMw8P/iLaVY/dxKzytRSnWMOP4R1G
/IQBZYgcjOLTRJR+DMWbzBZ07dvC8J3zEv/IokfM04n58gqvCYYEv3C0R7WdOGvd
H7I9KUNF2DJsXhk7jqVKPAcg4pReBrHdaR8hBhOs5FPr5if/vpGLHQkRb2juR8D8
T0NJOtK6iQ0pEveNj/sE/9+BeNIMklNxUgWkfCt7HtNLfAMRGmcMY/fPOj8mT1kw
2iN3HC8V8peHSRkUEUALztx8a3UujceDxzn5NP/WjKq4S9E47FxTy3xjRrTWg5s6
AkIh/jV+JJp6s76+5FJY2RKCuPEIKT5T3uBvZyhEWrNItkt41ejYy65VX/AsC8/x
GSx+FnJBEBs4sfZGfdMMuZqDz5rogdfJDWOM7jLQAg5bTMwyX8lNPWqMND1pKW5p
NUL8hWTB3pIEH3sCZby8/W8DXO2T/4SqVOJ0RFlZ0d1QIHGxuvBIT1DxeiMo0H32
JHqzxVr+4FAQz2SiiMJzzjrNNA6ijzEQcOaqENFER5joZIstQM6+/z0gUfL2N0bF
mGXdAb0C5CeZX8JIJmrGYItyHj+S/3jxWNUCz0RT3PnnntmoghohotpJA3+nekDW
LBPysH1Nz+BKfSlRXxNI0uD+Qomz9E0aVqo3inegMsym/BYiW6nVpu/gign3fY2K
ZtOLjpxSgnkCLK09+lmL
=/gsm
-----END PGP SIGNATURE-----

--Signature=_Sat__3_Mar_2012_10_41_42_+1100_Fw63Za_/B7u=91rX--
