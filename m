From: Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: manual merge of the tegra tree with the renesas tree
Date: Wed, 18 Nov 2015 15:22:58 +0100
Message-ID: <20151118142257.GA32301@ulmo.nvidia.com>
References: <20151118101512.0691d12f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151118101512.0691d12f@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Simon Horman <horms@verge.net.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <damm+renesas@opensource.se>
List-Id: linux-next.vger.kernel.org

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 10:15:12AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tegra tree got a conflict in:
>=20
>   arch/arm64/configs/defconfig
>=20
> between commit:
>=20
>   727e8d0126e3 ("arm64: defconfig: renesas: Enable Renesas r8a7795 SoC")
>=20
> from the renesas tree and commit:
>=20
>   0a31289369f8 ("arm64: defconfig: Enable serial-tegra driver")
>=20
> from the tegra tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

Looks good, thanks.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWTIm+AAoJEN0jrNd/PrOhRj0QAKOI8Udp/6/eUOVDPpMP8gWa
AYLHxFxi9fG+hKA1ObtFi+BCMrtoI43oIrcqNsEiGS7aQH9n+AjikOvI31traetW
Lg8wXeKxguB1g60+CrdKk+8RFY3mVx47UxoPaFUhRApKwJ/9b71I10PiAE0Z6KzC
qVjq8JcnKLDEDIoYCdApfOWsjOLOw48R7MbNDwkYep2JFnt/8NEuhhLwgDvz/TrO
aCl1PYZNbxN3ZCRNBZmlETacTCYhnkyiXeR2f1ATeUMuAy70ugWTnJVxTaZlZrUc
vRXTshrc1hXkUusXX4XZBueKzi9ShY4BwN7+fL9NQbTvhlzly0bGFBOBMvxfjc3x
+4CpzfS6apC8jGAUAXTQ+YDqS+oFbf90KFrRJH6xV5+u4HUFOPWK3krPA3kZgvdZ
JcPEvXVeyr1etHkZI37OkHc1zoB23MZHZR6ye1fuj89DdvnNQ1M+MaAqwkXBDLk9
rDWwiyNw9ot6XsRum8OvxugICSUOwuvDHYtaqXA7lFzDaERgG4KzAdQSafyr1uen
5R0E2XdaHn/+6qbnjUiuHjC8MJg3V92qhVy0iq/J8fKc5V/Hb1Pr0HN48v1bEGAr
nybuDDzFUs0Iuse2iqoApEsEEM33CG+dcQRKkGrAnJoKfU9XlRqwLRohi24TSie2
klkTUxxh71m6netr4k9M
=KckM
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
