From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: md tree build failure
Date: Tue, 10 Mar 2009 16:47:50 +1100
Message-ID: <20090310164750.affe762c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Mar_2009_16_47_50_+1100_478=b=OSjbXc7yeV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40881 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752864AbZCJFr6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 01:47:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__10_Mar_2009_16_47_50_+1100_478=b=OSjbXc7yeV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/md/raid10.c: In function 'sync_request':
drivers/md/raid10.c:1753: error: implicit declaration of function 'msleep_i=
nterruptible'

Caused by commit 10d4564a71c58e89ddee656eb6cb0fecf5ac4b3c ("md: move lots
of #include lines out of .h files and into .c").

I have merged the version of the md tree fomr next-20090306 instead of
today's.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Mar_2009_16_47_50_+1100_478=b=OSjbXc7yeV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm1/wYACgkQjjKRsyhoI8yw0wCguqzexNh16yRkt4Hk1fJJDTIh
8/MAn1hHGGEqydPgaDMNNoEng7ie2jLq
=pi0M
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Mar_2009_16_47_50_+1100_478=b=OSjbXc7yeV--
