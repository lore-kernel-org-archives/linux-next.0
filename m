From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Mon, 29 Apr 2019 14:30:03 +1000
Message-ID: <20190429143003.200eb702@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qnFLwNk6ilC8BT.+6Cznw7."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/qnFLwNk6ilC8BT.+6Cznw7.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/spi/spi-ep93xx.c: In function 'ep93xx_spi_probe':
drivers/spi/spi-ep93xx.c:654:6: warning: unused variable 'i' [-Wunused-vari=
able]
  int i;
      ^

Introduced by commit

  06a391b1621e ("spi: ep93xx: Convert to use CS GPIO descriptors")

--=20
Cheers,
Stephen Rothwell

--Sig_/qnFLwNk6ilC8BT.+6Cznw7.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzGfcsACgkQAVBC80lX
0GwECgf+OkPEcwKW0oeK3GVLfo0Ovcb3zrzOzfgQk8PfD5dLZvN6m9TQji5IUC/j
F7MBaIHRiUSZK8eNm53EoVema4yQdP9MP2Wb/ysC6TfmWseEw2tIBVebsXwgWCJp
Gvf8YLwF0jg2SbXL4fHEeDyLw/m9sWXDwOjtIpF8wp18a5zmkFkExcPgWT6ibi5S
G9Gjw3xPeLYVEq0XDz39D+T3CXqYTqC1XNXOqHOJ8eWtEnNB/BJvANmnj6vQuc3V
1VikmPAGKUwexJlc+LFbq4QracoNt5MbdoZs/YiGGrgBKgCvFIR463eFKM/SPtIl
E6BIxdpeu1kNbu0aRaObP/+y6jMF9g==
=5mZs
-----END PGP SIGNATURE-----

--Sig_/qnFLwNk6ilC8BT.+6Cznw7.--
