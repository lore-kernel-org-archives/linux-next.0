From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v9fs patch comment
Date: Thu, 23 Oct 2008 09:36:51 +1100
Message-ID: <20081023093651.1b8b92d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Oct_2008_09_36_51_+1100_VmG/IGMZg2SbyDpz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38267 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751315AbYJVWhB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 18:37:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__23_Oct_2008_09_36_51_+1100_VmG/IGMZg2SbyDpz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

> commit d48be775412f4d9526da636754ebc108eac54b80
> Author: Eric Van Hensbergen <ericvh@gmail.com>
> Date:   Wed Oct 22 16:58:59 2008 -0500
>=20
>     9p: fix format warning
>    =20
>     This patch fixes a format warning which appears on 64-bit builds.
>    =20
>     Signed-off-by: Eric Van Hensbergen <ericvh@gmail.com>
>=20
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index 041c526..b218e23 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -178,7 +178,8 @@ v9fs_file_read(struct file *filp, char __user *udata,=
 size_t count,
>  	int ret;
>  	struct p9_fid *fid;
> =20
> -	P9_DPRINTK(P9_DEBUG_VFS, "count %d offset %lld\n", count, *offset);
> +	P9_DPRINTK(P9_DEBUG_VFS, "count %lu offset %lld\n",
> +						(unsigned long) count, *offset);

This is not the correct fix, you should use %zu to print size_t variables
and then you don't need the cast.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Oct_2008_09_36_51_+1100_VmG/IGMZg2SbyDpz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj/qwMACgkQjjKRsyhoI8yvRgCeOh/pqTTlSxySCdeAOzzzQet8
EmQAnA5Ie1a0Pe1qQstrq9Z4GeZHgtEn
=VebC
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Oct_2008_09_36_51_+1100_VmG/IGMZg2SbyDpz--
