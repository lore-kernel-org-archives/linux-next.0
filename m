From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the crypto-current tree
Date: Fri, 17 May 2019 21:09:22 +1000
Message-ID: <20190517210922.70a51b83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fhNqN8siC+gvfEhd1u78a5."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Iuliana Prodan <iuliana.prodan@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fhNqN8siC+gvfEhd1u78a5.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4fa0b1f971fc ("crypto: caam - fix typo in i.MX6 devices list for errata")

Fixes tag

  Fixes: 33d69455e402 ("crypto: caam - limit AXI pipeline to a depth of

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please don't split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/fhNqN8siC+gvfEhd1u78a5.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzelmIACgkQAVBC80lX
0GxatAgAm+FtYL5tBLB+70elBaeisaAg66l8kbgzrk1MvfUTH0kregdykejfqlem
ioXbvn2bSLYCKgP4+yC9PGET9Od91qnzbFkTKW3fw/eRhVjQbDAsbPlqS+9w5m48
dUdtTwOt+55kxZZjsStnYFe/BADQZbio/tZTP+lZ9xP7TrF6QX0Hx6S+3ApvyQ8h
AQ0XUtgjEz2//EfE3y/Nw5xJloZFNJB9I4BLzzYvvth7Tn1QSveUf4mwoK/bZd7g
YN4lE5zcIBqjMLwBqzFqoNEPUMmpsXyBfC7e6ywhjNV9CHXZxQtwFcXjgx+u8tI0
DRnruLjuwiEcRgmjG/Uo0aD3zzkJXw==
=14pw
-----END PGP SIGNATURE-----

--Sig_/fhNqN8siC+gvfEhd1u78a5.--
