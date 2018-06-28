From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Fri, 29 Jun 2018 08:14:05 +1000
Message-ID: <20180629081405.448f9296@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/U//oadUTyerfbGXo2YR_t=K"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ursula Braun <ubraun@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/U//oadUTyerfbGXo2YR_t=K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net tree got a conflict in:

  net/smc/af_smc.c

between commit:

  a11e1d432b51 ("Revert changes to convert to ->poll_mask() and aio IOCB_CM=
D_POLL")

from Linus' tree and commit:

  24ac3a08e658 ("net/smc: rebuild nonblocking connect")

from the net tree.

I did the obvious syntactic fix up but, given that the commit that the
net tree commit is fixing ie being reverted, I wonder if the net tree
commit is needed (or correct?) any more.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/U//oadUTyerfbGXo2YR_t=K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1Xa0ACgkQAVBC80lX
0GwCIwf/Tx5E8E3MKxblgBLwIElwAqw65GTKhLkiH4XuGvlOJ2vHq64hHM/AaOzF
dJf1zcNRlp0uthIrt/AYS6tyEy8FHGeVH8UFW4KXC2xx7OJY5Mb3tdTVdP6q3q8c
WSCrR3jSa7VibmPDKTCuFVHyN5fz4Ei/kSX3Op8xLnd/4nMAbjmk6a3dibk6lVVs
xlLf0ZTGs00Ou88OymSM9Dmdn7Q47w6Utaoq97qPtUoKFulcykbL+W7LgU+07AwN
fQx2VcnUiXNAsyIo6IkBqnjm8R2TKODqUKy5UeXCnhz5IK4StpaFcqvgl6qA/uhZ
2JlU/xNb1xrEXwZA5pYebptluTWcAQ==
=cFIX
-----END PGP SIGNATURE-----

--Sig_/U//oadUTyerfbGXo2YR_t=K--
