From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the
 compiler-attributes tree
Date: Mon, 8 Oct 2018 11:48:10 +1100
Message-ID: <20181008114810.6ebbb337@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XXnT=3WqFicXpf1WwTseQTM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/XXnT=3WqFicXpf1WwTseQTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  include/linux/compiler_types.h

between commit:

  a3f8a30f3f00 ("Compiler Attributes: use feature checks instead of version=
 checks")

from the compiler-attributes tree and commit:

  f3569fd613f6 ("crypto: shash - Remove VLA usage in unaligned hashing")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

A removed line was moved to a new file, so I have applied the following
merge fix patch from today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 8 Oct 2018 11:44:24 +1100
Subject: [PATCH] crypto: fixup for movement of __aligned_largest

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/compiler_attributes.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_a=
ttributes.h
index 6b28c1b7310c..9db94801c780 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -49,7 +49,6 @@
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.ht=
ml#index-aligned-variable-attribute
  */
 #define __aligned(x)                    __attribute__((__aligned__(x)))
-#define __aligned_largest               __attribute__((__aligned__))
=20
 /*
  * Note: users of __always_inline currently do not write "inline" themselv=
es,
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/XXnT=3WqFicXpf1WwTseQTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6qUoACgkQAVBC80lX
0Gx+4gf/SNH9A95PkGldA12AeMgCDgtiQRIL+gOwJwyjnrh9fURD4oYQ9cKCmGFF
gamZAib/dfFCcGwPec6CefSwSjqRuRzJzOe5FINCZabUSfkggb7rxPPN1eZcEUBn
lFEbItnYtU/DHSs4kDPXX1NjC85gGKeZ8zeX+H0M2U8h0mzExdVXoS6x9+t+XGQM
/lVx/qpjBUSohA6wdbLkRxcMRX2KIiFlUiEBDa+ovmazpwmZlP3GAzGSJ3M6IrNd
VSt7oy0W/pwxmJU5yhpyIhesnCCD7lXNWf9GUHMAd/Oo0UcNx1/fEHyitGxIlvL/
fkxp6KlplyHE2NsyHi5llA/JD5CQig==
=bMZN
-----END PGP SIGNATURE-----

--Sig_/XXnT=3WqFicXpf1WwTseQTM--
