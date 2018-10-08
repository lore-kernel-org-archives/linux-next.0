From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with the vfs tree
Date: Mon, 8 Oct 2018 11:03:19 +1100
Message-ID: <20181008110320.2597e3d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SATp6qxSk=.N3Oj+J=eHjRo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/SATp6qxSk=.N3Oj+J=eHjRo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/Kconfig

between commit:

  f57d445eb317 ("Make anon_inodes unconditional")

from the vfs tree and commit:

  914e5d7d4697 ("RDMA: Fix building with CONFIG_MMU=3Dn")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/Kconfig
index 176b943dfec9,0a3ec7c726ec..000000000000
--- a/drivers/infiniband/Kconfig
+++ b/drivers/infiniband/Kconfig
@@@ -25,6 -25,8 +25,7 @@@ config INFINIBAND_USER_MA
 =20
  config INFINIBAND_USER_ACCESS
  	tristate "InfiniBand userspace access (verbs and CM)"
 -	select ANON_INODES
+ 	depends on MMU
  	---help---
  	  Userspace InfiniBand access support.  This enables the
  	  kernel side of userspace verbs and the userspace

--Sig_/SATp6qxSk=.N3Oj+J=eHjRo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6nsgACgkQAVBC80lX
0GwDzgf/QT0194qWd27r3opEUyyTr7iswkiaVzqN8gl2zR69duvPhCrIrZC13W6p
S6/h4msZku4py0RPzz1nO/hkQ2i86Fe4oSq57PQWAcTTdHa8gMxI0neANAPBYY5R
4E+Hzi3D2vPPx+KgLDWKEH5SxlC8Pqc4qBFJtgczjiWTnnCHeY5B2Rck15xOBeAA
Ncn0RdeNH2RJbKLrsxpI9uTW9VIXCjLDsgXlsQvdBawZ2FdN77Iny/jjAPbFJxCs
Rysabc/DOgPTZ+a21OtwZBSDBZYxC2WpRe+SPfXo5JRcWldY75Iu0GAb55Z9lAUV
n+Tvw5Q92RVDMuryAIWr2lzuuXwYkQ==
=+0PC
-----END PGP SIGNATURE-----

--Sig_/SATp6qxSk=.N3Oj+J=eHjRo--
