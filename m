From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Wed, 14 Nov 2018 13:18:44 +1100
Message-ID: <20181114131844.57c4cdc7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5f3EPhnFLnSgg2zs24/CD3y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5f3EPhnFLnSgg2zs24/CD3y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/spi/spi-npcm-pspi.c: In function 'npcm_pspi_recv':
drivers/spi/spi-npcm-pspi.c:226:17: warning: 'val' may be used uninitialize=
d in this function [-Wmaybe-uninitialized]
   *priv->rx_buf =3D val;
   ~~~~~~~~~~~~~~^~~~~

Introduced by commit

  2a22f1b30cee ("spi: npcm: add NPCM PSPI controller driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/5f3EPhnFLnSgg2zs24/CD3y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvrhgQACgkQAVBC80lX
0GwXmwf+L7MaZLWwEA55feuVGMgIrYpNcZVcSFHNl/WE8OoGoyvMOTdtoTpHXPhe
0KWX2GCoEMYeruXR14lvZEwefVLeFF7dwf5u8zA0tXiIGX6j3Tg88ld/PacrCp6U
yh9hjylLdcVBIHEnI0HuIDO0LJ6BWoBIDArsOPnp5a7IgsC36gIiaiuLLzhQWwuX
02pl8fu0t3VmbQjvHBWyP0Xz8+vS0Wf8nKGPmTqOC7KZFqcYWc+LdXIXetc6F+kj
RnmrB1Q7c06xJW8CLXe6IGe8O5JOvqPDww4pIedbxhzPzNz3Duu/QPfqgLUHMIhy
oKsibhURMoxk3ewvU7R+X0KfvXO8Ug==
=vbCi
-----END PGP SIGNATURE-----

--Sig_/5f3EPhnFLnSgg2zs24/CD3y--
