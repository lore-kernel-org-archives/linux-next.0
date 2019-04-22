From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the crypto tree
Date: Tue, 23 Apr 2019 07:30:36 +1000
Message-ID: <20190423073036.3fe21a5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RXB9yMIEok_3_i2o/aOAro9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brijesh Singh <brijesh.singh@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/RXB9yMIEok_3_i2o/aOAro9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f5a2aeb8b254 ("crypto: ccp - Do not free psp_master when PLATFORM_INIT fa=
ils")

Fixes tag

  Fixes: 200664d5237f ("crypto: ccp: Add SEV support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/RXB9yMIEok_3_i2o/aOAro9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+MnwACgkQAVBC80lX
0GyE/Qf9GDRYxthCAWMoXZwE1IC/uYi30qs12/bOIeesOm5T5Db3m8TalDZiYalC
GJyJfYJyZEmjxQDaQaB0ZMjkHbe1qAs7ELO5+2MlVWtXCFqEBD2ZYzkJkOAgkPqQ
fjOWk46Db5GSVUKMXgO8Q25dIvso6HZ9Zj4aS195TkelRo6bZEUfXjTizAE3/iwF
EtCyMH8ZuyKEGZYG048ItsO1Nnso4ezpSRT/RzCrT3c+wnU2e+An0avItCGXmjBn
hPJCElUYqItbnJfbr8zWUh49yVxpoITd/sdLJnTyf5BkgACVmPKbbh7YGVSUz4E1
Kur6dgY7WPLkcysTxqfm2Cu3d7r05Q==
=izbc
-----END PGP SIGNATURE-----

--Sig_/RXB9yMIEok_3_i2o/aOAro9--
