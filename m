From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in Linus' tree
Date: Thu, 21 Feb 2019 07:38:35 +1100
Message-ID: <20190221073835.7a18f007@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n5nf79UKNxZ+c28yIBKyNxN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, James Morris <james.morris@microsoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/n5nf79UKNxZ+c28yIBKyNxN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  822ad64d7e46 ("keys: Fix dependency loop between construction record and =
auth key")

Fixes tag

  Fixes: 7ee02a316600 ("keys: Fix dependency loop between construction reco=
rd and auth key")

has these problem(s):

  - Target SHA1 does not exist

--=20
Cheers,
Stephen Rothwell

--Sig_/n5nf79UKNxZ+c28yIBKyNxN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxtussACgkQAVBC80lX
0GxO8AgApex+74qOgOh2047i2KJe/fCQk/X+t9m9uLFdZF/gho78BfoFGTGRkVAv
aPUqizKZRX/PrYkxWShAdxXbSLXiyhbIDvhtspnOAsGpH2/oWHXRY2N91i++0w+r
Lso14pXoPRF0svi+E9cTjFWd8hJleuIlTbsKNSdyOkSlrvEqvJwLZKr0eOf55aea
1PLcY9nbb+jVX0RsNCj6HakxUy3XRSt99h42zrScWdKvoYJk/8hWo5HTtDociGz7
i16wjhKqZBh8derwrFNJVean4jxDET8yGSGGdsLPiFRL14SXEWXd5BPaj0bUbZOG
rve+ee5j1WE7mqp3/ODBcLyF8oAJCQ==
=m1GQ
-----END PGP SIGNATURE-----

--Sig_/n5nf79UKNxZ+c28yIBKyNxN--
