From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the mips tree
Date: Mon, 11 Feb 2019 17:42:56 +1100
Message-ID: <20190211174256.14d38238@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o6Ck2HvIdXu=uqY=vDyTOOu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Davidlohr Bueso <dave@stgolabs.net>
List-Id: linux-next.vger.kernel.org

--Sig_/o6Ck2HvIdXu=uqY=vDyTOOu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/mips/mm/c-r4k.c

between commit:

  3315b6b336c8 ("MIPS: Delete unused flush_cache_sigtramp()")

from the mips tree and commit:

   "arch/mips/mm/c-r4k.c: do not use mmap_sem for gup_fast()"

from the akpm tree.

I fixed it up (the former removed the function modified by the latter, so
I just dropped the latter patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/o6Ck2HvIdXu=uqY=vDyTOOu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxhGXAACgkQAVBC80lX
0GxTsAf+IqKacXcl9Ff/x8EdFwHTzUJEBSzBQc4Bod/q+l0M5Nnbam9vpGiPWsHB
+pkKEpE4txCN9VgHlrV/2YLT7FsJimP9uXC3PyTfUkUvPIiKPFmHTO5QdQVLnU+i
XwdkpA2JWsjKT3cm0/0RP8l7p3H5o8ykoQR1GvpF5xI82CKd83offvhXKQ/GX8Zi
K+qX9V98hdEWAN44bsxOxIaOuVbcRTSCVeF6lPPEf11uGqBvtNn5kz+WDn7NKeVo
lSbQXfuD68rItAzpiLZMXluHJ1nGI4MRPH/+COvR/yEYjq9CEzZ3pNpm8XBWQZcw
XZ042Mgo18NLLZJgF/g/axfjgAxYfg==
=KZfO
-----END PGP SIGNATURE-----

--Sig_/o6Ck2HvIdXu=uqY=vDyTOOu--
