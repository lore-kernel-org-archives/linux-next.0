From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 23 Jul 2018 19:42:31 +1000
Message-ID: <20180723194231.3d8f0439@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NHprnNiS2jM/SsWHL+q63Cu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NHprnNiS2jM/SsWHL+q63Cu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (sparc (32 bit)
defconfig) failed like this:

In file included from kernel/crash_core.c:9:0:
kernel/crash_core.c: In function 'crash_save_vmcoreinfo_init':
include/linux/crash_core.h:44:66: error: lvalue required as unary '&' opera=
nd
  vmcoreinfo_append_str("SYMBOL(%s)=3D%lx\n", #name, (unsigned long)&name)
                                                                  ^
kernel/crash_core.c:404:2: note: in expansion of macro 'VMCOREINFO_SYMBOL'
  VMCOREINFO_SYMBOL(swapper_pg_dir);
  ^~~~~~~~~~~~~~~~~

Caused by commit

  e527c514996a ("proc/kcore: add vmcoreinfo note to /proc/kcore")

It seems that sparc does not declare swapper_pg_dir for 32 but builds,
they just define it to be NULL.  As do some others:

$ git grep -w 'define.*swapper_pg_dir'
arch/arm/include/asm/pgtable-nommu.h:#define swapper_pg_dir ((pgd_t *) 0)
arch/c6x/include/asm/pgtable.h:#define swapper_pg_dir ((pgd_t *) 0)
arch/h8300/include/asm/pgtable.h:#define swapper_pg_dir ((pgd_t *) 0)
arch/m68k/include/asm/pgtable_no.h:#define swapper_pg_dir ((pgd_t *) 0)
arch/microblaze/include/asm/pgtable.h:#define swapper_pg_dir ((pgd_t *) NUL=
L)
arch/sparc/include/asm/pgtable_32.h:#define swapper_pg_dir NULL
arch/xtensa/include/asm/pgtable.h:# define swapper_pg_dir NULL

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NHprnNiS2jM/SsWHL+q63Cu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVowcACgkQAVBC80lX
0Gwk/gf/S8czSjJdefz5x1juG2ZcS/h8NUij56ml9wY897HxNUhK46y5njdTZkY5
VECtk9Z060MqHiHgGtLDZ/wZH/32glvkvjwLpY+ap3CuuuV/Fx3TFLIUVtgPgQ08
w6SikG+54oZHnyre/YmTmLFN2Jlz1r9f4WeB6oEk645IaUXrQVsEXoPQ6Seynbq4
e/3CuEZf/5FYmQ7TtZ56WN6RxM9vC+5DAWVcYuXUskHHM7rN7g4uu9kT4XEqpmyo
Dtd4FZuXpX8GjiOqzqyauByQ+QxKEuEuxgKWNbySKMVe4v0+pE2M/VJB6ygTyqy9
IK8oSsY7yL/ydsYWlAm58swesaEYYg==
=af6O
-----END PGP SIGNATURE-----

--Sig_/NHprnNiS2jM/SsWHL+q63Cu--
