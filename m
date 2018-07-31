From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm-arm tree
Date: Tue, 31 Jul 2018 14:23:39 +1000
Message-ID: <20180731142339.19b52ce0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nEZ6t2b+ZEPlWeO82bQubcz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Dongjiu Geng <gengdongjiu@huawei.com>, Janosch Frank <frankja@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/nEZ6t2b+ZEPlWeO82bQubcz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  be26b3a73413 ("arm64: KVM: export the capability to set guest SError synd=
rome")

from the kvm-arm tree and commit:

  a449938297e5 ("KVM: s390: Add huge page enablement control")

from the kvms390 tree.

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
index a7d9bc4e4068,b955b986b341..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -949,7 -949,7 +949,8 @@@ struct kvm_ppc_resize_hpt=20
  #define KVM_CAP_GET_MSR_FEATURES 153
  #define KVM_CAP_HYPERV_EVENTFD 154
  #define KVM_CAP_HYPERV_TLBFLUSH 155
 -#define KVM_CAP_S390_HPAGE_1M 156
 +#define KVM_CAP_ARM_INJECT_SERROR_ESR 156
++#define KVM_CAP_S390_HPAGE_1M 157
 =20
  #ifdef KVM_CAP_IRQ_ROUTING
 =20

--Sig_/nEZ6t2b+ZEPlWeO82bQubcz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltf5EsACgkQAVBC80lX
0GxisAf6AtkO+NzX7TVrH3tcMfNfJH5uUQ+76ApOnE6kER19CTw8qBLvYZnFXksT
66Pr/p7yLlvTnabRx9e4lF9IdHzK2KmdnCxglE+mBmPMoLsGVQvIV1E64cNzk2oe
0vDIAD6Y1MO0i8jkOI1oVHoCcJyZXTVFQepRY1+sLz0mvwtqT0U++w+FEkCkiYS2
Fc3KSf1Q1TpzOJL/MXlybC+IYaPPEiMW1JBeSHMezjJ16yXeN8R8KzDoOt7HVHlt
xNr3YJXESvOnxp4PI0QluBj2xZ5cj/SW4JqEyyEAkZP1tQNYmlyV6yL1uQhvP8tw
qhdqmqVEYAzc8zNzpPod8ePRVgIhIw==
=j+MJ
-----END PGP SIGNATURE-----

--Sig_/nEZ6t2b+ZEPlWeO82bQubcz--
