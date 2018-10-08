From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Mon, 8 Oct 2018 19:03:41 +1100
Message-ID: <20181008190341.5e396491@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TSb.kuN_b+qfmosvMOwws=y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/TSb.kuN_b+qfmosvMOwws=y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/mm/kaslr.c:26:10: fatal error: linux/bootmem.h: No such file or di=
rectory
 #include <linux/bootmem.h>
          ^~~~~~~~~~~~~~~~~

Caused by patch

  "mm: remove include/linux/bootmem.h"

interacting with commit

  3a387c6d96e6 ("x86/kaslr, ACPI/NUMA: Fix KASLR build error")

from the tip tree.

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 8 Oct 2018 18:57:00 +1100
Subject: [PATCH] x86/kaslr, ACPI/NUMA: fix for linux/bootmem.h removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/mm/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index b3471388288d..ad80bdc690c1 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -23,7 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/random.h>
-#include <linux/bootmem.h>
+#include <linux/memblock.h>
=20
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/TSb.kuN_b+qfmosvMOwws=y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu7D10ACgkQAVBC80lX
0Gxs1wgAhN0k56uPNNqElIsc/tF2wGbnr4EqUSzFmRVck/kvGqtiuC8dcek7kh57
DcVxoVG6DZa7wpD6slEldACbSwS1xU82M0D6z2pppnHYqlHRq0cGfpAjzBkSVgmw
QFYiS3dyldFKlckrDi/U2g+30j5WKIF2lpDMJZxzZSr/UwppUJeIOfoKrrv58qcA
5Te52Bh/DHnnOahUZGSs/m15mbG+EUUSXiBNx1JYz2aEY0/jZI9rrt3ih9NEabsF
GsVLiRo59CBghIBqt1UIL9JS6lbepvoj5FRf0roBxQnYNqhu4/1tjrG8G+uOXpqc
4ga1W8vmuWVMncKsq8xBBSCUVAxlfw==
=2pwn
-----END PGP SIGNATURE-----

--Sig_/TSb.kuN_b+qfmosvMOwws=y--
