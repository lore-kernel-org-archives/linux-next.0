From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-removal tree
Date: Mon, 30 Jun 2008 18:21:22 +1000
Message-ID: <20080630182122.99ea9f2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_18_21_22_+1000_7Ut4J1=NQnH4Fwhf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36074 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752544AbYF3IVb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 04:21:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust <trond.myklebust@fys.uio.no>

--Signature=_Mon__30_Jun_2008_18_21_22_+1000_7Ut4J1=NQnH4Fwhf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Today's linux-next merge of the bkl-removal tree got a trivial conflict
in fs/nfs/file.c between commit 69cc426fc4b7664ec69642cd9b30eabe2ec8ad4a
("NFS: Make nfs_llseek methods consistent") from the nfs tree and commit
a9f88f0c4fed5d1ed6fb4a0389891d327a147130 ("Remove BKL from remote_llseek
v2") from the bkl-removal tree.

I fixed it up and can carry it.  Or maybe you should liaise with Trond to
put ths nfs part of the BKL removal in his tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_18_21_22_+1000_7Ut4J1=NQnH4Fwhf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhol4IACgkQjjKRsyhoI8x/sACfaAwCoA6e12ZWer2wtpqO2+9y
QaAAnAmE7KsbBr07YUL5znl83Q2/KD7d
=PTNL
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_18_21_22_+1000_7Ut4J1=NQnH4Fwhf--
