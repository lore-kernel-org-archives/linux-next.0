From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Thu, 18 Oct 2018 13:37:31 +1100
Message-ID: <20181018133731.12efd882@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BPbrHQzprApBsXaeGGEniYO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Lan Tianyu <Tianyu.Lan@microsoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/BPbrHQzprApBsXaeGGEniYO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/vmx.c

between commit:

  5f8bb004bca4 ("KVM: vmx: hyper-v: don't pass EPT configuration info to vm=
x_hv_remote_flush_tlb()")

from Linus' tree and commit:

  a5c214dad198 ("KVM/VMX: Change hv flush logic when ept tables are mismatc=
hed.")

from the kvm tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/vmx.c
index e665aa7167cf,abeeb45d1c33..000000000000
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@@ -1567,19 -1577,15 +1577,19 @@@ static int vmx_hv_remote_flush_tlb(stru
  	if (to_kvm_vmx(kvm)->ept_pointers_match =3D=3D EPT_POINTERS_CHECK)
  		check_ept_pointer_match(kvm);
 =20
- 	if (to_kvm_vmx(kvm)->ept_pointers_match !=3D EPT_POINTERS_MATCH) {
- 		ret =3D -ENOTSUPP;
- 		goto out;
- 	}
-=20
 +	/*
 +	 * FLUSH_GUEST_PHYSICAL_ADDRESS_SPACE hypercall needs the address of the
 +	 * base of EPT PML4 table, strip off EPT configuration information.
 +	 */
- 	ret =3D hyperv_flush_guest_mapping(
- 			to_vmx(kvm_get_vcpu(kvm, 0))->ept_pointer & PAGE_MASK);
+ 	if (to_kvm_vmx(kvm)->ept_pointers_match !=3D EPT_POINTERS_MATCH) {
+ 		kvm_for_each_vcpu(i, vcpu, kvm)
+ 			ret |=3D hyperv_flush_guest_mapping(
 -				to_vmx(kvm_get_vcpu(kvm, i))->ept_pointer);
++				to_vmx(kvm_get_vcpu(kvm, i))->ept_pointer & PAGE_MASK);
+ 	} else {
+ 		ret =3D hyperv_flush_guest_mapping(
 -				to_vmx(kvm_get_vcpu(kvm, 0))->ept_pointer);
++				to_vmx(kvm_get_vcpu(kvm, 0))->ept_pointer & PAGE_MASK);
+ 	}
 =20
- out:
  	spin_unlock(&to_kvm_vmx(kvm)->ept_pointer_lock);
  	return ret;
  }

--Sig_/BPbrHQzprApBsXaeGGEniYO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvH8esACgkQAVBC80lX
0GzUtwf/f9l6eGjmKQRJnv2Pc+dW+IpNvGQTiBE0Ivxw1iCx4kymjPPts7cm1aFs
QQJ69xAt46AO4dpmSLBl/lcD5DznlSsvMQ8D6ir5QicoVQ8dcZuDUnbKFHRdWsCq
FNTISeP6OgWL6KCgMVWQVOcdhHNEPk3sDVBFkj1sTn4DJvyWsBs55DZDtHwf5Fc4
SdzMBimAgY7JxzFGSRuLFy9ikInDvw0VAoeU81ONXoYE2cUu6I4UhOCdAEOBgXEJ
jOqOzJyuRnChPC3C0qULnDtRBIMfcaG4xwniaK8dcEcdRN4FYhrbdvO8+E7SRcBH
t1d2iFFR/DO9JBSdfu2iQ8+6hXrqSw==
=Oy8l
-----END PGP SIGNATURE-----

--Sig_/BPbrHQzprApBsXaeGGEniYO--
