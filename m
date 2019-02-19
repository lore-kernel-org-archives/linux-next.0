From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the asm-generic tree
Date: Tue, 19 Feb 2019 17:36:54 +1100
Message-ID: <20190219173654.47e9bc36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/erXL9gtqk3srxR_XUm_zKYo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hugo Lefeuvre <hle@owl.eu.com>
List-Id: linux-next.vger.kernel.org

--Sig_/erXL9gtqk3srxR_XUm_zKYo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

After merging the asm-generic tree, today's linux-next build (powerpc
allnoconfig) failed like this:

arch/powerpc/kernel/iomap.c:18:14: error: conflicting types for 'ioread8'
 unsigned int ioread8(void __iomem *addr)
              ^~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:29:21: note: previous declaration of 'ioread8' =
was here
 extern unsigned int ioread8(const void __iomem *addr);
                     ^~~~~~~
arch/powerpc/kernel/iomap.c:22:14: error: conflicting types for 'ioread16'
 unsigned int ioread16(void __iomem *addr)
              ^~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:30:21: note: previous declaration of 'ioread16'=
 was here
 extern unsigned int ioread16(const void __iomem *addr);
                     ^~~~~~~~
arch/powerpc/kernel/iomap.c:26:14: error: conflicting types for 'ioread16be'
 unsigned int ioread16be(void __iomem *addr)
              ^~~~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:31:21: note: previous declaration of 'ioread16b=
e' was here
 extern unsigned int ioread16be(const void __iomem *addr);
                     ^~~~~~~~~~
arch/powerpc/kernel/iomap.c:30:14: error: conflicting types for 'ioread32'
 unsigned int ioread32(void __iomem *addr)
              ^~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:32:21: note: previous declaration of 'ioread32'=
 was here
 extern unsigned int ioread32(const void __iomem *addr);
                     ^~~~~~~~
arch/powerpc/kernel/iomap.c:34:14: error: conflicting types for 'ioread32be'
 unsigned int ioread32be(void __iomem *addr)
              ^~~~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:33:21: note: previous declaration of 'ioread32b=
e' was here
 extern unsigned int ioread32be(const void __iomem *addr);
                     ^~~~~~~~~~
arch/powerpc/kernel/iomap.c:142:6: error: conflicting types for 'ioread8_re=
p'
 void ioread8_rep(void __iomem *addr, void *dst, unsigned long count)
      ^~~~~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:82:13: note: previous declaration of 'ioread8_r=
ep' was here
 extern void ioread8_rep(const void __iomem *port, void *buf, unsigned long=
 count);
             ^~~~~~~~~~~
arch/powerpc/kernel/iomap.c:146:6: error: conflicting types for 'ioread16_r=
ep'
 void ioread16_rep(void __iomem *addr, void *dst, unsigned long count)
      ^~~~~~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:83:13: note: previous declaration of 'ioread16_=
rep' was here
 extern void ioread16_rep(const void __iomem *port, void *buf, unsigned lon=
g count);
             ^~~~~~~~~~~~
arch/powerpc/kernel/iomap.c:150:6: error: conflicting types for 'ioread32_r=
ep'
 void ioread32_rep(void __iomem *addr, void *dst, unsigned long count)
      ^~~~~~~~~~~~
In file included from arch/powerpc/include/asm/io.h:653,
                 from include/linux/io.h:25,
                 from include/linux/irq.h:20,
                 from arch/powerpc/include/asm/hardirq.h:6,
                 from include/linux/hardirq.h:9,
                 from include/linux/interrupt.h:11,
                 from include/linux/pci.h:32,
                 from arch/powerpc/kernel/iomap.c:7:
include/asm-generic/iomap.h:84:13: note: previous declaration of 'ioread32_=
rep' was here
 extern void ioread32_rep(const void __iomem *port, void *buf, unsigned lon=
g count);
             ^~~~~~~~~~~~

Caused by commit

  8e074c243ed3 ("iomap: add missing const to ioread*/iowrite addr arg")

The const qualifiers are also missing in:

arch/parisc/lib/iomap.c
arch/sh/kernel/iomap.c

I have reverted that commit for today.

BTW, that commit only added the const to the ioread* functions ...
--=20
Cheers,
Stephen Rothwell

--Sig_/erXL9gtqk3srxR_XUm_zKYo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrpAYACgkQAVBC80lX
0Gxx1wf+O0ZHOKq4GG22Nbh/5mbDKPOYSrn6Zu2VPdTzoZxZFR7F7BMdoYv9s4ir
KrVYUCIFs+2fRr9fV1iD4bQg1ka6kO5TEsE8s89Y+7sruYy8sdblcKKNc4ak14ge
BfP+2a6n8CHvWanozOAM82+nOJqfD4Itv/pMbyfwGvBymonLUlfJY5NCTDO2QOIw
Inq9zAZfBH16+56RRtXPwMLIOSGJcXksa/AcYRXZea7Zw/sD1ARILJb5GKX0+rI6
yFKJq2VFOcT4BrDHUGqlkCYRzR+Mf0M7TaRoV/ilyH45A9a0AUhD79JOUT9QmPSA
0ry4saWfXKNDvn9WR6pOr1MfdaG6Rw==
=NwSv
-----END PGP SIGNATURE-----

--Sig_/erXL9gtqk3srxR_XUm_zKYo--
