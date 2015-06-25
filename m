From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the modules tree
Date: Thu, 25 Jun 2015 16:54:47 +1000
Message-ID: <20150625165447.140502c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/llNir3=kE6sLvlqkKapg/X0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47722 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750777AbbFYGy4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2015 02:54:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Streetman <ddstreet@ieee.org>

--Sig_/llNir3=kE6sLvlqkKapg/X0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the modules tree, today's linux-next build (powerpc
allnoconfig) failed like this:

kernel/params.c:628:6: error: redefinition of 'kernel_param_lock'
 void kernel_param_lock(struct module *mod)
      ^
In file included from include/linux/module.h:18:0,
                 from kernel/params.c:21:
include/linux/moduleparam.h:246:20: note: previous definition of 'kernel_pa=
ram_lock' was here
 static inline void kernel_param_lock(struct module *mod)
                    ^
kernel/params.c:633:6: error: redefinition of 'kernel_param_unlock'
 void kernel_param_unlock(struct module *mod)
      ^
In file included from include/linux/module.h:18:0,
                 from kernel/params.c:21:
include/linux/moduleparam.h:249:20: note: previous definition of 'kernel_pa=
ram_unlock' was here
 static inline void kernel_param_unlock(struct module *mod)
                    ^

Caused by commit b51d23e4e9fe ("module: add per-module param_lock").
This had not been tested with CONFIG_SYSFS not set.

I have added the following patch for today (which may not be complete,
but builds).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 25 Jun 2015 16:38:51 +1000
Subject: [PATCH] modules: clean up add per-module param_lock

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/moduleparam.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index c12f2147c350..428d7c25c383 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -239,17 +239,8 @@ __check_old_set_param(int (*oldset)(const char *, stru=
ct kernel_param *))
 	return 0;
 }
=20
-#ifdef CONFIG_SYSFS
 extern void kernel_param_lock(struct module *mod);
 extern void kernel_param_unlock(struct module *mod);
-#else
-static inline void kernel_param_lock(struct module *mod)
-{
-}
-static inline void kernel_param_unlock(struct module *mod)
-{
-}
-#endif
=20
 #ifndef MODULE
 /**
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/llNir3=kE6sLvlqkKapg/X0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVi6W9AAoJEMDTa8Ir7ZwVWnIP/RqBjozqrX3IBqyltoGvapU9
BV6SdT99ELa+9t2R4PRORX1aI8vkg7s9NiVLexvNFzLpI5y/wVHXwnDb19BP24Ac
yG2TQKid9CHNMDGVb7bqYZR8xhb6Rg+iTalhf/FiEU8fywbn+Cq5YZ5LouMMtm8+
ZXkEnA/ztHE0p0yD3Q3c/8ieP4pnleTZW+/tr/KqEUQYe22GO/+X6Md8MMKGJaSK
Oh57op0ItC5zAXKGu5e2Jbz9ytLMeRKZqYY0/kuhYYhwzICpTQxzVn1XYXPWjsa/
79LYh5bVgevJAm4jSCijAO0mlbQb9EipvY53tHbwUyOGsWrvm68GcBVKXmqpJYSE
+M2uDa2J1FdcRILFGv8zAzDdBAav0UEMWbc1WYCE0TxjJ5QSda6oR1QszU98Fapy
fB8D2prLoYJgVPvN78J3wpIUKynv8V//gOhxyzIKP8i1w13vlix0Og7zdSV/7iXY
PLYwlNJKTsd7sClms37dR5Ot8gtb/ln/KpFJJ107tt0I6ndxRxnkAv0l+it/1vhq
1uvejToSrSvL1wWJGUSi4TF2HBSU/xrCt7fuZjha5jjvkpVdoA0kCe0q3I15dtZL
oZlYJOKyPIIHa7OehcJcawKGpPgCECvYusLWoQqrd+NETu/l/n43F6CuZdZCkoYq
0TQ2dIuNQ16OqzGZUxdc
=nvJ1
-----END PGP SIGNATURE-----

--Sig_/llNir3=kE6sLvlqkKapg/X0--
