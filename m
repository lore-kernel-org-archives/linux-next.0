From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: xfs tree build failure
Date: Thu, 12 Mar 2009 12:04:41 +1100
Message-ID: <20090312120441.b9839805.sfr@canb.auug.org.au>
References: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Mar_2009_12_04_41_+1100_DGaPqNV9gMWEFCLO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42674 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755597AbZCLBEt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 21:04:49 -0400
In-Reply-To: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org

--Signature=_Thu__12_Mar_2009_12_04_41_+1100_DGaPqNV9gMWEFCLO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 10 Mar 2009 13:45:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> In file included from fs/xfs/support/debug.c:21:
> fs/xfs/xfs_error.h:137: error: expected declaration specifiers or '...' b=
efore 'xfs_mount_t'
> fs/xfs/xfs_error.h:138: error: expected ')' before '*' token

This is still happening.

Looking at the preprocessed output. xfs_mount_t is not defined yet, so
either fs/xfs/xfs_error.h needs to include xfs_mount.h (in the DEBUG
case) or xfs_errortag_add and xfs_errortag_clearall need to use "struct
xfs_mount" as their paramaters instead of xfs_mount_t (and predeclare
"struct xfs_mount").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Mar_2009_12_04_41_+1100_DGaPqNV9gMWEFCLO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm4X6kACgkQjjKRsyhoI8za8QCeM5bfIFaAVCjonk42C+Gm1/iu
frUAn19xMwClvDxLf2fTQs33KU8DPa5o
=kqxc
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Mar_2009_12_04_41_+1100_DGaPqNV9gMWEFCLO--
