From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the rdma
 tree
Date: Mon, 6 May 2019 20:48:24 +1000
Message-ID: <20190506204824.11a7b368@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8=Bp9QV4r5ApqToKC=N9mfu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
List-Id: linux-next.vger.kernel.org

--Sig_/8=Bp9QV4r5ApqToKC=N9mfu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/dynamic_debug.c

between commit:

  923abb9d797b ("RDMA/core: Introduce RDMA subsystem ibdev_* print function=
s")

from the rdma tree and commits:

  c20acb85ecb2 ("lib/dynamic_debug.c: introduce accessors for string member=
s of struct _ddebug")
  686a19fd8999 ("lib/dynamic_debug.c: drop use of bitfields in struct _ddeb=
ug")
  8dc1ed58157d ("lib/dynamic_debug.c: introduce CONFIG_DYNAMIC_DEBUG_RELATI=
VE_POINTERS")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/dynamic_debug.c
index 8a16c2d498e9,58288560cc35..000000000000
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@@ -37,8 -37,55 +37,57 @@@
  #include <linux/device.h>
  #include <linux/netdevice.h>
 =20
 +#include <rdma/ib_verbs.h>
 +
+ #ifdef CONFIG_DYNAMIC_DEBUG_RELATIVE_POINTERS
+ static inline const char *dd_modname(const struct _ddebug *dd)
+ {
+ 	return (const char *)dd + dd->modname_disp;
+ }
+ static inline const char *dd_function(const struct _ddebug *dd)
+ {
+ 	return (const char *)dd + dd->function_disp;
+ }
+ static inline const char *dd_filename(const struct _ddebug *dd)
+ {
+ 	return (const char *)dd + dd->filename_disp;
+ }
+ static inline const char *dd_format(const struct _ddebug *dd)
+ {
+ 	return (const char *)dd + dd->format_disp;
+ }
+ #else
+ static inline const char *dd_modname(const struct _ddebug *dd)
+ {
+ 	return dd->modname;
+ }
+ static inline const char *dd_function(const struct _ddebug *dd)
+ {
+ 	return dd->function;
+ }
+ static inline const char *dd_filename(const struct _ddebug *dd)
+ {
+ 	return dd->filename;
+ }
+ static inline const char *dd_format(const struct _ddebug *dd)
+ {
+ 	return dd->format;
+ }
+ #endif
+=20
+ static inline unsigned dd_lineno(const struct _ddebug *dd)
+ {
+ 	return dd->flags_lineno >> 8;
+ }
+ static inline unsigned dd_flags(const struct _ddebug *dd)
+ {
+ 	return dd->flags_lineno & 0xff;
+ }
+ static inline void dd_set_flags(struct _ddebug *dd, unsigned newflags)
+ {
+ 	dd->flags_lineno =3D (dd_lineno(dd) << 8) | newflags;
+ }
+=20
  extern struct _ddebug __start___verbose[];
  extern struct _ddebug __stop___verbose[];
 =20

--Sig_/8=Bp9QV4r5ApqToKC=N9mfu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQEPgACgkQAVBC80lX
0GyZOAgAjAojmVaqCoSYf1j9INvLmKxwGDCPoMg2eZC62MLZvJHlyo975XBDPBE4
Xb4QlaPEraFy5DOUgyCTMEb3yewXUbAzgq0pkxlKJAIXOT5PdOCw2mXECPVo7+IC
XBwZNYwgI1fZub0TNNIIJ+oNfcjozQ6kJRINCxx1El9N8igahpTxkLhPhkC22ac7
phmsrizRbtd7CKNbL8QB/5twuAu9vo+3k9rEjD+5R+o5O7YBU1fi5DN1E1FF3Ynk
JAWqyI697juck1UjISp4Hp23EOYiJ3N7v5vTdnWysIgRbWFaqNfSwk9jrjcuHw1v
1AP2OGIYA40gyUWu8ae+PIrmu0wVAw==
=y0Hr
-----END PGP SIGNATURE-----

--Sig_/8=Bp9QV4r5ApqToKC=N9mfu--
