From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Wed, 15 Aug 2018 18:05:04 +1000
Message-ID: <20180815180504.2f75cc0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V6l_PWApLFt+jGRElQiFFrX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>, "Luis R. Rodriguez" <mcgrof@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/V6l_PWApLFt+jGRElQiFFrX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/asm-generic/pgtable.h

between commits:

  42e4089c7890 ("x86/speculation/l1tf: Disallow non privileged high MMIO PR=
OT_NONE mappings")
  6c26fcd2abfe ("x86/speculation/l1tf: Unbreak !__HAVE_ARCH_PFN_MODIFY_ALLO=
WED architectures")

from Linus' tree and commit:

  c235da45bb89 ("mm: provide a fallback for PAGE_KERNEL_RO for architecture=
s")

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

diff --cc include/asm-generic/pgtable.h
index a75cb371cd19,81371468ed5a..000000000000
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@@ -1083,18 -1083,24 +1083,36 @@@ int phys_mem_access_prot_allowed(struc
  static inline void init_espfix_bsp(void) { }
  #endif
 =20
 +#ifndef __HAVE_ARCH_PFN_MODIFY_ALLOWED
 +static inline bool pfn_modify_allowed(unsigned long pfn, pgprot_t prot)
 +{
 +	return true;
 +}
 +
 +static inline bool arch_has_pfn_modify_check(void)
 +{
 +	return false;
 +}
 +#endif /* !_HAVE_ARCH_PFN_MODIFY_ALLOWED */
 +
+ /*
+  * Architecture PAGE_KERNEL_* fallbacks
+  *
+  * Some architectures don't define certain PAGE_KERNEL_* flags. This is e=
ither
+  * because they really don't support them, or the port needs to be update=
d to
+  * reflect the required functionality. Below are a set of relatively safe
+  * fallbacks, as best effort, which we can count on in lieu of the archit=
ectures
+  * not defining them on their own yet.
+  */
+=20
+ #ifndef PAGE_KERNEL_RO
+ # define PAGE_KERNEL_RO PAGE_KERNEL
+ #endif
+=20
+ #ifndef PAGE_KERNEL_EXEC
+ # define PAGE_KERNEL_EXEC PAGE_KERNEL
+ #endif
+=20
  #endif /* !__ASSEMBLY__ */
 =20
  #ifndef io_remap_pfn_range

--Sig_/V6l_PWApLFt+jGRElQiFFrX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltz3rAACgkQAVBC80lX
0GxebAf/fv95337K9Z39twbpgZFVA6OnPIo8GfyFgc3J+T8R2kTQASm3Kju28dPK
lyGGtkOnnMQwFADn2iI3Zb4j8ZHhnvQi1MiX6p2wCEEyAFqJhW+qwB76Xo0hPu1S
B8fJyO8TAmcdqVIqpPSHIPtXmMt39HSPx2SLgcVKW8Ecl8S0MCGWykk/RmcArx1O
7BOzOK4SJqTDOWvhyzyJADdXBBYzLYVdQXrU5e2GjqWpnFLGf1nuZGUaaDDTOPsy
tmWUqeNSOqt9MtPHuP4uHrK0SeWhE5TUL7ATWrZA/ipNiTinC5YL1jir1R2Tq6MO
jGkUNKvRYWWrycQjQgCxzugo8FDw5g==
=jCcJ
-----END PGP SIGNATURE-----

--Sig_/V6l_PWApLFt+jGRElQiFFrX--
