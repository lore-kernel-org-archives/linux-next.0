From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include modem_shm in linux-next
Date: Wed, 1 Feb 2012 11:45:43 +1100
Message-ID: <20120201114543.0f8e35b3b9c6baadb2ba0c32@canb.auug.org.au>
References: <CACRpkdYDR4S_P-CUiJoB1bBpESGs9nG+5=Mr5M-5cGF5UkOvJw@mail.gmail.com>
	<81C3A93C17462B4BBD7E272753C105791FB10F9CC9@EXDCVYMBSTM005.EQ1STM.local>
	<20120113111055.83755960f93161d3542e4763@canb.auug.org.au>
	<CACRpkdYjvu2Tq7b6wGn9CnMtDjb7zcenbcUM7Br2gEVq7Xpq4Q@mail.gmail.com>
	<81C3A93C17462B4BBD7E272753C105791FB6FA76E1@EXDCVYMBSTM005.EQ1STM.local>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__1_Feb_2012_11_45_43_+1100_m9SOs02Dw1.vWle/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54073 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753103Ab2BAApx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Jan 2012 19:45:53 -0500
In-Reply-To: <81C3A93C17462B4BBD7E272753C105791FB6FA76E1@EXDCVYMBSTM005.EQ1STM.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

--Signature=_Wed__1_Feb_2012_11_45_43_+1100_m9SOs02Dw1.vWle/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sjur,

On Tue, 31 Jan 2012 09:45:22 +0100 Sjur BRENDELAND <sjur.brandeland@sterics=
son.com> wrote:
>
> >> I would also like to hear from Linus Walleij ...
> >=20
> > Please replace my repo with Sjurs (whenever it merges fine).
> >=20
> > Sjur, I guess an option would be if you rebase your for-next
> > onto 3.3-rc1 as soon as it appears?=20
>=20
> I have rebased to v3.3-rc1. Please pull:
> git://github.com/sjurbren/modem-ipc.git for-next.
>=20
> This replaces the previous branch "xshm-for-next" pulled from Linus Walle=
ij.
> Please get back to me if you get any issues.

I have switched to this from today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__1_Feb_2012_11_45_43_+1100_m9SOs02Dw1.vWle/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPKIs3AAoJEECxmPOUX5FEK7MP/Rlc3s9fRujJ/6CjEXD9wYM8
5UnZ01JTfW35ZqPnr7F1/1o8Y5f7ts4p/6D79b6oYPv5w5Lu42938Dt8fCwRbMJ6
DxU0o/fk021p8+BqHrMv/FaN+4K3KiydzfOwh00bHD0EozSoJq2I9d+qb33cfNoz
FgT0p0qcbJXpBd2a8qeoy6a60TpY5RRRchnsFN7vUCVH/asdwuQpNmjFWsw4nW2R
2vw9zOjbTAHnJjHEbUKB/t151ZmNFQsXxmYTb1lkMr+V91/2mb2BHqDiaYJ6aNlQ
u1ALugd23i4HWhM3DP/H6FzuVsAtuA6hdaI74LriCiWndy0NdUHAc74FG9E4aNcc
PiYdUQ0lPgYHJB3GV1Vn7W/g7va1G3Lla3m0Jul2dNeh+56O0q6vugroHjKTOH4d
iJ9X28I5PhUbyEGNQH9sFzxbMwZ2W8x2qHqD2lrAbZkDhgQm9L4Xr/+JKfxNraql
PVyVmFs+zoudnepsKDBh80grTCHDkQmrsFgkpRQahbR+jLw8kmK4Xy4SrIr2wC8d
NQYzaBNfJqZGrpV2CFX6tgPOdAeKxR5mOqChcUHWyI/qKChJVDgS4mwQaHfGvN+6
foq/J8su4EcBbGRS/X3YjtnccIovTrWu2cUjAtYvyQUfrdkvHL/MKlWFP+hW7ZLE
yHi02ivIAkbOCYrz43qo
=pgVM
-----END PGP SIGNATURE-----

--Signature=_Wed__1_Feb_2012_11_45_43_+1100_m9SOs02Dw1.vWle/--
