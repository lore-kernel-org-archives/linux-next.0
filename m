From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the signal tree with Linus' tree
Date: Thu, 28 Mar 2013 15:28:57 +1100
Message-ID: <20130328152857.e0bb45f7cd88a04614427665@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__28_Mar_2013_15_28_57_+1100_cwO2kToWja16qkco"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__28_Mar_2013_15_28_57_+1100_cwO2kToWja16qkco
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the signal tree got a conflict in fs/splice.c
between commit 06ae43f34bcc ("Don't bother with redoing rw_verify_area()
from default_file_splice_from()") from Linus' tree and commit
76b021d053ed ("convert vmsplice to COMPAT_SYSCALL_DEFINE") from the
signal tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/splice.c
index 29e394e,23ade0e..0000000
--- a/fs/splice.c
+++ b/fs/splice.c
@@@ -31,7 -31,7 +31,8 @@@
  #include <linux/security.h>
  #include <linux/gfp.h>
  #include <linux/socket.h>
+ #include <linux/compat.h>
 +#include "internal.h"
 =20
  /*
   * Attempt to steal a page from a pipe buffer. This should perhaps go into

--Signature=_Thu__28_Mar_2013_15_28_57_+1100_cwO2kToWja16qkco
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRU8cJAAoJEECxmPOUX5FEZ2QP/37+964z9sB/re5mMuTHKjVt
0YSTEsFA51qJpG9YNYXUxIkO9LL9D0EYM0R50nJQ0pHWVSDBeAv9Iv/02ts/Vy17
MVpHnYdh/JwvSac6LeLSqvLXlwYtkWdAysV0iOHtzbvnb1792bF3A14dDEAZYkON
G9UJVpgPIa4wKdCOEsC4UkRY/vjnSrUCWh6MCuDjnShkL9pyshQNvw8zGPqeTf2s
aG5JlOnbJGqGMHdkuzMbjDW8+QQUKejQ8+/Sjzz0ysyEY+e1rB+C9aj89A4e9Hu4
zCCMr0+KG8wbxdem7uHR0h8wmej+WK4SOWq86t/NwUqVCrkmmkiBjBfEAHEeU6kY
qg7T7YjdtAgTUXAujSoK7ifRbAk+ip9hbKP2ASAMELd5KTjG0ov726DzWWkXFJ+i
GDqsCF3ae5REcOLcDUgKSufoRSyJhGzmviwORV9KPlNIQF6UzxUtSVTlHNetOAbr
ntxuFf+uzexmIpXetiI9ZhivFiaUUh7UJxABl8HFc+ztT79mODUmHUS2V+No5566
u3lrqFLIkYxyNCJ8YP11brAdwhUjjN8ibIiJNnzqJH3Z+TQe9DcWlwNYpsIEClF/
F4ZrsFln27GTF20hpsJ+faT/ngNk/KcMVp4438OVc9B8f709tlvejAKSFxZuLbcL
peJ+pi4n/D+AwdGCguOC
=b7iL
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Mar_2013_15_28_57_+1100_cwO2kToWja16qkco--
