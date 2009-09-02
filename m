From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: xfs tree build failure
Date: Wed, 2 Sep 2009 11:25:09 +1000
Message-ID: <20090902112509.739ce995.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Sep_2009_11_25_09_+1000_bE.xXVLScxKVLYzX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48128 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752690AbZIBBZR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Sep 2009 21:25:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Felix Blyakher <felixb@sgi.com>, Alex Elder <aelder@sgi.com>

--Signature=_Wed__2_Sep_2009_11_25_09_+1000_bE.xXVLScxKVLYzX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/xfs/xfs_ialloc.c:63: error: static declaration of 'xfs_inobt_lookup' fol=
lows non-static declaration
fs/xfs/xfs_ialloc.h:155: note: previous declaration of 'xfs_inobt_lookup' w=
as here

Caused by commit 2187550525d7bcb8c87689e4eca41b1955bf9ac3 ("xfs:
rationalize xfs_inobt_lookup*").

I have used the version of the xfs tree from next-20090901 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Sep_2009_11_25_09_+1000_bE.xXVLScxKVLYzX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqdyXUACgkQjjKRsyhoI8xjGwCgh9NwmJ0ys8dyUIFFyRA/yIFE
LVgAoIvVuwunAfhaf+QuzZi2ZSa9ycYr
=Tali
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Sep_2009_11_25_09_+1000_bE.xXVLScxKVLYzX--
