From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfsd tree build warning
Date: Mon, 16 Mar 2009 16:51:21 +1100
Message-ID: <20090316165121.3ebaf449.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_16_51_21_+1100_0Pwwpj2VUVQN0k0C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52547 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751334AbZCPFva (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 01:51:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__16_Mar_2009_16_51_21_+1100_0Pwwpj2VUVQN0k0C
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

fs/nfsd/nfs4recover.c: In function 'nfsd4_build_namelist':
fs/nfsd/nfs4recover.c:203: warning: array subscript is above array bounds

Caused by commit d1d269b9d0cadf221cfa3ddbe65a3a0e4cf100e1 ("nfsd4: don't
do lookup within readdir in recovery code").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_16_51_21_+1100_0Pwwpj2VUVQN0k0C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm96NkACgkQjjKRsyhoI8yMBACfdeLHytOM5vwTVtqEDajeTJDk
QiQAni06AF/APFWIZJGTbmoWryD85PJF
=E1tu
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_16_51_21_+1100_0Pwwpj2VUVQN0k0C--
