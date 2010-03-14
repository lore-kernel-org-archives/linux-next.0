From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: fetch of nfs and nfsd trees failed
Date: Mon, 15 Mar 2010 10:52:55 +1100
Message-ID: <20100315105255.4cd7359e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Mar_2010_10_52_55_+1100_99qPKqGGBAQFbcPo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36655 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753520Ab0CNXxN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Mar 2010 19:53:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__15_Mar_2010_10_52_55_+1100_99qPKqGGBAQFbcPo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's fetch of these trees failed with this error:

fatal: The remote end hung up unexpectedly

I will use the versions from next-20100312 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Mar_2010_10_52_55_+1100_99qPKqGGBAQFbcPo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuddtcACgkQjjKRsyhoI8zBhQCfZQRcM+cyJP93MU0JKPOeFjT9
dskAnREt8AsuSFAhzX7tTqbiGumTrv3q
=iGWG
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Mar_2010_10_52_55_+1100_99qPKqGGBAQFbcPo--
