From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Tue, 24 Mar 2015 14:24:22 +1100
Message-ID: <20150324142422.4105cc15@canb.auug.org.au>
References: <20150313120250.5ce08f77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CIhCLoGFl_sGWiCulukLj_V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150313120250.5ce08f77@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>
List-Id: linux-next.vger.kernel.org

--Sig_/CIhCLoGFl_sGWiCulukLj_V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Fri, 13 Mar 2015 12:02:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> fs/ext4/indirect.c: In function 'ext4_ind_direct_IO':
> fs/ext4/indirect.c:653:2: error: implicit declaration of function 'iov_it=
er_count' [-Werror=3Dimplicit-function-declaration]
>   size_t count =3D iov_iter_count(iter);
>   ^
>=20
> Caused by commit 3737c63e1fb0 ("fs: move struct kiocb to fs.h").  aio.h
> used to include uio.h ...
>=20
> I wonder if there is more fallout from this include file diet.
>=20
> It would have been nice if the more general changes to aio.h were in a
> separate patch.
>=20
> I added the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 13 Mar 2015 11:56:46 +1100
> Subject: [PATCH] ext4: iov_iter_count needs linux/uio.h
>=20
> Fixes: 3737c63e1fb0 ("fs: move struct kiocb to fs.h")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/ext4/indirect.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ext4/indirect.c b/fs/ext4/indirect.c
> index 33308738a06a..a9369e5d2cc1 100644
> --- a/fs/ext4/indirect.c
> +++ b/fs/ext4/indirect.c
> @@ -20,6 +20,8 @@
>   *	(sct@redhat.com), 1993, 1998
>   */
> =20
> +#include <linux/uio.h>
> +
>  #include "ext4_jbd2.h"
>  #include "truncate.h"
> =20
> --=20
> 2.1.4

I am still applying the above patch every day ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/CIhCLoGFl_sGWiCulukLj_V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVENjrAAoJEMDTa8Ir7ZwVLDMP/0LRWiHlUOmVU6PI4k++FdEm
D+p/vS8HKQmOImEw/hTMpM1wNjOsDkZikCq7zDPSgKhNIpixBlFPL+RUeEbKb0Qj
XRPmKPm3+hm4U5yXf2kFDELxeNqKDnpT0Oqf7SU+ebZy3bbOPQfQeIC7DS2Z2zXV
JHLUNkDIQdh8nP0OZQXyDd875ZtPdFtVMaMtN8lf1GkJ4j2fCPnTzCGE4yK4RoLh
ecs6WgZFIVb4V7l+DWCZ5Lvw3cpcvKZ37bViewNqIjPM1yS8T6WBlTI3ZIj7DrCT
EaI4Vllr6k3YuRkpjJpb56ZLkkwJbwgJT7LPRgMCnDq/4kAPeIh9ctMG7VQIVbKk
h6Pids6SdRp9tPUIRnYRoQP49T5fvS2Bub7OVYuKA9bbxso/gUu8s35RxXu2E0Pi
aSj9cqA2aBV11tuqFbDhSYJ3krORgK1y6xbwObKnoszmqO/dU6usIb1wXhh5oC8z
1oBvIT7a02aQLgw7w6miQDquZrj4CuNR/HxUH8W0sNsc9xeFeXxq6usm71FBff7o
qc6ki8zFGgXmGkuFsLYtxZUjYiJeSMDvkccOEitKIAgayMtkwHd0E7RoGd22oO6X
Ka3HVTI2N7W4TpC4ZbaJ2WrsNghPmiK2BgJ3ANJvo/UopdhXdQlPohJnlyu8bXXy
Ux/Y6uOwypKMwO7sod/Z
=l0vT
-----END PGP SIGNATURE-----

--Sig_/CIhCLoGFl_sGWiCulukLj_V--
