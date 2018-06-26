From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the rcu tree
Date: Wed, 27 Jun 2018 09:04:09 +1000
Message-ID: <20180627090409.60641869@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0_d1Jbnafi+6jW+m70z/BRu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/0_d1Jbnafi+6jW+m70z/BRu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Commit

  aa838e0b70e1 ("MAINTAINERS: Add Daniel Lustig as an LKMM reviewer")

is missing a Signed-off-by from its committer.

Please sort out the "Not-Yet-Signed-off-by: tags on commit

  0cd34e83b2a5 ("rcu: Make expedited GPs handle CPU 0 being offline")

Please remember that the linux-next tree is not a development tree,
it is an integration testing tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0_d1Jbnafi+6jW+m70z/BRu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsyxmkACgkQAVBC80lX
0GzLmQf/Tl4wGWJlwn5GyvF1FBaSt5DvMyhTDWK064y0wA1ZdBEz2lXoAl3NQuYf
QYdGJg1Y7kWZ0CCyQfbh9NSrGcQhWmOB2uBBoLWqfplvf9rphaFr0D5r0OlJUx+a
4F2C3lN26WV1aj+V6jHyWzW3oDJBbN+M/QTINAK5MPNpnHibhNxDE78Xkc5QeJwj
Lf8mpB+0vR2ZsQxPmblOGUpGgZt1L95ANucpRxhpULrCMWama9uCn5n8S+qtXTCC
Egbqn58GO7Bzd1WbmWwMXFnzLq1TAmMqyGgNqBmD+LBgBuaeFKc4qsL4QljdbJvt
+U8rglEJhO1UCZyueLi3LhZ4MxEszA==
=KZzI
-----END PGP SIGNATURE-----

--Sig_/0_d1Jbnafi+6jW+m70z/BRu--
