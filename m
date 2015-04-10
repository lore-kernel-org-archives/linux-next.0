From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the v4l-dvb
 tree
Date: Fri, 10 Apr 2015 20:17:36 +1000
Message-ID: <20150410201736.7f5d8237@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0ZV1xqbxCJgi6eqLuPC.nie"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57744 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754613AbbDJKRn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Apr 2015 06:17:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Michal Simek <michal.simek@xilinx.com>

--Sig_/0ZV1xqbxCJgi6eqLuPC.nie
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
include/linux/kconfig.h between commit 9b174527e7b7 ("[media] Add and
use IS_REACHABLE macro") from the v4l-dvb tree and commit 85ca6a006505
("kconfig-use-macros-which-are-already-defined-fix") from the
akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/kconfig.h
index 16cfb3448568,63ca8dacec59..000000000000
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@@ -44,12 -36,10 +36,19 @@@
  #define IS_MODULE(option) config_enabled(option##_MODULE)
 =20
  /*
+  * IS_ENABLED(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'y' or '=
m',
+  * 0 otherwise.
+  */
+ #define IS_ENABLED(option) \
+ 	(IS_BUILTIN(option) || IS_MODULE(option))
+=20
++/*
 + * IS_REACHABLE(CONFIG_FOO) evaluates to 1 if the currently compiled
 + * code can call a function defined in code compiled based on CONFIG_FOO.
 + * This is similar to IS_ENABLED(), but returns false when invoked from
 + * built-in code when CONFIG_FOO is set to 'm'.
 + */
 +#define IS_REACHABLE(option) (config_enabled(option) || \
 +		 (config_enabled(option##_MODULE) && config_enabled(MODULE)))
 +
  #endif /* __LINUX_KCONFIG_H */

--Sig_/0ZV1xqbxCJgi6eqLuPC.nie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ6NFAAoJEMDTa8Ir7ZwVwPQP/2uoXxmBOaAA7u9lyzA56Dz6
gdar/McMARrwbee/OBBY2wimXRBnUlOF96krK1eaRqXJJbPkuVX/RIlXoHU4M+xK
rBwGjfAe7AJQ4BVVe/ObVlNCzIK+iqt6rPnBq0pr/nO/LrUjIjdpk79Ck615n/VL
GdmxG/AP+5oLUhEeTAsWVhQfBU4u12w8eJWHiEleBKTzMambGhbJYGKPtw+4ZFCg
2XKpcjYsToAnC8dejkT0Rr6v/h6Hg/EFo63YePxbmUVZ6elD/9R4chlwLa6rZvsY
er25K/Xo///lnc/ylgQcavUyaGN8Z7Q4R3afQKvRcOG6BH+jRXWyPjagyvg7PyA9
0+YtoIZiKcmSdlCjAcYunaKXd/dZr5yM02NxPuKNosaloZ86Q2ZGGZGEEuVge22w
6rxJ1Z94jbGaXOFCkE4QQoRyY2bbAJzrBx7HQMSyLuX+w0EOPJPoxPmZ5MzSvNdZ
xxtNpjve7/b/vo2+ddvJRm5OAmZgEXMdxkI6bmginfrv/FGSkJ3iAVYFFkUjwkpm
ZT5k7eAL7XEi9rxx8dE7NrJqCOgF/AWeAg2D/ow6U6RnAV6Jbb6CBoqU07DR93jL
AMvKLgOAMfl6z1JX4vRgizx5DnncjwOyqPXIiG8uKRkFACOdCd8DfGQtCgBqMcej
EhpfB8+VlaWjnyGtK3Ep
=DjmP
-----END PGP SIGNATURE-----

--Sig_/0ZV1xqbxCJgi6eqLuPC.nie--
