From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Wed, 29 Aug 2018 10:33:49 +1000
Message-ID: <20180829103349.5cd15637@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pQ3QTpRms9=VG/v/JUkchY/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lanqing Liu <lanqing.liu@spreadtrum.com>, Baolin Wang <baolin.wang@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/pQ3QTpRms9=VG/v/JUkchY/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/clk.h:16,
                 from drivers/spi/spi-sprd.c:4:
drivers/spi/spi-sprd.c: In function 'sprd_spi_init_hw':
drivers/spi/spi-sprd.c:462:29: error: 'struct spi_transfer' has no member n=
amed 'word_delay'
  word_delay =3D clamp_t(u16, t->word_delay, SPRD_SPI_MIN_DELAY_CYCLE,
                             ^~

(and many more)

Caused by commit

  e7d973a31c24 ("spi: sprd: Add SPI driver for Spreadtrum SC9860")

I have used the spi tree from next-20180828 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/pQ3QTpRms9=VG/v/JUkchY/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluF6e0ACgkQAVBC80lX
0Gzlegf9F88lNWfvLVrksn1IoiSVJPujlArPrfxSgYMGO5M4Blt3lJCQVFPLVX5R
5uclJdRyCqPPFp02bZcNJvnPp9Sbn2fOvRKbxrfVGhinbXq07pEMrspgm655f5fO
4TTnPJTcDtP4drScF8kIqqHSEH0APFO6RR3dCSKgO4bFTfBeyzimN3Dte0tl5Gon
uwyAhNLu4ARRLoTB7Xhftuwtgm1StDXycNZxS3LCz2Gj8DIMfWng68cj9j2V1xru
dQX6Rm/O+cG4Ng34o3uUaHSQ+t75Au0V/TlBBkrU7Lx/z/+4wxqMC6GALtXI74A4
J5XZpq+y0/o2OU0vhQzYddUZXhCJkg==
=O8ab
-----END PGP SIGNATURE-----

--Sig_/pQ3QTpRms9=VG/v/JUkchY/--
