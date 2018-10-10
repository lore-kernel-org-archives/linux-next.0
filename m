From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc tree with the kvm-arm tree
Date: Wed, 10 Oct 2018 13:22:24 +1100
Message-ID: <20181010132224.3bee4dfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jUZNyJW=i.M6Y78wRuxKMWM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/jUZNyJW=i.M6Y78wRuxKMWM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the kvm-ppc tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  233a7cb23531 ("kvm: arm64: Allow tuning the physical address size for VM")

from the kvm-arm tree and commit:

  aa069a996951 ("KVM: PPC: Book3S HV: Add a VM capability to enable nested =
virtualization")

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
index 95aa73ca65dc,7f2ff3a76995..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -962,7 -954,7 +963,8 @@@ struct kvm_ppc_resize_hpt=20
  #define KVM_CAP_NESTED_STATE 157
  #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
  #define KVM_CAP_MSR_PLATFORM_INFO 159
 -#define KVM_CAP_PPC_NESTED_HV 160
 +#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a VM =
*/
++#define KVM_CAP_PPC_NESTED_HV 161
 =20
  #ifdef KVM_CAP_IRQ_ROUTING
 =20

--Sig_/jUZNyJW=i.M6Y78wRuxKMWM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu9YmAACgkQAVBC80lX
0GzPUwf/beJrwh6ID6KINY9Diqed8gPTXuPQcBdCrnkkBNF6CMbq/nAQdqXtPnmQ
Zz2WDzdPTLyhrEzecJTdBdjIGmdoGJLrfMrwoGsEINrM7M9LoB3uuXLiThtRrH4o
2szKSOn+dcld0kruRihAfXRjm2J/pqzONqnt3GCF6v3ce3HnqNhgY7xMaO5lnbde
btFkAHBshrE0JbaTujmzBxTMUreCYl3l4Lptcw09lF3NznEimciZpCTTlpwKRwyx
2mq2nUsBdCx5kW4Cm/NG2SKp+5NE5nB9vTRI/1Qyn0apF3yeO8un22mPJV4sL2UY
sskWz7y/Tv8tb61cI6YbajpVbo926Q==
=PevZ
-----END PGP SIGNATURE-----

--Sig_/jUZNyJW=i.M6Y78wRuxKMWM--
