From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the asm-generic
 tree
Date: Tue, 19 Feb 2019 15:34:06 +1100
Message-ID: <20190219153406.5ed74b40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4l9P=MH3XyGHQkandahlrn4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Hugo Lefeuvre <hle@owl.eu.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4l9P=MH3XyGHQkandahlrn4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  include/asm-generic/iomap.h

between commit:

  e377ce8bcba0 ("iomap: add missing function args identifier names")

from the asm-generic tree and commit:

  79bf0cbd86ac ("iomap: introduce io{read|write}64_{lo_hi|hi_lo}")

from the char-misc tree.

I fixed it up (see below - though I guess the new ioread... prototypes
introduced by the char-misc tree may want "const" added to their
arguments) and can carry the fix as necessary. This is now fixed as far
as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/asm-generic/iomap.h
index cd92d32a4d87,a008f504a2d0..000000000000
--- a/include/asm-generic/iomap.h
+++ b/include/asm-generic/iomap.h
@@@ -26,26 -26,48 +26,48 @@@
   * in the low address range. Architectures for which this is not
   * true can't use this generic implementation.
   */
 -extern unsigned int ioread8(void __iomem *);
 -extern unsigned int ioread16(void __iomem *);
 -extern unsigned int ioread16be(void __iomem *);
 -extern unsigned int ioread32(void __iomem *);
 -extern unsigned int ioread32be(void __iomem *);
 +extern unsigned int ioread8(const void __iomem *addr);
 +extern unsigned int ioread16(const void __iomem *addr);
 +extern unsigned int ioread16be(const void __iomem *addr);
 +extern unsigned int ioread32(const void __iomem *addr);
 +extern unsigned int ioread32be(const void __iomem *addr);
  #ifdef CONFIG_64BIT
 -extern u64 ioread64(void __iomem *);
 -extern u64 ioread64be(void __iomem *);
 +extern u64 ioread64(const void __iomem *addr);
 +extern u64 ioread64be(const void __iomem *addr);
  #endif
 =20
+ #ifdef readq
+ #define ioread64_lo_hi ioread64_lo_hi
+ #define ioread64_hi_lo ioread64_hi_lo
+ #define ioread64be_lo_hi ioread64be_lo_hi
+ #define ioread64be_hi_lo ioread64be_hi_lo
+ extern u64 ioread64_lo_hi(void __iomem *addr);
+ extern u64 ioread64_hi_lo(void __iomem *addr);
+ extern u64 ioread64be_lo_hi(void __iomem *addr);
+ extern u64 ioread64be_hi_lo(void __iomem *addr);
+ #endif
+=20
 -extern void iowrite8(u8, void __iomem *);
 -extern void iowrite16(u16, void __iomem *);
 -extern void iowrite16be(u16, void __iomem *);
 -extern void iowrite32(u32, void __iomem *);
 -extern void iowrite32be(u32, void __iomem *);
 +extern void iowrite8(u8 value, void __iomem *addr);
 +extern void iowrite16(u16 value, void __iomem *addr);
 +extern void iowrite16be(u16 value, void __iomem *addr);
 +extern void iowrite32(u32 value, void __iomem *addr);
 +extern void iowrite32be(u32 value, void __iomem *addr);
  #ifdef CONFIG_64BIT
 -extern void iowrite64(u64, void __iomem *);
 -extern void iowrite64be(u64, void __iomem *);
 +extern void iowrite64(u64 value, void __iomem *addr);
 +extern void iowrite64be(u64 value, void __iomem *addr);
  #endif
 =20
+ #ifdef writeq
+ #define iowrite64_lo_hi iowrite64_lo_hi
+ #define iowrite64_hi_lo iowrite64_hi_lo
+ #define iowrite64be_lo_hi iowrite64be_lo_hi
+ #define iowrite64be_hi_lo iowrite64be_hi_lo
+ extern void iowrite64_lo_hi(u64 val, void __iomem *addr);
+ extern void iowrite64_hi_lo(u64 val, void __iomem *addr);
+ extern void iowrite64be_lo_hi(u64 val, void __iomem *addr);
+ extern void iowrite64be_hi_lo(u64 val, void __iomem *addr);
+ #endif
+=20
  /*
   * "string" versions of the above. Note that they
   * use native byte ordering for the accesses (on

--Sig_/4l9P=MH3XyGHQkandahlrn4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxrhz4ACgkQAVBC80lX
0GzV0wgAleV5S1teEikmp+kklJu+X1jnLVcRgXSid8HRh+PK/zETCL8op3MX8Ahp
rIG0Aoqub7IdWOKz+NZ4l63YwnQ5VdgB52dUP0t61EKqshZpsModGeSnxxLao8t/
MyXQZeACXmRbU3HdVdHE3d4wE6N4B2iOMIARjLzhA/KX1ti/zTTQVY+hI3qu687h
iPbJf9pY6PN1aphAxS0xubzZLro/hOniPg3+1/0Muvi+HOCyIrxbIT8q/7kvVHJX
Nuoy8cjf799N/VvTGNCIvvXnVk4U6F/EdbedBDzXY4YObZaNP9T9kyyRYpcrBNAM
18vvhOIENZXx1ldiMhgPSdTHdVAhyw==
=gztb
-----END PGP SIGNATURE-----

--Sig_/4l9P=MH3XyGHQkandahlrn4--
