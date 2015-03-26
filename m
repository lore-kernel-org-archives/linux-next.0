From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the imx-mxs tree
Date: Thu, 26 Mar 2015 12:52:40 +1100
Message-ID: <20150326125240.376bbc65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kzNgqu.02gqhSgJlTP7.tp2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Jason Cooper <jason@lakedaemon.net>, Kevin Cernekee <cernekee@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kzNgqu.02gqhSgJlTP7.tp2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
drivers/irqchip/Makefile between commit 0494e11aafc7 ("irqchip:
vf610-mscm-ir: Add support for Vybrid MSCM interrupt router") from the
imx-mxs tree and commit 8a1a20290487 ("IRQCHIP: Add new driver for
BCM7038-style level 1 interrupt controllers") from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/irqchip/Makefile
index 9176c76eb164,89e45613de76..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -37,7 -37,7 +37,8 @@@ obj-$(CONFIG_TB10X_IRQC)		+=3D irq-tb10x.
  obj-$(CONFIG_XTENSA)			+=3D irq-xtensa-pic.o
  obj-$(CONFIG_XTENSA_MX)			+=3D irq-xtensa-mx.o
  obj-$(CONFIG_IRQ_CROSSBAR)		+=3D irq-crossbar.o
 +obj-$(CONFIG_SOC_VF610)			+=3D irq-vf610-mscm-ir.o
+ obj-$(CONFIG_BCM7038_L1_IRQ)		+=3D irq-bcm7038-l1.o
  obj-$(CONFIG_BCM7120_L2_IRQ)		+=3D irq-bcm7120-l2.o
  obj-$(CONFIG_BRCMSTB_L2_IRQ)		+=3D irq-brcmstb-l2.o
  obj-$(CONFIG_KEYSTONE_IRQ)		+=3D irq-keystone.o

--Sig_/kzNgqu.02gqhSgJlTP7.tp2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE2ZtAAoJEMDTa8Ir7ZwVCOEQAINJbkRqPSnhYQ1S2+/A1V59
CH+oPBdc/WylPt6Qcwdz2PRtliiSoKOOFUP6kdaXk/fMaafVCWZqQUaPrKyv27fh
xASdUfnnKp5uwz/u/a9JBl1BPcM6N21qWNdcS4gmL564zri/jZD8YLQAPM0lZyaQ
t/7UUQZB9cMK24IEymvf6KbNM41CBoZIBKh+0X6NVyUEFSzfoghw1y2KIRlVkt+d
rmBXaczWGZaAUGI8CgejsnjgJ5gEa06HIdSScGKMgZFkHoO6SVwin+L6QhdMG4m1
Ddxn6Mx1yBaCaOKeuANqJfrBTtaoFDfVa6RqdylqKSXRJqetO37UNHs5W6X6+3n7
s98HKsloihWUca3BI+bwfDW9LbJDQdHlK5PUWXdg4Z7QXFdirqEOUn41ujsRd8bC
uYyQ4KG0uZl0ggClrAXsbCJPgJevkMrqngFWWXOOjHNTWXzabG9kP+S/rLHVw9Cx
UxkWabWZvgjO6V3UQjUrpa0GpGgHXeCyUvPuVMWMtlSYGPwNQT52a+BCf5yL0ovO
3sjl+3TuS6CSvrJhUVn3Z8TS/PLFLuwoqF+/r05RKr10DvuHtP2eoUBimA0MkLtN
1zHnr0ALkiwf+JV/N64uvI3Gfcrpd56y1OFOL+WoVeet4h/2432FcuiCyQ3Qj6t/
SYB56iwsw4raMOqHq880
=DSyo
-----END PGP SIGNATURE-----

--Sig_/kzNgqu.02gqhSgJlTP7.tp2--
