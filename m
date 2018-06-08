From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the random tree
Date: Fri, 8 Jun 2018 13:37:48 +1000
Message-ID: <20180608133748.58a272d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CQuTvknR=BFhx8rb09qkq+T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>
List-Id: linux-next.vger.kernel.org

--Sig_/CQuTvknR=BFhx8rb09qkq+T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Theodore,

After merging the random tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

lib/vsprintf.c:1668:13: warning: 'have_filled_random_ptr_key' defined but n=
ot used [-Wunused-variable]
 static bool have_filled_random_ptr_key __read_mostly;
             ^~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  bfe80ed3d7c7 ("vsprintf: add command line option debug_boot_weak_hash")

--=20
Cheers,
Stephen Rothwell

--Sig_/CQuTvknR=BFhx8rb09qkq+T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsZ+gwACgkQAVBC80lX
0Gwn4QgApiEiqB/lA1gsaZfeVzvuqOU4jf2K501KHhT1/84mcCxPEzoz4QvXng6y
ps0JrT1dI2qriqKePzAnpc6dr5WrBay45qkJCUYz8TT4WzoTKaJAySP1G4eP+ItB
+XcL2iWho9dmLCPUdRZqp2qL5HJAV3DCyuH3jxJmH7MVFmYM6Vx0gD3yxZLQEu5L
ULLmM9Zsy6TaoDdcoarajyDJeeOfgo0NUPBdmpH9p1QKEpVuQqMxdKpc0NW5WD5G
8dgU2xernEpGKZejOmQJ60nhIFG2LKPzKBGx74D1RcD3pwZ21NNrj1mW/K0U/nAE
TEP/TPNZjH0lvX1JVdw3PhrNnZe+mQ==
=G6po
-----END PGP SIGNATURE-----

--Sig_/CQuTvknR=BFhx8rb09qkq+T--
