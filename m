From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Fri, 5 Oct 2018 16:14:06 +1000
Message-ID: <20181005161406.73ef8727@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PqI=Q4__5fvqHM010aHNvvg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/PqI=Q4__5fvqHM010aHNvvg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/setup-common.c:36:10: fatal error: linux/bootmem.h: No =
such file or directory
 #include <linux/bootmem.h>
          ^~~~~~~~~~~~~~~~~

Caused by commit

  49353a51a758 ("mm: remove include/linux/bootmem.h")

interacting with commit

  d90fe2acd9b2 ("powerpc: Wire up memtest")

from the powerpc tree.

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 5 Oct 2018 16:09:34 +1000
Subject: [PATCH] powerpc: fix up for removal of linux/bootmem.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/setup-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup=
-common.c
index 2b56d1f30387..93ee3703b42f 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -33,7 +33,6 @@
 #include <linux/serial_8250.h>
 #include <linux/percpu.h>
 #include <linux/memblock.h>
-#include <linux/bootmem.h>
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
 #include <asm/debugfs.h>
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/PqI=Q4__5fvqHM010aHNvvg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu3AS4ACgkQAVBC80lX
0GxCyggAg5gUWegEXXnk7wl/PLRnQNhoBupsa4E65FXsIkDF4WoiF+i9lhogvJ3+
0xoJ7ebndA4ouD+mpfvHblrhvHaUoTCTn89Oay9IQcYnvZWqOUBEYulZHMufaBpe
iNWajM0BVMfQ4x7xXWZTSyPFJR6McVXjdqln70zk6yyMjbpfAdmDZSjs1cQW56iM
ZNi8Q8J8JRL3JeSZeQqIlhTQ4vITRYhntHFD50mWNqXUviBw0zfFsIlvgH8XEMEf
/8V5OWQ1Q57Jj+vMbJY/UgyF0HNZWvnWmVAv8+VP2M0RjN7GKfcY4RtTv+Zyun81
L4UwewyWuPg+/tvjH2MhBzwzVcENTw==
=Pl6b
-----END PGP SIGNATURE-----

--Sig_/PqI=Q4__5fvqHM010aHNvvg--
