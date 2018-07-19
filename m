From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nand tree
Date: Thu, 19 Jul 2018 12:28:06 +1000
Message-ID: <20180719122806.29121ca3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HPk84SQwlLAuqY1x5FHTTlT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/HPk84SQwlLAuqY1x5FHTTlT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boris,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/platform_device.h:14:0,
                 from drivers/mtd/nand/raw/jz4740_nand.c:19:
drivers/mtd/nand/raw/jz4740_nand.c: In function 'jz_nand_detect_bank':
drivers/mtd/nand/raw/jz4740_nand.c:358:23: warning: format '%i' expects arg=
ument of type 'int', but argument 3 has type 'size_t {aka long unsigned int=
}' [-Wformat=3D]
  dev_info(&pdev->dev, "Found chip %i on bank %i\n", chipnr, bank);
                       ^
include/linux/device.h:1397:51: note: in definition of macro 'dev_info'
 #define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
                                                   ^~~

Exposed by commit

  6968e07e8169 ("mtd: rawnand: jz4740: Allow selection of this driver when =
COMPILE_TEST=3Dy")

--=20
Cheers,
Stephen Rothwell

--Sig_/HPk84SQwlLAuqY1x5FHTTlT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltP9zYACgkQAVBC80lX
0GyucggAluG3RdLLD9WaNqGJleJ0Q2fX98PAyDO7AvxvcIIK7wcvajVSLlfbwX/4
aSQwEgewuU40aUpmCtJ7eLBzVVsuVH4Eh/FOXEZp56Co5YvimidmC/Na0VhF1UR9
z9w5Lkksji4pAhJuKeR29cskrf2cFsrQmJci1ERPOOMB6GC0vloIzOYj8QQdTVYr
k65QgKT563OQ+GvkyH/OjiQs0D2ecVIpzp98q1sqUyJ1hds/k5Us06ejBi22KCz5
XJQjJPsWYrN5oAbnps4PjmNoV97IFBfoD/gMmu3HWz+xGMFphiaK5LyBDlKqilc0
Tpzt217KtnBe9oie5DJpDCvrCY2zLA==
=ExGF
-----END PGP SIGNATURE-----

--Sig_/HPk84SQwlLAuqY1x5FHTTlT--
