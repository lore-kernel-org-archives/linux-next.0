From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the s390 tree
Date: Tue, 9 Oct 2018 17:46:39 +1100
Message-ID: <20181009174639.24fbc2ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EZft1rkL7n2bOXoKB2mfZvh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/EZft1rkL7n2bOXoKB2mfZvh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/s390/kernel/setup.c

between commit:

  b45248da1a33 ("s390: unify stack size definitions")
  ee46f78659ac ("s390: add support for virtually mapped kernel stacks")

from the s390 tree and commit:

  ab9c2b8deb1b ("memblock: remove _virt from APIs returning virtual address=
")

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/kernel/setup.c
index 2a20e6ef8369,2e29456ca11e..000000000000
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@@ -418,12 -357,8 +418,12 @@@ static void __init setup_lowcore(void
  	lc->last_update_timer =3D S390_lowcore.last_update_timer;
  	lc->last_update_clock =3D S390_lowcore.last_update_clock;
 =20
 -	restart_stack =3D memblock_alloc(ASYNC_SIZE, ASYNC_SIZE);
 -	restart_stack +=3D ASYNC_SIZE;
 +	/*
 +	 * Allocate the global restart stack which is the same for
 +	 * all CPUs in cast *one* of them does a PSW restart.
 +	 */
- 	restart_stack =3D memblock_virt_alloc(THREAD_SIZE, THREAD_SIZE);
++	restart_stack =3D memblock_alloc(THREAD_SIZE, THREAD_SIZE);
 +	restart_stack +=3D STACK_INIT_OFFSET;
 =20
  	/*
  	 * Set up PSW restart to call ipl.c:do_restart(). Copy the relevant

--Sig_/EZft1rkL7n2bOXoKB2mfZvh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu8Ts8ACgkQAVBC80lX
0GyEVggAi2TIY/DBlbClhB88s8QHDXmip9elVtwUaMbVhrenr37GIUXlh/L+QJiR
Lr7RUSJ3KDfxuRppylMcMLrmiDMx6YqNfS0qzT94FCdxvy3zbRm2pa11wm5/dewi
Hl07GmhqNt+6/jNCLh1W48UZf+REmTpdpwW3wkpaboOkV00vQouWy6CUF1YqRQHk
KbD6kW3II2VXR07O7wbKZ5P9Ck7iy7OL0afppynAKGac/kItuDXRlpFZUv2VdUQb
WcPL5vHbpTT+CNxCGR1ZSqeCmGHDt9KrB9Ze8yoeOqMh/yX7GcNAJne3sqoDy62x
Lj47wecnH1cC9OR4Q/4h7R2PkzYz3Q==
=JnFX
-----END PGP SIGNATURE-----

--Sig_/EZft1rkL7n2bOXoKB2mfZvh--
