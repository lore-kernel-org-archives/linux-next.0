From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfsd tree build warning
Date: Wed, 29 Apr 2009 13:57:02 +1000
Message-ID: <20090429135702.943f2bfa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Apr_2009_13_57_02_+1000_tsQ7z.HXf/A40nkD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45622 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751604AbZD2D5J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 23:57:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, Bian Naimeng <biannm@cn.fujitsu.com>

--Signature=_Wed__29_Apr_2009_13_57_02_+1000_tsQ7z.HXf/A40nkD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Today's linux-next build (powerpc ppc64_defconfig) produced this new
warning:

fs/nfsd/nfs4state.c: In function 'EXPIRED_STATEID':
fs/nfsd/nfs4state.c:2757: warning: comparison of distinct pointer types lac=
ks a cast

Caused by commit 78155ed75f470710f2aecb3e75e3d97107ba8374 ("nfsd4:
distinguish expired from stale stateids").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Apr_2009_13_57_02_+1000_tsQ7z.HXf/A40nkD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn30A8ACgkQjjKRsyhoI8wk9gCghSIcGfFopBunwGXgs6Lu6Pk0
jSwAoKvzqc8O1vKfprKZAS59vzD/22Oe
=/zPV
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Apr_2009_13_57_02_+1000_tsQ7z.HXf/A40nkD--
