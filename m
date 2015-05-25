From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 25 May 2015 21:18:01 +1000
Message-ID: <20150525211801.679d9015@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_HyKq16CA6HnSwfqZHgWIVi"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33391 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751907AbbEYLSJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 07:18:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>

--Sig_/_HyKq16CA6HnSwfqZHgWIVi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

__NR_syscalls (364) is not one more than the last syscall (364)

Caused by commit d7766613717b ("userfaultfd: activate syscall").  (BTW,
I notice that this patch was not cc'd to any ppc maintainers :-()

I have added this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2015 21:13:40 +1000
Subject: [PATCH] userfaultfd: activate syscall fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/unistd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/u=
nistd.h
index f4f8b667d75b..4a055b6c2a64 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -12,7 +12,7 @@
 #include <uapi/asm/unistd.h>
=20
=20
-#define __NR_syscalls		364
+#define __NR_syscalls		365
=20
 #define __NR__exit __NR_exit
 #define NR_syscalls	__NR_syscalls
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/_HyKq16CA6HnSwfqZHgWIVi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYwTwAAoJEMDTa8Ir7ZwVzD4P/2CCNbwL+DccmNySsNxBPR8c
DZdEGJIEuYnkVECNJh+qb9sHPdYn8V41LNWELLteM5djf62I9cVYXl/fr9hsfWnG
EUTr5r8Ibgag8L4Enqt1X4wAc2iFBdvSO2WWa+Y+X7mYazrJkPTQiNCRbHGuE/EO
pJo9degbl75fX3i69OtjU2rPHIAt5hfmQqTEmp5j+K9iT6X64FQ2cO8U/LRrqJUR
MBNHAyP+5z+HZfNi+oE/D75pUZczWk1zZfXkDWwHdmV6INBRWCOEl1Ful1iJtSO3
uLQs4NHn6o2JPXbRvULrQzTfOGxjrWj6SZhXrFWzHyscojuNkbS4SH3RuAIj4x3w
T7QkYNURJuhuBBXyZewgfTNgP/2wH/iHBgdVN0jd5IjiM6mSZx5W5QImqDoUuvoD
b4PSOHpewby8zx0c7wEK40pwRi/6dgQfzi3rAiroMW0b/xhL0AVGhbiNxi1WLXY3
B1ZBOw3syAvusc2GZJOxYRQQdw1STBSS6yh8ybmxn7sbNGuO+gh/cePyoDteoRcG
ETB8hSvLM5Qc/gzYuyIFCBrhB1x4eSeO5yLLR3DNggzH3hcIUxVcG7OM33t1Z9KZ
SdxC8Mao2cS0I1Yb5a8ogeIyG1PP/21daz+7QgJ8sn7E5lYh+R+HVpRMa0eGS1oF
eNfhySqOthzM3iMW2Zzt
=+lTS
-----END PGP SIGNATURE-----

--Sig_/_HyKq16CA6HnSwfqZHgWIVi--
