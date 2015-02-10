From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfsd tree with the nfs tree
Date: Tue, 10 Feb 2015 11:55:49 +1100
Message-ID: <20150210115549.6067ffc1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/exK0b7RW2F_NS.aRUhlhyCB"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57020 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932287AbbBJAz4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2015 19:55:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Haynes <loghyr@primarydata.com>, Christoph Hellwig <hch@lst.de>

--Sig_/exK0b7RW2F_NS.aRUhlhyCB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

Today's linux-next merge of the nfsd tree got a conflict in
include/linux/nfs4.h between commit d67ae825a59d ("pnfs/flexfiles: Add
the FlexFile Layout Driver") from the nfs tree and commit 6cae0a4648c0
("nfs: add LAYOUT_TYPE_MAX enum value") from the nfsd tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/nfs4.h
index de7c91ca427e,bc10d687f2ce..000000000000
--- a/include/linux/nfs4.h
+++ b/include/linux/nfs4.h
@@@ -516,7 -517,7 +517,8 @@@ enum pnfs_layouttype=20
  	LAYOUT_NFSV4_1_FILES  =3D 1,
  	LAYOUT_OSD2_OBJECTS =3D 2,
  	LAYOUT_BLOCK_VOLUME =3D 3,
 +	LAYOUT_FLEX_FILES =3D 4,
+ 	LAYOUT_TYPE_MAX
  };
 =20
  /* used for both layout return and recall */

--Sig_/exK0b7RW2F_NS.aRUhlhyCB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2VcaAAoJEMDTa8Ir7ZwV6p0P/RL0D/IJymx426MjFAO/2F6z
DthEfgQk1c+WJPm1+rpUI0K+UypBMt+c/zRY+vjL5PK+vNbIYb34BxaGQtqllJsS
GAv5wPq6t8Q1VOvqBmYB0AdbZafgRfEKiZgFcbBAtq6f+CyeIwfKMnYiCKwK7o25
iJsWNSOd58Xb98dT/zGuNKXXSRkVQTtedk0vW35z8uOOOUw25XhoAZr9gTRj1BQa
7U5+6hYidqYpUc4fefd+zXh9oia8S18uFESafFhwv620/UczGKhtGYUOxP3GC6wl
Rr66j7iVmJ5zbFxXhwHH8GMffhOvf7PzZIYr7JLSZ8bvVCvVYnSAVaI4C0eut5Ym
LU5XPh7C8GmfTZgTW+n9VvCPr/Kd8Tg6waX2zKwz7NGNQjFegtYspQSRhA6KzPq0
XOiVUkR0huZwGB6f1JA7PHo95vt57qrL+lsgaOB8CrDu2r6zVIcRwc3jRdiH43Hd
E7JcvF1F3KEqzb7lVrLGHQtUIMa7+K+czt2xykv05trcdZOyzM7sYp/JP8lIvygx
XxNJ8OFrXT6p4AHOpGrr3ipfiTFGWmsh4voSxJeM2oOL1qOo3nmw6feN8F77AUgc
G31Arwi1M7kP1GIQOyWTHulzIMSkZRDIn2jAvuoXrHdXgza/YZ3TC2j8ITsX3pJf
ofhC2sJyPuDEPnbKJEuZ
=22bo
-----END PGP SIGNATURE-----

--Sig_/exK0b7RW2F_NS.aRUhlhyCB--
