From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ida tree
Date: Thu, 5 Jul 2018 14:36:26 +1000
Message-ID: <20180705143626.70ddefcb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H+GHONWwqxWVXl1Rbh98rZR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/H+GHONWwqxWVXl1Rbh98rZR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ida tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/kernel.h:14:0,
                 from include/asm-generic/bug.h:18,
                 from arch/powerpc/include/asm/bug.h:128,
                 from include/linux/bug.h:5,
                 from arch/powerpc/include/asm/mmu.h:126,
                 from arch/powerpc/include/asm/lppaca.h:36,
                 from arch/powerpc/include/asm/paca.h:21,
                 from arch/powerpc/include/asm/current.h:16,
                 from include/linux/mutex.h:14,
                 from arch/powerpc/platforms/powernv/vas-window.c:13:
arch/powerpc/platforms/powernv/vas-window.c: In function 'vas_assign_window=
_id':
arch/powerpc/platforms/powernv/vas-window.c:528:42: error: 'VAX_WINDOWS_PER=
_CHIP' undeclared (first use in this function); did you mean 'VAS_WINDOWS_P=
ER_CHIP'?
   pr_err("Too many (%d) open windows\n", VAX_WINDOWS_PER_CHIP);
                                          ^
include/linux/printk.h:304:33: note: in definition of macro 'pr_err'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                 ^~~~~~~~~~~
arch/powerpc/platforms/powernv/vas-window.c:528:42: note: each undeclared i=
dentifier is reported only once for each function it appears in
   pr_err("Too many (%d) open windows\n", VAX_WINDOWS_PER_CHIP);
                                          ^
include/linux/printk.h:304:33: note: in definition of macro 'pr_err'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                 ^~~~~~~~~~~

Caused by commit

  bbf959d51112 ("ppc: Convert vas ID allocation to new IDA API")

I applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 5 Jul 2018 14:33:40 +1000
Subject: [PATCH] ppc: fixup for "Convert vas ID allocation to new IDA API"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/powernv/vas-window.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/pla=
tforms/powernv/vas-window.c
index d313b38846eb..97c9b4863609 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -525,7 +525,7 @@ static int vas_assign_window_id(struct ida *ida)
 	int winid =3D ida_alloc_max(ida, VAS_WINDOWS_PER_CHIP, GFP_KERNEL);
=20
 	if (winid =3D=3D -ENOSPC) {
-		pr_err("Too many (%d) open windows\n", VAX_WINDOWS_PER_CHIP);
+		pr_err("Too many (%d) open windows\n", VAS_WINDOWS_PER_CHIP);
 		return -EAGAIN;
 	}
=20
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/H+GHONWwqxWVXl1Rbh98rZR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls9oEoACgkQAVBC80lX
0GwrUwgAlDbxi1X1hhUxdHaP6NK835oCZU5J8b2qTdh1INzFlu0Nbumb8KpQHFL+
xQ4i9HmiWwn8aJCOEo5Hs8jFE2iqmn2yFbRQCbXKgTcjA1Rgu/NDJAxEuZpsl2Oz
yJiE5Ofm2BFlwO2lxYZ3uaFefkp7AIrvi90WqBZHUCIAVnTu2ffoqIHotS+BVO5/
Sqb5PjKb6LA05G6Uy2LHsjmb06dXLjj5yd/594tjb1jy3UuDdliAV6y9dO02BkeM
x9CvI8B1ZOtSoZaEydu7/JiV9bpuJRu5FlAv4dtDNoIuXyErhDTOxECqxpXLpAjK
gBmVijBiEOp5cIU18PqOc7d37Vqkuw==
=pRG8
-----END PGP SIGNATURE-----

--Sig_/H+GHONWwqxWVXl1Rbh98rZR--
