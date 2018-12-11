From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Tue, 11 Dec 2018 17:02:42 +1100
Message-ID: <20181211170242.21fd4594@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D=xEj0+=rKQhB8Pr7lnnvVH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qian Cai <cai@lca.pw>, Andrey Konovalov <andreyknvl@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/D=xEj0+=rKQhB8Pr7lnnvVH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/include/asm/memory.h

between commit:

  6e8830674ea7 ("arm64: kasan: Increase stack size for KASAN_EXTRA")

from the arm64 tree and commit:

  2a4689e7f69c ("kasan, arm64: adjust shadow size for tag-based mode")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/memory.h
index f771452d08c4,1235fa492307..000000000000
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@@ -77,19 -65,13 +68,18 @@@
  #define KERNEL_END        _end
 =20
  /*
-  * KASAN requires 1/8th of the kernel virtual address space for the shadow
-  * region. KASAN can bloat the stack significantly, so double the (minimu=
m)
-  * stack size when KASAN is in use, and then double it again if KASAN_EXT=
RA is
-  * on.
+  * Generic and tag-based KASAN require 1/8th and 1/16th of the kernel vir=
tual
+  * address space for the shadow region respectively. They can bloat the s=
tack
 - * significantly, so double the (minimum) stack size when they are in use.
++ * significantly, so double the (minimum) stack size when they are in use,
++ * and then double it again if KASAN_EXTRA is on.
   */
  #ifdef CONFIG_KASAN
- #define KASAN_SHADOW_SCALE_SHIFT 3
  #define KASAN_SHADOW_SIZE	(UL(1) << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 +#ifdef CONFIG_KASAN_EXTRA
 +#define KASAN_THREAD_SHIFT	2
 +#else
  #define KASAN_THREAD_SHIFT	1
 +#endif /* CONFIG_KASAN_EXTRA */
  #else
  #define KASAN_SHADOW_SIZE	(0)
  #define KASAN_THREAD_SHIFT	0

--Sig_/D=xEj0+=rKQhB8Pr7lnnvVH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwPUwIACgkQAVBC80lX
0GxCNQf7BUr3FPrTJZVK1pi1yISZ1JBh0+TKDPhB9VzEVmvsWCHzqdO9u0vMpfOW
lAnEhuu2sT7qOL7QpAMzF6UghD++4l5G6laOeaOuw9m+BUB2agIb+HHMJiIix607
msj94mkO+MiNOvtPK5DXN8UhFTFjoWBqocC8s0BlgiobBVqkJA9uc1N3JF7UuTic
3SbkYYIGvXBJcyvXGJhNQLFO+J1xAGuS11u4Ti7dhSXoD3RoS21m3IFJKRoysQCj
ElqN+1M2dTLlBTgu+hVgGfaYRiBFri1Tx/g99DAahMrgR0/GHqPijXM4kOjsAMJa
9ARioobPDG9j+EvkLV8ur5WMDRMzPg==
=XrEz
-----END PGP SIGNATURE-----

--Sig_/D=xEj0+=rKQhB8Pr7lnnvVH--
