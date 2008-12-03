From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: xfs tree build failure
Date: Thu, 4 Dec 2008 10:16:12 +1100
Message-ID: <20081204101612.ec0d4d7c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_10_16_12_+1100_U=N8ZqF/kk2BImvs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33083 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753890AbYLCXQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 18:16:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, Eric Sandeen <sandeen@sandeen.net>, Christoph Hellwig <hch@lst.de>, Lachlan McIlroy <lachlan@sgi.com>

--Signature=_Thu__4_Dec_2008_10_16_12_+1100_U=N8ZqF/kk2BImvs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

The build of next-20081203 (sh titan_defconfig, powerpc ppc6xx_defconfig,
mips defconfig, m68k defconfig and others) failed like this:

In file included from fs/xfs/linux-2.6/xfs_file.c:40:
fs/xfs/linux-2.6/xfs_ioctl32.h:50: error: expected specifier-qualifier-list=
 before 'compat_time_t'
fs/xfs/linux-2.6/xfs_ioctl32.h:79: error: expected specifier-qualifier-list=
 before 'compat_uptr_t'
fs/xfs/linux-2.6/xfs_ioctl32.h:94: error: expected specifier-qualifier-list=
 before 'compat_uptr_t'
fs/xfs/linux-2.6/xfs_ioctl32.h:131: error: expected specifier-qualifier-lis=
t before 'compat_uptr_t'
fs/xfs/linux-2.6/xfs_ioctl32.h:142: error: expected specifier-qualifier-lis=
t before 'compat_uptr_t'
fs/xfs/linux-2.6/xfs_ioctl32.h:152: error: expected specifier-qualifier-lis=
t before 'compat_uptr_t'
fs/xfs/linux-2.6/xfs_ioctl32.h:161: error: expected specifier-qualifier-lis=
t before 'compat_uptr_t'

a and few other errors depending on which arch and config.

I have dropped the xfs tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_10_16_12_+1100_U=N8ZqF/kk2BImvs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3EzwACgkQjjKRsyhoI8zKxQCdHdcH4IWDSovsb4kwD6LzTfRY
rCYAoIU170705+Z9JK76MOA/UIjLzEgZ
=LNdX
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_10_16_12_+1100_U=N8ZqF/kk2BImvs--
