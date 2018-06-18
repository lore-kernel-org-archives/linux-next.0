From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the xarray tree
Date: Mon, 18 Jun 2018 13:28:54 +1000
Message-ID: <20180618132854.4fcf8d5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K038ToGsmLqBz5vZHXYp4Rh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/K038ToGsmLqBz5vZHXYp4Rh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xarray tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in lib/test_xarray.o

Introduced by commit

  d968f529e39f ("xarray: Add XArray load operation")

--=20
Cheers,
Stephen Rothwell

--Sig_/K038ToGsmLqBz5vZHXYp4Rh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsnJvYACgkQAVBC80lX
0GwEbAf/Yn1C09mAEdCaDOgQL0vLc+JsNCL+YIC1YQ2HNY0ujCzG/FmNmP0F+ER3
5dKRh7FX9jkHFpCbqZFFUNusHNnmIiB6ZY+HnmPUJgCXAfUZpGknqr2BqKmmmtZq
5eahqFl6YungqruYNoMG/a9O9GpNSEzrjJ9FQCZuNx7Pq+TiTjj6/J8QMIsuI5h0
ZJGi6YPrGxAdOfqROSIBs6aMiXSZQzBevuaBVFmeCxZ+AI5uOK3JAZws2Co8CgFG
qE6LE9BMOyZvF7yeSYnqqOxeDSIJf+eGNqVi6EMavaqPmKXDfmKsG3sg4FY1oWph
j8s5CyaamMHcp1oldphUsH6i5FJboQ==
=utSZ
-----END PGP SIGNATURE-----

--Sig_/K038ToGsmLqBz5vZHXYp4Rh--
