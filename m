From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the h8300 tree
Date: Mon, 1 Jun 2015 11:41:28 +1000
Message-ID: <20150601114128.6e91b2ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WL+K26sfBae5ubkdTl6tYJW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47054 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750704AbbFABle (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2015 21:41:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>

--Sig_/WL+K26sfBae5ubkdTl6tYJW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got conflicts in
drivers/irqchip/Kconfig and drivers/irqchip/Makefile between commit
19efb55b79f3 ("h8300: IRQ chip driver") from the h8300 tree and commit
a7c64f0e29a6 ("MIPS/IRQCHIP: Move Ingenic SoC intc driver to
drivers/irqchip") from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/irqchip/Kconfig
index 8a7d7807b596,746daf37454c..000000000000
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@@ -160,10 -164,7 +165,15 @@@ config MIPS_GI
  	bool
  	select MIPS_CM
 =20
+ config INGENIC_IRQ
+ 	bool
+ 	depends on MACH_INGENIC
+ 	default y
++
 +config RENESAS_H8300H_INTC
 +        bool
 +	select IRQ_DOMAIN
 +
 +config RENESAS_H8S_INTC
 +        bool
- 	select IRQ_DOMAIN
++	select IRQ_DOMAIN
diff --cc drivers/irqchip/Makefile
index f8efb7087760,db014e8e12c9..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -47,5 -48,4 +48,6 @@@ obj-$(CONFIG_KEYSTONE_IRQ)		+=3D irq-keys
  obj-$(CONFIG_MIPS_GIC)			+=3D irq-mips-gic.o
  obj-$(CONFIG_ARCH_MEDIATEK)		+=3D irq-mtk-sysirq.o
  obj-$(CONFIG_ARCH_DIGICOLOR)		+=3D irq-digicolor.o
+ obj-$(CONFIG_INGENIC_IRQ)		+=3D irq-ingenic.o
 +obj-$(CONFIG_RENESAS_H8300H_INTC)	+=3D irq-renesas-h8300h.o
 +obj-$(CONFIG_RENESAS_H8S_INTC)		+=3D irq-renesas-h8s.o

--Sig_/WL+K26sfBae5ubkdTl6tYJW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa7hMAAoJEMDTa8Ir7ZwVB7kP/iHX4Y7bpg1RVllqKyGMloLY
2DhbEPQKm6G7L3I2ZGPjFbt0R7KVYFJWKEwdOFaZmRLpuRsE73bCfAnG3/oBHhcT
0I1jjbaUiPma+JfuaG0MGgZu6dcvjGkin6QPPyGKO0k4Gd/hLyEJDu//1KlNfdO9
8cglLwVxLiy5mCzatP1gXzlyYSbCUaGfn8bI3jOYd9g942F09pEfPyVgMKhqfFY3
yzB4XrkqI5jbm44E04Xaw67epKYQRdi/hu4WQrRjQ985cko9Yub40Q/77w3snue7
F8XE/lpw+Z1PoOMTu4tnd0LpDpNhzvV5Iid4IkzqF0pAawIOLvk5znA5slVr9//l
cbqQaaBw5/YIc+12sv4V94KFeM5iRvaneT9OanfL2T/YITRkLKt3uPfVrgSaw0V2
B5YKn0I4ETr0Jwf+appMAnaFo/2QrL2BEgFNah5vLBTKVsq7K00h632iYHbSrAew
VsZSPnbOjiJayURD2VLimsw2jdJ8cR+sgOIJ9uvPfnJjsI+TkKpNQtnDY0NX6yds
62w4XxD624HsIe6PXpggpTfLdczS2hUaSIeZ9uMvQVCXIU/Cd0tgUFMhPE2CeUY1
ZXnKnjAyz8qdmcJZexpNFU2WPgFYVXw71NWSx4zT6vLhUF1jT5yzyV0geJF0ZDmP
l8KaerLKFVRUUwlpW3zh
=Y7BF
-----END PGP SIGNATURE-----

--Sig_/WL+K26sfBae5ubkdTl6tYJW--
