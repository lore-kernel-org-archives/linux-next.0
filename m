From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Fri, 3 Aug 2018 14:37:43 +1000
Message-ID: <20180803143743.37978047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bgZm_X=yja8uZ2YMjbktdsg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frieder Schrempf <frieder.schrempf@exceet.de>, Boris Brezillon <boris.brezillon@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bgZm_X=yja8uZ2YMjbktdsg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/spi/spi-mem.c: In function 'spi_mem_probe':
drivers/spi/spi-mem.c:375:13: warning: assignment discards 'const' qualifie=
r from pointer target type [-Wdiscarded-qualifiers]
   mem->name =3D ctlr->mem_ops->get_name(mem);
             ^
drivers/spi/spi-mem.c:377:13: warning: assignment discards 'const' qualifie=
r from pointer target type [-Wdiscarded-qualifiers]
   mem->name =3D dev_name(&spi->dev);
             ^

Introduced by commit

  5d27a9c8ea9e ("spi: spi-mem: Extend the SPI mem interface to set a custom=
 memory name")

"const" is good :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/bgZm_X=yja8uZ2YMjbktdsg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltj3BcACgkQAVBC80lX
0GzvnAgAkNkyIabc6S0z8LmOEsbtfv3V7qM8W/uWwZJ3uglrd478Ohi7p5fFpqRZ
lAwqh1iWP912Ll7J/CFn2uxoFiyyaaTL585jhzk7s+BvR/KXAej2j3hK5FBWp1ep
rpHA1ZhgKeFO2NatP2SlKhbjuSzKEicP7Ez+FFb8HGPoTbtv6kOJKUEELMcp9IPQ
TovnLdq4DfGy7gQzB79jrvh1uHyjHLZEMps2e+SrHzyxWC/KivTitnG2pytBw9mo
PlxE8pHc2YjCSE/VXWE4mkIn25/9rM/ZoxGDGex4c6QGMHdRYB3eJXs57HM+PWfW
pGh3lTtZ3++jMtcRk6TONPD1PKr/rw==
=jq7K
-----END PGP SIGNATURE-----

--Sig_/bgZm_X=yja8uZ2YMjbktdsg--
