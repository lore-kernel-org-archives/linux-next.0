From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Thu, 18 Oct 2018 13:46:27 +1100
Message-ID: <20181018134627.15bbcea9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iAIPVQb_jJjqO91tszIqSfC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>, Jim Mattson <jmattson@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iAIPVQb_jJjqO91tszIqSfC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  include/uapi/linux/kvm.h

between commits:

  214ff83d4473 ("KVM: x86: hyperv: implement PV IPI send hypercalls")
  0804c849f1df ("kvm/x86 : add coalesced pio support")
  57b119da3594 ("KVM: nVMX: add KVM_CAP_HYPERV_ENLIGHTENED_VMCS capability")
  c4f55198c7c2 ("kvm: x86: Introduce KVM_CAP_EXCEPTION_PAYLOAD")

from the kvm tree and commit:

  233a7cb23531 ("kvm: arm64: Allow tuning the physical address size for VM")

from the kvm-arm tree.

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
index cb6d44e1fe02,95aa73ca65dc..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -960,11 -962,7 +969,12 @@@ struct kvm_ppc_resize_hpt=20
  #define KVM_CAP_NESTED_STATE 157
  #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
  #define KVM_CAP_MSR_PLATFORM_INFO 159
 -#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a VM =
*/
 +#define KVM_CAP_PPC_NESTED_HV 160
 +#define KVM_CAP_HYPERV_SEND_IPI 161
 +#define KVM_CAP_COALESCED_PIO 162
 +#define KVM_CAP_HYPERV_ENLIGHTENED_VMCS 163
 +#define KVM_CAP_EXCEPTION_PAYLOAD 164
++#define KVM_CAP_ARM_VM_IPA_SIZE 165 /* returns maximum IPA bits for a VM =
*/
 =20
  #ifdef KVM_CAP_IRQ_ROUTING
 =20

--Sig_/iAIPVQb_jJjqO91tszIqSfC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvH9AMACgkQAVBC80lX
0GxVmAgApLdNQ8MhS+ddZSSSxLiNSbXCfXdHnPSUGJYLIjXjdtpKsvg+QzaQlEXP
HqqLuJ/kWa+cw0FXmyos9xXVJMg1K1ObRwq+ya0J0dLy1BiSTMAIrpA/RibppuWt
mI58WmgqD7kjNdgMZ+Adk6sz3CyT69iC1zQnCIUBZ6/FJYMBZcRKf0CV4jX4ctCe
Sv2+6UqQ1IYx5YjXmxnvj02EmO5fIbgF4l5r3Tu5FcBuP74AvFFVBumWY9Rftggj
oicAoXspn+2d06wO0txIfyCUkTaKyJCQ4d2ywlAsjy5SV3VMQO/XEHpgKnb3jDy7
TXGmXYLTf1KXtRwSfoSRuQcm1RdMgQ==
=gk0p
-----END PGP SIGNATURE-----

--Sig_/iAIPVQb_jJjqO91tszIqSfC--
