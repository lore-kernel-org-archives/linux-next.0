From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with Linus' tree
Date: Thu, 4 Mar 2010 10:33:43 +1100
Message-ID: <20100304103343.4627a27c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Mar_2010_10_33_43_+1100_oPx350FF=g_SeXLa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46645 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753357Ab0CCXdt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Mar 2010 18:33:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__4_Mar_2010_10_33_43_+1100_oPx350FF=g_SeXLa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mach-mx25/clock.c between commit
ac0f6f927db539e03e1f3f61bcd4ed57d5cde7a9 ("Merge branch 'for-linus' of
master.kernel.org:/home/rmk/linux-2.6-arm") from Linus' tree (this looks
like the same merge ed1e01c8cf4772aabe013716353a7a0f879dbf5e ("Merge
branch 'master' into versatile") that is in the arm tree) and commit
04a03e5fe3d337242e5c0a9c93d2fd24cff545ef ("mx25: add platform support for
imxfb") from the arm tree.

I fixed it up (using the arm tree version) an can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Mar_2010_10_33_43_+1100_oPx350FF=g_SeXLa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuO8dcACgkQjjKRsyhoI8zDAgCdFiWairz9AOnyeQ63qG7HpeBs
8DsAnioX3fIsEvRLCf2WzgSt+DPaDoEj
=MXp1
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Mar_2010_10_33_43_+1100_oPx350FF=g_SeXLa--
