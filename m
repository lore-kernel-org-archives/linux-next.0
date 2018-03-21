From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Wed, 21 Mar 2018 19:17:27 +1100
Message-ID: <20180321191727.4d421df3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/w9b7jbpoS7bk87TrZgrfVIT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-next.vger.kernel.org

--Sig_/w9b7jbpoS7bk87TrZgrfVIT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/base/firmware_loader/fallback.c: In function 'map_fw_priv_pages':
drivers/base/firmware_loader/fallback.c:232:2: error: implicit declaration =
of function 'vunmap'; did you mean 'kunmap'? [-Werror=3Dimplicit-function-d=
eclaration]
  vunmap(fw_priv->data);
  ^~~~~~
  kunmap
drivers/base/firmware_loader/fallback.c:233:18: error: implicit declaration=
 of function 'vmap'; did you mean 'kmap'? [-Werror=3Dimplicit-function-decl=
aration]
  fw_priv->data =3D vmap(fw_priv->pages, fw_priv->nr_pages, 0,
                  ^~~~
                  kmap
drivers/base/firmware_loader/fallback.c:233:16: warning: assignment makes p=
ointer from integer without a cast [-Wint-conversion]
  fw_priv->data =3D vmap(fw_priv->pages, fw_priv->nr_pages, 0,
                ^
drivers/base/firmware_loader/fallback.c: In function 'firmware_loading_stor=
e':
drivers/base/firmware_loader/fallback.c:274:4: error: implicit declaration =
of function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-de=
claration]
    vfree(fw_priv->pages);
    ^~~~~
    kvfree
drivers/base/firmware_loader/fallback.c: In function 'fw_realloc_pages':
drivers/base/firmware_loader/fallback.c:405:15: error: implicit declaration=
 of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=3Dimplicit-functi=
on-declaration]
   new_pages =3D vmalloc(new_array_size * sizeof(void *));
               ^~~~~~~
               kvmalloc
drivers/base/firmware_loader/fallback.c:405:13: warning: assignment makes p=
ointer from integer without a cast [-Wint-conversion]
   new_pages =3D vmalloc(new_array_size * sizeof(void *));
             ^

Maybe caused by patch

  "headers: untangle kmemleak.h from mm.h"

Anyway this file should explicitly include linux/vmalloc.h since it uses
stuff in there, so I have added the following patch for today (I think
this could just be applied to the driver-core tree ...):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 21 Mar 2018 19:06:35 +1100
Subject: [PATCH] firmware: explicitly include vmalloc.h

After some other include file changes, fixes:

drivers/base/firmware_loader/fallback.c: In function 'map_fw_priv_pages':
drivers/base/firmware_loader/fallback.c:232:2: error: implicit declaration =
of function 'vunmap'; did you mean 'kunmap'? [-Werror=3Dimplicit-function-d=
eclaration]
  vunmap(fw_priv->data);
  ^~~~~~
  kunmap
drivers/base/firmware_loader/fallback.c:233:18: error: implicit declaration=
 of function 'vmap'; did you mean 'kmap'? [-Werror=3Dimplicit-function-decl=
aration]
  fw_priv->data =3D vmap(fw_priv->pages, fw_priv->nr_pages, 0,
                  ^~~~
                  kmap
drivers/base/firmware_loader/fallback.c:233:16: warning: assignment makes p=
ointer from integer without a cast [-Wint-conversion]
  fw_priv->data =3D vmap(fw_priv->pages, fw_priv->nr_pages, 0,
                ^
drivers/base/firmware_loader/fallback.c: In function 'firmware_loading_stor=
e':
drivers/base/firmware_loader/fallback.c:274:4: error: implicit declaration =
of function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-de=
claration]
    vfree(fw_priv->pages);
    ^~~~~
    kvfree
drivers/base/firmware_loader/fallback.c: In function 'fw_realloc_pages':
drivers/base/firmware_loader/fallback.c:405:15: error: implicit declaration=
 of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=3Dimplicit-functi=
on-declaration]
   new_pages =3D vmalloc(new_array_size * sizeof(void *));
               ^~~~~~~
               kvmalloc
drivers/base/firmware_loader/fallback.c:405:13: warning: assignment makes p=
ointer from integer without a cast [-Wint-conversion]
   new_pages =3D vmalloc(new_array_size * sizeof(void *));
             ^

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/base/firmware_loader/fallback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmwar=
e_loader/fallback.c
index 0a8ec7fec585..d231bbcb95d7 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -8,6 +8,7 @@
 #include <linux/highmem.h>
 #include <linux/umh.h>
 #include <linux/sysctl.h>
+#include <linux/vmalloc.h>
=20
 #include "fallback.h"
 #include "firmware.h"
--=20
2.16.1

--=20
Cheers,
Stephen Rothwell

--Sig_/w9b7jbpoS7bk87TrZgrfVIT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqyFRcACgkQAVBC80lX
0GxyWwgAkcKnKthwxnPJcY+jqTABeveGpQFluFh+MrDh4XUiq0E1j9+5hdmqy49r
Wxy4bnmFfQbWhlI8kf1YRB2SSuTWBM6nOZxeBZkGCeZGUjl9wOAqsDEQWkjD3ObG
3JPa/P6XXJGLakjRSi/RDkuuWDzzfnjPvaXqk2cClab9OVORa4eXY/SnMRuV6eI+
4XJEaKf80xcAlVEYn876tG2vXk5T0JrfZz0VB34G6M1R6cQbclPlSlLQLY6328sJ
QO1m8HqHyY+TMRI1H218gg9KhDh5VXEBv7c6t8nr6mOm0SYmi/y9Jp/2IGwXmJny
Hvadf8Khe50zN1yoaqGenZhCGbvJRA==
=GtJG
-----END PGP SIGNATURE-----

--Sig_/w9b7jbpoS7bk87TrZgrfVIT--
