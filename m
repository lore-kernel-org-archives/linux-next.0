From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 26 Feb 2019 18:39:15 +1100
Message-ID: <20190226183915.053f5993@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KJRtsuK_EApQLvkyUl_mJq+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Mike Rapoport <rppt@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KJRtsuK_EApQLvkyUl_mJq+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
allnoconfig) failed like this:

/home/sfr/next/next/arch/powerpc/kernel/setup_32.c:176:21: error: redefinit=
ion of 'alloc_stack'
 static void *__init alloc_stack(void)
                     ^~~~~~~~~~~
/home/sfr/next/next/arch/powerpc/kernel/setup_32.c:165:21: note: previous d=
efinition of 'alloc_stack' was here
 static void *__init alloc_stack(void)
                     ^~~~~~~~~~~

Caused by patch

  "powerpc: use memblock functions returning virtual address"

from the akpm tree interacting with commit

  c8e409a33cf8 ("powerpc/irq: use memblock functions returning virtual addr=
ess")

from the powerpc tree.

Both patches added the alloc_stack() function and git resolved it by
adding both. :-(  I have added a patch to remove one of them.



--=20
Cheers,
Stephen Rothwell

--Sig_/KJRtsuK_EApQLvkyUl_mJq+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx07SMACgkQAVBC80lX
0Gy5ZQf/dE22xTpFLT11zbHqniL0YLGU3IuAEiZRvRajlFT2dQ7NXFGUawi4u7X5
VVvFGqhzt3Lwg0K4lXKar27+XTs3I0VZ4kFWUPvM3tIN8PZz+qZ2JUDR5eqilSnd
fqrKNoL+wUtqeShtSmstO/L7RVrHrLJv6xtUOqk42XlONYnjh61GpOesT8M8/5W1
Tfp/FdYwW9pn/CHi49IaoZ+sZzs3xQ/XVb6YsoN4tLAWdGU7JaFCRqH3JDxG8QZe
LOP8B52BqyJeQop4X997Cq5hJ1wKhQbH7c3WSTO7JJaH8Qvgwxk4CwJucxMQySjj
vyLHP7U0PXGZRvPhvaRUfpW5CFbKXw==
=IzLU
-----END PGP SIGNATURE-----

--Sig_/KJRtsuK_EApQLvkyUl_mJq+--
