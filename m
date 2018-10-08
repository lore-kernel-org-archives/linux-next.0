From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nand tree
Date: Mon, 8 Oct 2018 11:38:42 +1100
Message-ID: <20181008113842.4bfc8cf9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I9Y6GbTDCi58uEd7kpHtA+O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/I9Y6GbTDCi58uEd7kpHtA+O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boris,

After merging the nand tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mtd/nand/raw/nand_toshiba.c: In function 'toshiba_nand_read_page_be=
nand':
drivers/mtd/nand/raw/nand_toshiba.c:54:19: warning: unused variable 'mtd' [=
-Wunused-variable]
  struct mtd_info *mtd =3D nand_to_mtd(chip);
                   ^~~
drivers/mtd/nand/raw/nand_toshiba.c: In function 'toshiba_nand_read_subpage=
_benand':
drivers/mtd/nand/raw/nand_toshiba.c:68:19: warning: unused variable 'mtd' [=
-Wunused-variable]
  struct mtd_info *mtd =3D nand_to_mtd(chip);
                   ^~~

Introduced by commit

  fe8b76ec9886 ("mtd: rawnand: toshiba: Pass a single nand_chip object to t=
he status helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/I9Y6GbTDCi58uEd7kpHtA+O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6pxIACgkQAVBC80lX
0GwYlwf/QqrgDgHgdZ82UyASexSCjKyQbQPqfLdudcMtB8y9Ed6vd71BT/tHA5ej
7WiQMbJGaR8bJsySurs9p66gntZ7GfE52j6d2TK5mt2kNpOpTjdoy1f5cXHGPrL+
AMQWyb4Rs9P70rM8E9BocUulkBRDmHNYjmyDRVNQRXujdJpFS0LlAFMzakMNHAtm
kPNluQ+YPzf24Ycw1lfYtSlBUHBYcNQt41uYcKAN/bIF3FHyHWN36GgVV+zFUkya
On558YMsmny4J6/ZcAPCU2TYfMPqNnWjp8Mayz9WH9koBUzW3vGXFS+M69pCShq1
8OlM3fNlOkKYyOuTUbdPg651cK+/dQ==
=eI42
-----END PGP SIGNATURE-----

--Sig_/I9Y6GbTDCi58uEd7kpHtA+O--
