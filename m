From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Date: Fri, 24 Aug 2018 08:37:05 +1000
Message-ID: <20180824083705.3c88e3ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.ir.1uaE6CUGpUgHVaVzhX+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.ir.1uaE6CUGpUgHVaVzhX+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  include/linux/compiler_types.h

between commit:

  815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually excl=
usive")

from Linus' tree and commit:

  04f264d3a8b0 ("compiler.h: Allow arch-specific asm/compiler.h")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/compiler_types.h
index 90479a0f3986,4be464a07612..000000000000
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@@ -54,20 -54,44 +54,32 @@@ extern void __chk_io_ptr(const volatil
 =20
  #ifdef __KERNEL__
 =20
 -#ifdef __GNUC__
 -#include <linux/compiler-gcc.h>
 -#endif
 -
 -#if defined(CC_USING_HOTPATCH) && !defined(__CHECKER__)
 -#define notrace __attribute__((hotpatch(0,0)))
 -#else
 -#define notrace __attribute__((no_instrument_function))
 -#endif
 -
 -/* Intel compiler defines __GNUC__. So we will overwrite implementations
 - * coming from above header files here
 - */
 -#ifdef __INTEL_COMPILER
 -# include <linux/compiler-intel.h>
 -#endif
 -
 -/* Clang compiler defines __GNUC__. So we will overwrite implementations
 - * coming from above header files here
 - */
 +/* Compiler specific macros. */
  #ifdef __clang__
  #include <linux/compiler-clang.h>
 +#elif defined(__INTEL_COMPILER)
 +#include <linux/compiler-intel.h>
 +#elif defined(__GNUC__)
 +/* The above compilers also define __GNUC__, so order is important here. =
*/
 +#include <linux/compiler-gcc.h>
 +#else
 +#error "Unknown compiler"
  #endif
 =20
+ /*
+  * Some architectures need to provide custom definitions of macros provid=
ed
+  * by linux/compiler-*.h, and can do so using asm/compiler.h. We include =
that
+  * conditionally rather than using an asm-generic wrapper in order to avo=
id
+  * build failures if any C compilation, which will include this file via =
an
+  * -include argument in c_flags, occurs prior to the asm-generic wrappers=
 being
+  * generated.
+  */
+ #ifdef CONFIG_HAVE_ARCH_COMPILER_H
+ #include <asm/compiler.h>
+ #endif
+=20
  /*
 - * Generic compiler-dependent macros required for kernel
 + * Generic compiler-independent macros required for kernel
   * build go below this comment. Actual compiler/compiler version
   * specific implementations come from the above header files
   */

--Sig_/.ir.1uaE6CUGpUgHVaVzhX+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt/NxEACgkQAVBC80lX
0Gyk0QgAlBS17g8mECivuUMvkRpTBZIeCbqkeT3Cd2D6Hb70OFTA0dTFcNRpugPs
W6P8lpmYmBjpFBy865lDheeCsDyftDQmobKOhKgWQDUeXP8DU+5JACVsEACuDh5X
Xz3UWz2uNJz8kDBnzDxq9LIsAPFJILJYN2REUxO+ettWu2/M3GUyykHx0hzw8MxG
+okOlxP+nebfNsSJ1JbgndKJsyMcKBuwH1GMKXSV/Oy6KQEKVI30yi/sqQyDzYAI
sTtUKJa/O02c8YtiX/vzXoHkUWvqadBLr17dlo35WGWeMfEtEu+X4KKkh4i4+7HI
/X2PNrvFAvqmbikGMFuGuzyi8VIWmw==
=TS9U
-----END PGP SIGNATURE-----

--Sig_/.ir.1uaE6CUGpUgHVaVzhX+--
