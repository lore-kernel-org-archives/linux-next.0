From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nand tree
Date: Mon, 9 Jul 2018 11:51:15 +1000
Message-ID: <20180709115115.354d625f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i_a.lkinMZ57zMQzJgIFBZR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/i_a.lkinMZ57zMQzJgIFBZR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boris,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_hwcontrol':
drivers/mtd/nand/raw/davinci_nand.c:115:21: warning: cast to pointer from i=
nteger of different size [-Wint-to-pointer-cast]
   nand->IO_ADDR_W =3D (void __iomem __force *)addr;
                     ^
drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_select_chip':
drivers/mtd/nand/raw/davinci_nand.c:132:25: warning: cast to pointer from i=
nteger of different size [-Wint-to-pointer-cast]
  info->chip.IO_ADDR_W =3D (void __iomem __force *)addr;
                         ^
In file included from arch/x86/include/asm/bug.h:83:0,
                 from include/linux/bug.h:5,
                 from include/linux/thread_info.h:12,
                 from arch/x86/include/asm/preempt.h:7,
                 from include/linux/preempt.h:81,
                 from include/linux/spinlock.h:51,
                 from include/linux/seqlock.h:36,
                 from include/linux/time.h:6,
                 from include/linux/stat.h:19,
                 from include/linux/module.h:10,
                 from drivers/mtd/nand/raw/davinci_nand.c:27:
drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_correct_4bit=
':
drivers/mtd/nand/raw/davinci_nand.c:322:21: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]
  if (WARN_ON(0x01 & (unsigned) ecc_code))
                     ^
include/asm-generic/bug.h:112:25: note: in definition of macro 'WARN_ON'
  int __ret_warn_on =3D !!(condition);    \
                         ^~~~~~~~~
drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_read_buf':
drivers/mtd/nand/raw/davinci_nand.c:444:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]
  if ((0x03 & ((unsigned)buf)) =3D=3D 0 && (0x03 & len) =3D=3D 0)
               ^
drivers/mtd/nand/raw/davinci_nand.c:446:20: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]
  else if ((0x01 & ((unsigned)buf)) =3D=3D 0 && (0x01 & len) =3D=3D 0)
                    ^
drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_write_buf':
drivers/mtd/nand/raw/davinci_nand.c:457:15: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]
  if ((0x03 & ((unsigned)buf)) =3D=3D 0 && (0x03 & len) =3D=3D 0)
               ^
drivers/mtd/nand/raw/davinci_nand.c:459:20: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]
  else if ((0x01 & ((unsigned)buf)) =3D=3D 0 && (0x01 & len) =3D=3D 0)
                    ^
drivers/mtd/nand/raw/davinci_nand.c: In function 'nand_davinci_probe':
drivers/mtd/nand/raw/davinci_nand.c:683:18: warning: cast from pointer to i=
nteger of different size [-Wpointer-to-int-cast]
  info->ioaddr  =3D (uint32_t __force) vaddr;
                  ^
drivers/mtd/nand/raw/atmel/nand-controller.c: In function 'atmel_smc_nand_c=
ontroller_init':
drivers/mtd/nand/raw/atmel/nand-controller.c:2053:21: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]
  nc->ebi_csa_offs =3D (unsigned int)match->data;
                     ^
drivers/mtd/nand/raw/sunxi_nand.c: In function 'sunxi_nfc_hw_ecc_read_chunk=
s_dma':
drivers/mtd/nand/raw/sunxi_nand.c:130:22: warning: large integer implicitly=
 truncated to unsigned type [-Woverflow]
 #define NFC_PAGE_OP  (2 << 30)
                      ^
drivers/mtd/nand/raw/sunxi_nand.c:1040:9: note: in expansion of macro 'NFC_=
PAGE_OP'
  writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
         ^~~~~~~~~~~
drivers/mtd/nand/raw/sunxi_nand.c: In function 'sunxi_nfc_hw_ecc_write_page=
_dma':
drivers/mtd/nand/raw/sunxi_nand.c:130:22: warning: large integer implicitly=
 truncated to unsigned type [-Woverflow]
 #define NFC_PAGE_OP  (2 << 30)
                      ^
drivers/mtd/nand/raw/sunxi_nand.c:1406:9: note: in expansion of macro 'NFC_=
PAGE_OP'
  writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
         ^~~~~~~~~~~

Presumably exposed by commits

  347af8918e8a ("mtd: rawnand: davinci: Allow selection of this driver when=
 COMPILE_TEST=3Dy")
  b3d926a3d6e0 ("mtd: rawnand: sunxi: Allow selection of this driver when C=
OMPILE_TEST=3Dy")

--=20
Cheers,
Stephen Rothwell

--Sig_/i_a.lkinMZ57zMQzJgIFBZR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltCv5MACgkQAVBC80lX
0GyO/gf+NT2k46jcLeQD7Gq6Lnim2lRhq4I3PTHceLvqQ0k9lccX7Ptj2GKxsrim
Tru91HOwjfGcUkWV4hfv5BTKr/CZzhti1Zg2yAh6FGxo+g4yiX9ac5kiLcWdenGl
+0vPW0rpKalOnQCARPbG1qnZgCe6NBaazkM7Ycx919Yf8B325NtyNdjSPvnI9R5L
kKac0UFFXGFvsRlEeM7BfOsgrgTxqzuZXbi9e8L2OulxWgiNDmfa95CPx9Z1r5pj
RbFhf801PCBHdpl6myAjytngBZWnChTbdLD0UDVKmRxdOLXgKXISTs3PEw8jvdRz
/kWqFOhd/2XNmu+km+MsjMccnBxIJg==
=wuB2
-----END PGP SIGNATURE-----

--Sig_/i_a.lkinMZ57zMQzJgIFBZR--
