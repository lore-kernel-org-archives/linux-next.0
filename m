From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the s290 tree
Date: Tue, 9 Oct 2018 14:21:44 +1100
Message-ID: <20181009142145.210622b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D475+htFO5xCC+D8cK=3Qzq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/D475+htFO5xCC+D8cK=3Qzq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/Kconfig

between commit:

  819eafaa7b58 ("s390/kasan: add initialization code and enable it")

from the s290 tree and commit:

  13ddb52c165b ("s390/jump_label: Switch to relative references")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/Kconfig
index a45583f731f0,12dc4c1af96c..000000000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -126,7 -120,7 +126,8 @@@ config S39
  	select HAVE_ALIGNED_STRUCT_PAGE if SLUB
  	select HAVE_ARCH_AUDITSYSCALL
  	select HAVE_ARCH_JUMP_LABEL
+ 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 +	select HAVE_ARCH_KASAN
  	select CPU_NO_EFFICIENT_FFS if !HAVE_MARCH_Z9_109_FEATURES
  	select HAVE_ARCH_SECCOMP_FILTER
  	select HAVE_ARCH_SOFT_DIRTY

--Sig_/D475+htFO5xCC+D8cK=3Qzq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu8HskACgkQAVBC80lX
0GxsBwf/VzUgxuA0VxwVpmoNWoRCSLJlKMlrc7w9K4MWhSt8a7t50+ikb8NFhDLY
f0+KNsl7jbSPut0TBRmB2Tn+SVXxjLr7e5rG3lu/BlY7aVfgOqsdgyqT/tsTjaVy
ksNpuFn5DIKOkRLjMjcrAL5JxmkwRVPBYzhsnD2eOWEkhUDvJL2ZD65IlUapN2Gj
Vxq3IlfrzhFYbSoTF2NEXmsbePvKglP6EQ+nDj/t6/S70ERqfgiy3RYlR95fLi7P
/gbPzT020GAsAi2Y8ZMLm8sBGNVCsrLgswyDiqIeROtysTaySZ7OqmA/1C/mCLfm
YFaIqTLcsg/9vEQrccF1RlFJs4IqRQ==
=NkNW
-----END PGP SIGNATURE-----

--Sig_/D475+htFO5xCC+D8cK=3Qzq--
