From: Thierry Reding <treding@nvidia.com>
Subject: Re: compile fail with "soc/tegra: fuse: Unify Tegra20
 and Tegra30 drivers"
Date: Thu, 4 Jun 2015 10:49:03 +0200
Message-ID: <20150604084902.GL29060@ulmo.nvidia.com>
References: <20150603160808.GM29898@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1514 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750992AbbFDIt2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2015 04:49:28 -0400
In-Reply-To: <20150603160808.GM29898@windriver.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2015 at 12:08:08PM -0400, Paul Gortmaker wrote:
> Hi Thierry,
>=20
> This commit:
>=20
>   commit 436b6428b9cc97f61721f335eb9d8010751a337e
>   Author: Thierry Reding <treding@nvidia.com>
>   Date:   Wed Apr 29 16:54:04 2015 +0200
>=20
>     soc/tegra: fuse: Unify Tegra20 and Tegra30 drivers
>=20
> in linux-next, in combination with my pending init cleanup
>=20
> http://marc.info/?l=3Dlinux-kernel&m=3D143327626201054&w=3D2
>=20
> will cause a compile fail because 43b642 is relying on an
> implicit include of <linux/module.h> to provide the fcn for:
>=20
>    +module_platform_driver(tegra_fuse_driver);
>=20
> which in turn causes:
>=20
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' =
in declaration of 'module_init' [-Werror=3Dimplicit-int]
> drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' =
in declaration of 'module_exit' [-Werror=3Dimplicit-int]
>=20
> Can you add the include to your tree please?  I think it makes
> more sense to be there vs. me preemptively adding it to mine.

I've squashed a patch from Paul Walmsley into the offending commit and
pushed a new for-next branch of the Tegra tree, so this should be fixed
in the next iteration.

Thierry

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVcBD3AAoJEN0jrNd/PrOhvyIP/jEH7ukj1X23K67UIhQEHfpe
GSf1AN8UnuKv3UEd1478gS/JEa64sMjPoteec7/JA1/3QR0Ki3XaqtlIzB2VvD0i
XMPrx0WVdbRic3VHQsM9q2OGQmnO4cwZA1UPdoqzQV8pCZj1zDbXMyvFxpcvabs1
wEaeqmXN2C3pjTKX/YDvK4xEquFWB+raZ74xYdOOoExckBb2j+c7MKDBOXUx0lbW
QRCnlv5fZaiRLSnIJ/KfIgxOc3SxNnD5zlcpXXj5y7fQ+Bi//iYGFWXaXpRHm+kX
VZrk1/6bfS/yp0Vxe78nSPz8TId+4oFJL8h6jht1eaS3Xdl6rJWuK+6nKM4bDxUB
ViR/HS8m0FKKkV9ElZRMsV1YCCeQWpvpw6pFwdAMEIs6MG683rDtccEcS/FwwMax
dwehnFtqjFyY3HQVotJ+dhIlvLB+/kcwwJ4/JEKZSE+KwRf8Po4pS9inBppb917i
ytY56g1ChwrE3edykbNDvnD6QeHx80KfFsFgab3mzWUCMo1Zj3EkYDtJDKAcJo0/
M1f3oPhW9MUAOwe0tcoR8ZQoVK9OXleIjbhrQK+wuRrda0PTeflHsWF9iMi7O0en
55U8HsU0HMgocNjwBzJQ1HWb0lbWSmhIe6+ErNLUNl6NoCpF2/vqnlMkv2f9T368
JncxjPUD15V85mkdaWAm
=v1Nw
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
