From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Tue, 22 Jul 2008 17:41:51 +1000
Message-ID: <20080722174151.8dc8f29e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_17_41_51_+1000_qwt++2tQ+QPZisFN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40374 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751552AbYGVHmG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 03:42:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Tue__22_Jul_2008_17_41_51_+1000_qwt++2tQ+QPZisFN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's (and for a few days) linux-next build (sparc32 defconfig) failed
like this:

In file included from include2/asm/page.h:4,
                 from arch/sparc/kernel/vmlinux.lds.S:4:
include/asm-sparc/page_64.h:11:2: #error No page size specified in kernel c=
onfiguration

Due to the merge of page.h (I suspect).  The patch below fixes it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 2c8b8ccd3bb14cf6100ba86411d7ef676cf974df Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jul 2008 17:34:27 +1000
Subject: [PATCH] sparc32: pass -m32 when building vmlinux.lds

Otherwise it breaks since we merged asm/page.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index fef28e2..6668e60 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -18,6 +18,7 @@ CHECKFLAGS	+=3D -D__sparc__
 #KBUILD_CFLAGS +=3D -g -pipe -fcall-used-g5 -fcall-used-g7
 KBUILD_CFLAGS +=3D -m32 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
 KBUILD_AFLAGS +=3D -m32
+CPPFLAGS_vmlinux.lds +=3D -m32
=20
 #LDFLAGS_vmlinux =3D -N -Ttext 0xf0004000
 #  Since 2.5.40, the first stage is left not btfix-ed.
--=20
1.5.6.3


--Signature=_Tue__22_Jul_2008_17_41_51_+1000_qwt++2tQ+QPZisFN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFjz8ACgkQjjKRsyhoI8zv2QCeIaHx0hxSNnD4hoEI9ikcdosN
pHsAnREGJ/v9GPybHkMYAShlpU19uTpw
=0lqY
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_17_41_51_+1000_qwt++2tQ+QPZisFN--
