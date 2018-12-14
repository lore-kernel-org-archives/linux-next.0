From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the irqchip tree
Date: Fri, 14 Dec 2018 14:44:06 +1100
Message-ID: <20181214144406.0dbffbc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QkpWb.PN52T/CNFEaINp=o="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/QkpWb.PN52T/CNFEaINp=o=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/io.h:25,
                 from include/linux/of_address.h:7,
                 from drivers/irqchip/irq-imx-gpcv2.c:9:
drivers/irqchip/irq-imx-gpcv2.c: In function 'imx_gpcv2_irqchip_init':
arch/arm/include/asm/io.h:96:22: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
 #define __raw_writel __raw_writel
                      ^
arch/arm/include/asm/io.h:305:29: note: in expansion of macro '__raw_writel'
 #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                             ^~~~~~~~~~~~
drivers/irqchip/irq-imx-gpcv2.c:263:4: note: in expansion of macro 'writel_=
relaxed'
    writel_relaxed(~0, reg + GPC_IMR1_CORE3);
    ^~~~~~~~~~~~~~
drivers/irqchip/irq-imx-gpcv2.c:264:3: note: here
   case 2:       /* FALLTHROUGH */
   ^~~~

Introduced by commit

  ed01edc0ab6f ("irqchip/irq-imx-gpcv2: Add support for i.MX8MQ")

This is caused by my use of -Wimplicit-fallthrough for Kees Cook.

Replacing the "/* FALLTHROUGH */"  with "/* fall through */" but on the
line above will suppress the warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/QkpWb.PN52T/CNFEaINp=o=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwTJwYACgkQAVBC80lX
0Gz4NQgAo3Za9eTrjAx4D5/hfTvrKT18e+MnsCc2J54PG+0eqjzRh60sR1NQmg/a
RfpChV8pg1r2iGdAlZoNUymdf+rxs5FrZdRs0P9mBncY43dAQOwrOdgkSHqpfYX3
5jez5hAvbzreiFqX+4h0iLqYke5/GSgHSdfQdlWnF3bNTCS8FLACcp8zqrLHFhWY
iLsn7n0DlEMJE8Tly2sJIzVwyYVMy8kqsotOwJYzo3Qj70TS1Z8JfqlKOlklTkl9
RuP5lo6nFQDpQ62db6e1vwpQAGoN4Rp1CZXbq6kk8xPhk2QUe4NicSdo7RCY3/ml
5XrYH8eQG31axVED3PG0oy+m3bh0uQ==
=5+rv
-----END PGP SIGNATURE-----

--Sig_/QkpWb.PN52T/CNFEaINp=o=--
