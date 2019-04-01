From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nand tree
Date: Tue, 2 Apr 2019 10:14:31 +1100
Message-ID: <20190402101431.6708cb70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SM73UD2MzyaV1d/mseq/PqO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-next.vger.kernel.org

--Sig_/SM73UD2MzyaV1d/mseq/PqO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:26:5: error: redefinition of 'in=
genic_ecc_calculate'
 int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
     ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:39:5: note: previous definition =
of 'ingenic_ecc_calculate' was here
 int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
     ^~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:47:5: error: redefinition of 'in=
genic_ecc_correct'
 int ingenic_ecc_correct(struct ingenic_ecc *ecc,
     ^~~~~~~~~~~~~~~~~~~
In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:46:5: note: previous definition =
of 'ingenic_ecc_correct' was here
 int ingenic_ecc_correct(struct ingenic_ecc *ecc,
     ^~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:93:21: error: redefinition of 'o=
f_ingenic_ecc_get'
 struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *of_node)
                     ^~~~~~~~~~~~~~~~~~
In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:57:21: note: previous definition=
 of 'of_ingenic_ecc_get' was here
 struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *np)
                     ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:119:6: error: redefinition of 'i=
ngenic_ecc_release'
 void ingenic_ecc_release(struct ingenic_ecc *ecc)
      ^~~~~~~~~~~~~~~~~~~
In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:53:6: note: previous definition =
of 'ingenic_ecc_release' was here
 void ingenic_ecc_release(struct ingenic_ecc *ecc)
      ^~~~~~~~~~~~~~~~~~~

Caused by commit

  8278ad0d709a ("mtd: rawnand: ingenic: Separate top-level and SoC specific=
 code")

I have used the nand tree from next-20190401 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/SM73UD2MzyaV1d/mseq/PqO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyim1cACgkQAVBC80lX
0Gxc7Qf7BDBnlFq4x0Gl/qDEcR1JZXDwErU+hl/CpawP7jzDIkej3XshiflwD3kb
csiQjVgZfRepy7ekZfGHHF9x1SPp6sYXZ+pOHzSbdzQYaTtyW+ubAdiu0G7asc2r
jVTABrp7BdrDlJVxopWl/hlSuV7rcIf2OYKTZIcr4q4ka6ZVe0LwJzphYF25GseU
nDGCLuaQvZQuZ1mHdAdrFiKsfGchrtnNBfMCRiBfWwWLFMO2OhOfEoZkRPCJyruh
xj3YlagoQuzA3bi+EAs+YvNUQ3MhkK+n6/p3qTeRIMFDK0ZMO/rY/bGKYmyXECeu
bg8+trV2gJUGkqoD6vUT3nPOzqTQkw==
=RsTs
-----END PGP SIGNATURE-----

--Sig_/SM73UD2MzyaV1d/mseq/PqO--
