From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the kvm-fixes tree
Date: Thu, 29 Mar 2018 16:02:54 +1100
Message-ID: <20180329160254.01e82ff7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5VyX6VOKtJD5nMZrO2KM_bK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wanpeng Li <wanpengli@tencent.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5VyX6VOKtJD5nMZrO2KM_bK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got conflicts in:

  arch/x86/kernel/kvm.c

between commit:

  17a1079d9c63 ("KVM: x86: Fix pv tlb flush dependencies")

from the kvm-fixes tree and commit:

  6beacf74c257 ("KVM: X86: Don't use PV TLB flush with dedicated physical C=
PUs")

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

diff --cc arch/x86/kernel/kvm.c
index fae86e36e399,4ccbff63cb86..000000000000
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@@ -546,7 -546,8 +546,8 @@@ static void __init kvm_guest_init(void
  	}
 =20
  	if (kvm_para_has_feature(KVM_FEATURE_PV_TLB_FLUSH) &&
+ 	    !kvm_para_has_hint(KVM_HINTS_DEDICATED) &&
 -	    !kvm_para_has_feature(KVM_FEATURE_STEAL_TIME))
 +	    kvm_para_has_feature(KVM_FEATURE_STEAL_TIME))
  		pv_mmu_ops.flush_tlb_others =3D kvm_flush_tlb_others;
 =20
  	if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
@@@ -635,7 -641,8 +641,8 @@@ static __init int kvm_setup_pv_tlb_flus
  	int cpu;
 =20
  	if (kvm_para_has_feature(KVM_FEATURE_PV_TLB_FLUSH) &&
+ 	    !kvm_para_has_hint(KVM_HINTS_DEDICATED) &&
 -	    !kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
 +	    kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
  		for_each_possible_cpu(cpu) {
  			zalloc_cpumask_var_node(per_cpu_ptr(&__pv_tlb_mask, cpu),
  				GFP_KERNEL, cpu_to_node(cpu));

--Sig_/5VyX6VOKtJD5nMZrO2KM_bK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq8c34ACgkQAVBC80lX
0GzdwAf/RVJ60DLqr/+aluZdJwYHrOEiXYsDVAm9cN7z0m40rcwPu2xxRYTekbTB
2y9N136MLxSP44jfeN0opgTRl8eq7gQsAy81QFXk/HHTEpiRtHkfaj2rlqouVeOj
rBNzCcdw7zDYxZEvdzq+jFQ+SotmCfdLethMfVFGudGDZeSjIJuEVTNOLhq1f/oY
Xd9DqhoISXMdgXezaTBo4STiZpJTjjp9iuDXqVw/VBOTegx5315i8NAosEDyZjX6
+eggepGlUaYUTIKb9gkJ3grAueSdXHzgWYacqtRzoEE8cvxHzTS1dZwcQ4Z8iqY5
bJQjzNii/9TQdzRQLHxV6X8XvuOFBg==
=NrYb
-----END PGP SIGNATURE-----

--Sig_/5VyX6VOKtJD5nMZrO2KM_bK--
