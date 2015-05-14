From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 14 May 2015 18:21:14 +1000
Message-ID: <20150514182114.73d2ae1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RkdpFGirZ2_4Ot=fa3dzu0="; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40294 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750949AbbENIVX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2015 04:21:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

--Sig_/RkdpFGirZ2_4Ot=fa3dzu0=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) failed like this:

In file included from arch/sparc/include/asm/pgtable_32.h:437:0,
                 from arch/sparc/include/asm/pgtable.h:6,
                 from include/linux/mm.h:53,
                 from include/linux/ring_buffer.h:5,
                 from include/linux/ftrace_event.h:5,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:81,
                 from init/initramfs.c:19:
include/asm-generic/pgtable.h: In function 'pmdp_collapse_flush':
include/asm-generic/pgtable.h:211:2: error: implicit declaration of functio=
n '__pmd' [-Werror=3Dimplicit-function-declaration]
  return __pmd(0);
  ^
include/asm-generic/pgtable.h:211:2: error: incompatible types when returni=
ng type 'int' but 'pmd_t' was expected

Caused by commit b0593c13d7f6 ("mm/thp: split out pmd collapse/flush
into separate functions").

sparc 32 has no __pmd().  I applied this temporary fix for today just
to get it building:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 14 May 2015 18:06:06 +1000
Subject: [PATCH] temporary fix for sparc 32 no having __pmd()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/include/asm/page_32.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page=
_32.h
index f82a1f36b655..b2881f326e8e 100644
--- a/arch/sparc/include/asm/page_32.h
+++ b/arch/sparc/include/asm/page_32.h
@@ -69,7 +69,7 @@ typedef struct { unsigned long iopgprot; } iopgprot_t;
=20
 #define __pte(x)	((pte_t) { (x) } )
 #define __iopte(x)	((iopte_t) { (x) } )
-/* #define __pmd(x)        ((pmd_t) { (x) } ) */ /* XXX procedure with loo=
p */
+#define __pmd(x)        ((pmd_t) { { (x) } } ) /* XXX procedure with loop =
*/
 #define __pgd(x)	((pgd_t) { (x) } )
 #define __ctxd(x)	((ctxd_t) { (x) } )
 #define __pgprot(x)	((pgprot_t) { (x) } )
@@ -97,7 +97,7 @@ typedef unsigned long iopgprot_t;
=20
 #define __pte(x)	(x)
 #define __iopte(x)	(x)
-/* #define __pmd(x)        (x) */ /* XXX later */
+#define __pmd(x)        ((pmd_t) { { (x) } } ) /* XXX procedure with loop =
*/
 #define __pgd(x)	(x)
 #define __ctxd(x)	(x)
 #define __pgprot(x)	(x)
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/RkdpFGirZ2_4Ot=fa3dzu0=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVVFr/AAoJEMDTa8Ir7ZwV2fAQAJKG9jToz8MObD2Y/4MbdLJ/
rHUNHb3On5ckCvZDsay3IUSRmBtqpDB7ch1UOfS19fwChJAEvwcihRy130VBV64G
KWLu+X9VFkvXhFE6iQ/iPs8jkaQEKRy6VZFgn8H49nOpoFKmOxyd1CD33j61cT8I
9O21aMl1lK0AffoPil30w7OAI65UT17NJljDUX5AlyCxgE+uwalylsstdI9eH/rJ
AOvoA/tPm2SwuTwijtAqQu6IElKRQTQPKWkiAm6pEnDyeDTrmT1f3g/CRM4qhvUB
gOyD9LgCZn5GeeDELFOFyBtoOcohLpLFJnmeaokasCqwk2lMzlsYggUZLKFKgdgE
dmlWp1NRE/ebh+3T2i4ya8gypr+k5x1WAlvEHffXZ91qhsOsnR9TCVDQxkzGTbEq
tVnuDd5Qd76GlkW+itgqzQOrpGKUAPeQHvXhZV44Wr/ceZAZ2e+Tc9cZWlPnI1dD
XbvA0ExhmXcljd9uk3Y9VwL2So17SzSLUP0U+EAO202E0jFMpCJXPQ9GbgyjZ6B8
7wEWpLDakzCdlFbdzs7jjyLux8NLFhDQxJsJpeAWaA+8IW53xAaUimvM2XkHHjqT
iPKcZ2N6RIya8+NCeYfLU70iEfGIcXNMA2iUP2RsKkA1kaPaGANAygMY3m1ZyHu0
B/rk5/QPgouSUPHLwZhS
=aw+0
-----END PGP SIGNATURE-----

--Sig_/RkdpFGirZ2_4Ot=fa3dzu0=--
