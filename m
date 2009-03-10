From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: xfs tree build failure
Date: Tue, 10 Mar 2009 13:45:47 +1100
Message-ID: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Mar_2009_13_45_47_+1100_vGk340DGPWOWXAwU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46586 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751386AbZCJCpz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Mar 2009 22:45:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org

--Signature=_Tue__10_Mar_2009_13_45_47_+1100_vGk340DGPWOWXAwU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from fs/xfs/support/debug.c:21:
fs/xfs/xfs_error.h:137: error: expected declaration specifiers or '...' bef=
ore 'xfs_mount_t'
fs/xfs/xfs_error.h:138: error: expected ')' before '*' token

Immediate cause is commit 7bf446f8b581cef434f5ff05e8a791563bc09b7f ("xfs:
include header files for prototypes").

I have merged the version of the xfs tree from next-20090306 instead of
today's.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Mar_2009_13_45_47_+1100_vGk340DGPWOWXAwU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm11FsACgkQjjKRsyhoI8wtbQCfco4khnWcx4yq611kbzcr58jH
oRcAnj9dFHqV5O1HprN45MtSwEmYgOLl
=O2+B
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Mar_2009_13_45_47_+1100_vGk340DGPWOWXAwU--
