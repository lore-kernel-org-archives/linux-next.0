From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the arm64 tree
Date: Mon, 4 Jun 2018 16:57:54 +1000
Message-ID: <20180604165754.6ae09612@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n14b8pRqBLK8xIB1HUr7aGp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/n14b8pRqBLK8xIB1HUr7aGp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/arm64/include/asm/processor.h

between commit:

  94b07c1f8c39 ("arm64: signal: Report signal frame size to userspace via a=
uxv")

from the arm64 tree and commit:

  9a6e594869b2 ("arm64/sve: Move sve_pffr() to fpsimd.h and make inline")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/processor.h
index 65ab83e8926e,c99e657fdd57..000000000000
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@@ -246,9 -246,17 +248,20 @@@ void cpu_enable_pan(const struct arm64_
  void cpu_enable_cache_maint_trap(const struct arm64_cpu_capabilities *__u=
nused);
  void cpu_clear_disr(const struct arm64_cpu_capabilities *__unused);
 =20
 +extern unsigned long __ro_after_init signal_minsigstksz; /* sigframe size=
 */
 +extern void __init minsigstksz_setup(void);
 +
+ /*
+  * Not at the top of the file due to a direct #include cycle between
+  * <asm/fpsimd.h> and <asm/processor.h>.  Deferring this #include
+  * ensures that contents of processor.h are visible to fpsimd.h even if
+  * processor.h is included first.
+  *
+  * These prctl helpers are the only things in this file that require
+  * fpsimd.h.  The core code expects them to be in this header.
+  */
+ #include <asm/fpsimd.h>
+=20
  /* Userspace interface for PR_SVE_{SET,GET}_VL prctl()s: */
  #define SVE_SET_VL(arg)	sve_set_current_vl(arg)
  #define SVE_GET_VL()	sve_get_current_vl()

--Sig_/n14b8pRqBLK8xIB1HUr7aGp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsU4vIACgkQAVBC80lX
0Gx1Hgf+Ph8fFxTVvh9AKFpeQTS673VhL4JB27NP6xUd8p8rBup+hxuF7yZaW8vg
sqUJIADyG/mDNpXwRxiBXR/60pIW918u9fnJMkUl+NO3uUgfVZHoILr0UzEsJZ+G
yAd4fDdyTSWx2R3XbREN6IJmx6uWtfipPbIJBWptAohqdNnTtmVqR49UCtCkw3nz
N+KRw8IDCeOGKPRS7UrGqbQJPMd+MRzchuNmeaacAbmA8pY5klXIOC7rPcEpSy22
TetTxARN5PAuChDTnVeAualNbChd30f5aPzXjbjxcXEgmeYCn/gm1rS1N6ZkmDIO
fnkpSBIDNxzRaV3CUERRfFpGeSBH5g==
=8UjV
-----END PGP SIGNATURE-----

--Sig_/n14b8pRqBLK8xIB1HUr7aGp--
