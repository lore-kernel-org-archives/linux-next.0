From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the random tree
Date: Sun, 26 May 2019 20:58:51 +1000
Message-ID: <20190526205851.48679169@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9TiOUxuDquE3YUtIei3ko7p"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9TiOUxuDquE3YUtIei3ko7p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ted,

In commit

  58be0106c530 ("random: fix soft lockup when trying to read from an uninit=
ialized blocking pool")

Fixes tag

  Fixes: eb9d1bf079bb: "random: only read from /dev/random after its pool h=
as received 128 bits"

has these problem(s):

  - the ':' after the SHA1 is unexpected
  - the subject is usually surrounded by '("")'
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/9TiOUxuDquE3YUtIei3ko7p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzqcWsACgkQAVBC80lX
0Gy5nAgAhHJswXVcZV94a/e4bTys4MhF6LQsBWvb6AvWAcLBt3ht4btH74KxINjA
0LHdHnQbt9+abudMI0fhoVd20PCwkHvDAoAwjR1al2YYGOoCBNLPyFrNNjPK026F
j12m+iRoyVKtUi4IgyXKp0iWLW9WqZVGkLlxmdoNzsXgKfFOl/0bkMD9O03zkzyf
1qsSl4M0frgNtjW5hJmMkNv1+62yBQJC1Bm1ZLqaKXq1sA6icVqc/VENYiQ9iYCl
gkmwnTap+T0oaJnmb837qwRr+JphpCKUgiQxPaN8pT3CBqpbhfYLM4TYEjovT6SR
Sus6G06+48l/qc2H1TK7L5H2hxXk7Q==
=xa14
-----END PGP SIGNATURE-----

--Sig_/9TiOUxuDquE3YUtIei3ko7p--
