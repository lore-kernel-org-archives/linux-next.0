From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ida tree
Date: Thu, 5 Jul 2018 15:13:23 +1000
Message-ID: <20180705151323.42944e0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k5.3lJdreFOFT4uE26K7p2v"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/k5.3lJdreFOFT4uE26K7p2v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

After merging the ida tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

lib/test_xarray.c: In function 'xa_alloc_value':
lib/test_xarray.c:39:16: error: implicit declaration of function 'xa_alloc'=
; did you mean 'ida_alloc'? [-Werror=3Dimplicit-function-declaration]
  XA_BUG_ON(xa, xa_alloc(xa, &id, xa_mk_value(index), GFP_KERNEL) !=3D 0);
                ^
lib/test_xarray.c:21:6: note: in definition of macro 'XA_BUG_ON'
  if (x) {      \
      ^

Caused by commit

  1af163b61ed6 ("xarray: Track free entries in an XArray")

I have reverted that commit for today (and the following one).

--=20
Cheers,
Stephen Rothwell

--Sig_/k5.3lJdreFOFT4uE26K7p2v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls9qPMACgkQAVBC80lX
0GwkIQf/RlTijTCA9rNpR2QIcD6N0+J2lZRywCbrGbPhctQlbbVAExWVV0dbEF8x
3py+j/WSPS+jHYdWLPTPrT7aacqXnSqLCeM4kFW5/wIr1iSWCvV9FYsftar8TntR
kVmUMu7BWlAi6jNJFzikRXGYqmEE2aKFHfEWCEugOjspG70wxRyZI4fpt/DOctQj
KZ1MoKpQC3x6Wcbr+mpfoti0YhHzo675vjIGxjh+s2O3tZoUlxUTUjBAB/7iKPrR
9N3O0HnF8MgfNAOqkZPr9TQ9oawrOpcXjF0ps6154DG2dhnYUt6NKAicJRav5ioE
e+GA+NrOPvMDuFC6tG3+kg6aVljoGQ==
=AiU3
-----END PGP SIGNATURE-----

--Sig_/k5.3lJdreFOFT4uE26K7p2v--
