From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kgdb tree build warning
Date: Thu, 24 Dec 2009 10:48:12 +1100
Message-ID: <20091224104812.7f2495f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Dec_2009_10_48_12_+1100_WNKvT3nhsEBukA40"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50706 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757490AbZLWXsS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Dec 2009 18:48:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__24_Dec_2009_10_48_12_+1100_WNKvT3nhsEBukA40
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Today's linux-next build (x86_64_allmodconfig) produced this warning:

kernel/debug/kdb/kdb_bp.c: In function 'kdb_bp':
kernel/debug/kdb/kdb_bp.c:434: warning: the frame size of 32880 bytes is la=
rger than 2048 bytes

Introduced by commit 16f40ed7bd0ad29dcde7a05b8a07f5ba10937277 ("kdb: core
for kgdb back end").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Dec_2009_10_48_12_+1100_WNKvT3nhsEBukA40
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksyrDwACgkQjjKRsyhoI8wVdgCguhsk96NUTyUyMoandfZMC7vY
esoAoIqGr+rKDpmPuuwW8rZSvA1JhIdz
=kw1o
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Dec_2009_10_48_12_+1100_WNKvT3nhsEBukA40--
