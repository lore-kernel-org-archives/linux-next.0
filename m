From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the asm-generic tree
Date: Wed, 24 Apr 2019 15:10:36 +1000
Message-ID: <20190424151036.260a58f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZjJN/=kO2oLlAR.mBqf/4j4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Waiman Long <longman@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/ZjJN/=kO2oLlAR.mBqf/4j4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/include/asm/Kbuild

between commit:

  c67fdc1f00cb ("arch: mostly remove <asm/segment.h>")

from the asm-generic tree and commit:

  46ad0840b158 ("locking/rwsem: Remove arch specific rwsem files")

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

diff --cc arch/arm64/include/asm/Kbuild
index afd8a3740b18,60a933b07001..000000000000
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@@ -17,7 -16,7 +17,6 @@@ generic-y +=3D mmiowb.
  generic-y +=3D msi.h
  generic-y +=3D qrwlock.h
  generic-y +=3D qspinlock.h
- generic-y +=3D rwsem.h
 -generic-y +=3D segment.h
  generic-y +=3D serial.h
  generic-y +=3D set_memory.h
  generic-y +=3D sizes.h

--Sig_/ZjJN/=kO2oLlAR.mBqf/4j4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/78wACgkQAVBC80lX
0Gzkggf+MQGgwftVnnKAFwlcWHA2BxguCtawsm2gvUObDrGdRJmezE/hv57tctue
pFirI/XApa6x0dSBq1WS5Jq4uMjKzuQcKAEClRtkXXZ4sqc/q09d1ohqgCA9c1ty
80P36Mfn3sUiIMbT/wXGjAJxwwTnqWVL4QCQRKcPaaUt2ILdNeNfwD+PwC1phkf0
eWOeMKDnBWed5EqVttJbs5NTehB9S5NakXg3u5+3r59frkUdYY7JyymG1MVqd67C
Q0fthbPkAP/FVFNl44bw2lRnSJD6219eKSfBPYLcI0Uz2NdHPOei5JZT0voe1G3H
HDC2hSmnzrYfpwrojQVuj3XPERUG5A==
=xa6z
-----END PGP SIGNATURE-----

--Sig_/ZjJN/=kO2oLlAR.mBqf/4j4--
