From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm-soc tree
Date: Mon, 8 Oct 2018 13:32:40 +1100
Message-ID: <20181008133158.773196b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6q+9B+4RD=TZw/i2wtQxStc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/6q+9B+4RD=TZw/i2wtQxStc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  MAINTAINERS

between commits:

  81aa283c6924 ("MAINTAINERS: Add Actions Semi S900 clk entries")
  677309b0e9e6 ("MAINTAINERS: Add entry for Actions Semi Owl SoCs DMA drive=
r")

from the arm-soc tree and commit:

  9d8d47ea6ec6 ("clocksource/drivers: Unify the names to timer-* format")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index c4d323faa764,2a83f2339651..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -1218,10 -1180,7 +1218,10 @@@ N:	ow
  F:	arch/arm/mach-actions/
  F:	arch/arm/boot/dts/owl-*
  F:	arch/arm64/boot/dts/actions/
 +F:	drivers/clk/actions/
- F:	drivers/clocksource/owl-*
+ F:	drivers/clocksource/timer-owl*
 +F:	drivers/dma/owl-dma.c
 +F:	drivers/i2c/busses/i2c-owl.c
  F:	drivers/pinctrl/actions/*
  F:	drivers/soc/actions/
  F:	include/dt-bindings/power/owl-*

--Sig_/6q+9B+4RD=TZw/i2wtQxStc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6wcgACgkQAVBC80lX
0GxOpQf9GVWhh0CmrwycKME/puq63HPTgPFkgtBmFvyWjqp9spd/zQOvgQbmAsbG
E509N9jyIlZ1+sECVkqsvbWysuZeFPVALJssKbJheMP9kb3u2sW3NT16ZWZOFCYM
d+rn1+Ge4jkXmXM3/0qsL9QFpwyw/m3DJmAfGMR1nRB2VozfzYB3Bvpdwu2lqP0H
IopVjrpqOiX52C+7tg0DQPh0QrBosALnz6j19F/4JJ65N23Qx74Vtku6PnM67iWC
/aB7/qlAuAFAghMTCl07Zzz/xmc0z+ixRaJ5ixAQxibYizp+lXDD2gvm1UpddHTY
Xi51yhOfS8Zal+Xm9zasLzwGVM0LHA==
=hlwN
-----END PGP SIGNATURE-----

--Sig_/6q+9B+4RD=TZw/i2wtQxStc--
