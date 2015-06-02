From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the arm and h8300
 trees
Date: Tue, 2 Jun 2015 10:41:55 +1000
Message-ID: <20150602104155.4dd7c872@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0kDuAOT/cGW9cg/7jZwwsvH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Russell King <linux@arm.linux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0kDuAOT/cGW9cg/7jZwwsvH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
drivers/irqchip/Makefile between commits 22b67acd99c0 ("ARM: 8368/1:
sa1100: move irq driver to drivers/irqchip/") from the arm tree and
eba5540f0103 ("h8300: IRQ chip driver") from the h8300 tree and commit
a7c64f0e29a6 ("MIPS/IRQCHIP: Move Ingenic SoC intc driver to
drivers/irqchip") from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/irqchip/Makefile
index ed9553322638,db014e8e12c9..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -47,6 -48,4 +48,7 @@@ obj-$(CONFIG_KEYSTONE_IRQ)		+=3D irq-keys
  obj-$(CONFIG_MIPS_GIC)			+=3D irq-mips-gic.o
  obj-$(CONFIG_ARCH_MEDIATEK)		+=3D irq-mtk-sysirq.o
  obj-$(CONFIG_ARCH_DIGICOLOR)		+=3D irq-digicolor.o
 +obj-$(CONFIG_ARCH_SA1100)		+=3D irq-sa11x0.o
 +obj-$(CONFIG_RENESAS_H8300H_INTC)	+=3D irq-renesas-h8300h.o
 +obj-$(CONFIG_RENESAS_H8S_INTC)		+=3D irq-renesas-h8s.o
+ obj-$(CONFIG_INGENIC_IRQ)		+=3D irq-ingenic.o

--Sig_/0kDuAOT/cGW9cg/7jZwwsvH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbPvYAAoJEMDTa8Ir7ZwV7vYP/A463YZVthq39mkRJF8fuvYw
/xRNZrieWJQYptY4fQTbJKSuZi5kPB4taz/pVYpaFGvAYqrkkLXHuVVvwWXB3EvW
451aWDYvvD9S975/3Pqm5jnbCm+5X4j5729IQSzYA+6AhPhIrvZ4MFQ0BBTspJ4N
soIrfYTIcVO+UOgNcJSRqO2ER/PcF8roavti/C6TWuOCJbOpSKieoFFhTXoT/YGb
CJbkPn9cRVN7DgrPoEgxKwSnT1jmJOtodYJSPzaG5kN5KmUT6MifsRduVrRCMge3
onuuUTN0tgq3A9gw0nTwtoYiCfeVGOHp0a91yK5iZ1kmPwt6HimeK6c6cN0dNGyQ
haUefUZ+uaRGpGM2n9nj7sm66dOGBrI/XgzLw6lm1BBcTb2gS0PCB7jYaBWa9C7w
6NUcAOb007bK4V+vHhBo0tGMrrsi4B+8lesp0Yqth4Q7dVkrM8Qg+m4zyQ+Jk3sQ
uB4vXtEWZdqNKG55q3kqXtGDC+OQzO2Poye1PQmnMTtZG3XmRo2/8+2kQW9xsblo
odUnR1kzH7bIDI9rf4PtsyyOtmdlh27R7I46h3NrpXHnWdWAiZSD5VccIeX5rbaN
Oukg71hPhNMMPKXx7RXSnHbEj5fPf6lw6gsZSif0fwcrNQoh3Ph93vobVi99VWAN
FtYDaDs/DPjHcvXA2ppr
=wZV2
-----END PGP SIGNATURE-----

--Sig_/0kDuAOT/cGW9cg/7jZwwsvH--
