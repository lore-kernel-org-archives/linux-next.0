From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the spi-fixes tree
Date: Tue, 2 Apr 2019 04:58:28 +1100
Message-ID: <20190402045828.699f5700@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YE/xY76rigPlK8m2vOrcty0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YE/xY76rigPlK8m2vOrcty0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

In commit

  019194933339 ("spi: tegra114: reset controller on probe")

Fixes tag

  Fixes: SPI driver can be built as module so perform SPI controller reset

has these problem(s):

  - No SHA1 recognised

In commit

  f4ce428c41fb ("spi: tegra114: configure dma burst size to fifo trig level=
")

Fixes tag

  Fixes: Configure DMA burst size to be same as SPI TX/RX trigger levels

has these problem(s):

  - No SHA1 recognised

In commit

  c4fc9e5b28ff ("spi: tegra114: flush fifos")

Fixes tag

  Fixes: Flush TX and RX FIFOs before start of new transfer and on FIFO

has these problem(s):

  - No SHA1 recognised

In commit

  32bd1a9551ca ("spi: tegra114: terminate dma and reset on transfer timeout=
")

Fixes tag

  Fixes: terminate DMA and perform controller reset on transfer timeout

has these problem(s):

  - No SHA1 recognised

In commit

  1a89ac5b9189 ("spi: tegra114: fix for unpacked mode transfers")

Fixes tag

  Fixes: computation of actual bytes to fill/receive in/from FIFO in unpack=
ed

has these problem(s):

  - No SHA1 recognised

In commit

  7b3d10cdf54b ("spi: tegra114: clear packed bit for unpacked mode")

Fixes tag

  Fixes: Clear packed bit when not using packed mode.

has these problem(s):

  - No SHA1 recognised

--=20
Cheers,
Stephen Rothwell

--Sig_/YE/xY76rigPlK8m2vOrcty0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyiUUQACgkQAVBC80lX
0Gwa0gf/Rmt3xgQGd6sDTjIszOYyPmFEMxd6BrbE/1XaCvnMytytW2G+0Sbk1RW2
e+xhO2D6N8hQck1EsWEZ9d5VZdHONXMqqjiuwlkyK6KORREoX8ORmHm4HNOwdfK4
KQZ+rskrfpylpj1JR1zE74F2XteAM9t+4XJj6wI26wwfkinTR7CISIr+FHt04XJe
90h7MJtwBxVaBv0j4BhdyyCP4FBT5v9c6cSSa6JmctuoO1smkjD3dNeym068UJFP
MFyOYVnjuqQS85I2lAIFtzeTtoIBqe6Zs8ul2Z497aM1h5oOl/mbTO173C4VATYI
qss4uEx9aN8RXDiPTZAp7eyV3npcZw==
=87um
-----END PGP SIGNATURE-----

--Sig_/YE/xY76rigPlK8m2vOrcty0--
