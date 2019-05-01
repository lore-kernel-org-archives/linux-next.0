From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc tree with the kvm-arm tree
Date: Wed, 1 May 2019 16:09:02 +1000
Message-ID: <20190501160902.49dcf348@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Kvyt6TNl2WovTZLs9y1EWnq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>, Amit Daniel Kachhap <amit.kachhap@arm.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Kvyt6TNl2WovTZLs9y1EWnq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-ppc tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  555f3d03e7fb ("KVM: arm64: Add a capability to advertise SVE support")
  a243c16d18be ("KVM: arm64: Add capability to advertise ptrauth for guest")

from the kvm-arm tree and commit:

  eacc56bb9de3 ("KVM: PPC: Book3S HV: XIVE: Introduce a new capability KVM_=
CAP_PPC_IRQ_XIVE")

from the kvm-ppc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/kvm.h
index 4dc34f8e29f6,52bf74a1616e..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -988,9 -988,7 +988,10 @@@ struct kvm_ppc_resize_hpt=20
  #define KVM_CAP_ARM_VM_IPA_SIZE 165
  #define KVM_CAP_MANUAL_DIRTY_LOG_PROTECT 166
  #define KVM_CAP_HYPERV_CPUID 167
 -#define KVM_CAP_PPC_IRQ_XIVE 168
 +#define KVM_CAP_ARM_SVE 168
 +#define KVM_CAP_ARM_PTRAUTH_ADDRESS 169
 +#define KVM_CAP_ARM_PTRAUTH_GENERIC 170
++#define KVM_CAP_PPC_IRQ_XIVE 171
 =20
  #ifdef KVM_CAP_IRQ_ROUTING
 =20

--Sig_/Kvyt6TNl2WovTZLs9y1EWnq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzJN/4ACgkQAVBC80lX
0GyFzAgAoZ5umiIReEysI3SJJuZza5scZWesvNGm1JiPWAU4xl+NTFXuGfGFsp1/
17NNVyRmKZwyqL+MXlbFIuT3IhvHR/uc6pKtRNEhQO0JZZOVnDf9tFGcBGcVZJfK
DSkSesCicMZuzzsT/bKaSjtYYrjehNMR3sBGe7SqGysnU6gQN6k+mvPQYxBnPqhH
UNVV0mX5mxX4CwunmYs4RKq/4/W0FJvfcHpHfEgLJXY6x8SEHPuXZct6JrhtYgDC
Med5c388vQcaoDnLfkjZ/g/SOdJCGIiggJyvhR/KXz30EzqY5YTLi8TrNAueCRpo
Z0Hd4G3tj/SU0hv2iXvxF8ZnARTUqA==
=AfPs
-----END PGP SIGNATURE-----

--Sig_/Kvyt6TNl2WovTZLs9y1EWnq--
