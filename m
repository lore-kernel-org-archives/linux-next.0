From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the net-next tree
Date: Fri, 15 Feb 2019 13:20:10 +1100
Message-ID: <20190215132010.4de0a147@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9FWfBac/dO6B=nET7GE3zPN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/9FWfBac/dO6B=nET7GE3zPN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/uapi/linux/time.h

between commits:

  bcb3fc3247e5 ("arch: sparc: Override struct __kernel_old_timeval")
  ca5e9aba753e ("time: Add time_types.h")

from the net-next tree and commit:

  c70a772fda11 ("y2038: remove struct definition redirects")

from the tip tree.

I fixed it up (I used the net-next tree version of this file and applied
the following patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Feb 2019 13:16:41 +1100
Subject: [PATCH] time: fix up for "y2038: remove struct definition redirect=
s"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/uapi/linux/time_types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/uapi/linux/time_types.h b/include/uapi/linux/time_type=
s.h
index 459070c61d47..27bfc8fc6904 100644
--- a/include/uapi/linux/time_types.h
+++ b/include/uapi/linux/time_types.h
@@ -4,19 +4,15 @@
=20
 #include <linux/types.h>
=20
-#ifndef __kernel_timespec
 struct __kernel_timespec {
 	__kernel_time64_t       tv_sec;                 /* seconds */
 	long long               tv_nsec;                /* nanoseconds */
 };
-#endif
=20
-#ifndef __kernel_itimerspec
 struct __kernel_itimerspec {
 	struct __kernel_timespec it_interval;    /* timer period */
 	struct __kernel_timespec it_value;       /* timer expiration */
 };
-#endif
=20
 /*
  * legacy timeval structure, only embedded in structures that
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/9FWfBac/dO6B=nET7GE3zPN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxmIdoACgkQAVBC80lX
0GwjRgf/dAIpzTvcmRj5TSKxqsYb4hZrVGnPeFSXLsolv4QMrF1yxPEFMQToVjSy
E10VDWFqmu3K901yrM0g+Rqu8TT9zvuTCrf/96bUhDNBZfDvYG92MEZtPoVeMACK
mddlPRuRymhLw/PBHwEZ5q3fcJdBNL/kV4qE0xyz5Wh8r3uA8v9DYw5xnbRKqyD0
NUYMrVkoGJgCAY4h4tICC+DQ2+h47ATbkno4qWTnMvNU73e019tcOaOFqGFsGjyh
MOG9B7lGbchUoIfd8on4J6GiTnaq3bVATdbUhWwUTy1fesQ8xuzVhKnSCT7JH/n6
hsAZAJG+R9MY7ARqTyjHh/pqPORzJw==
=Rzu9
-----END PGP SIGNATURE-----

--Sig_/9FWfBac/dO6B=nET7GE3zPN--
