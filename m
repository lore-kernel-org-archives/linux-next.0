From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 15 Aug 2018 14:24:23 +1000
Message-ID: <20180815142423.03ee8eae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1OR5IY1NiBKGFC38Vf+v5vT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Wanpeng Li <wanpengli@tencent.com>
List-Id: linux-next.vger.kernel.org

--Sig_/1OR5IY1NiBKGFC38Vf+v5vT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/include/asm/kvm_host.h

between commit:

  5b76a3cff011 ("KVM: VMX: Tell the nested hypervisor to skip L1D flush on =
vmentry")

from Linus' tree and commit:

  4180bf1b655a ("KVM: X86: Implement "send IPI" hypercall")

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

diff --cc arch/x86/include/asm/kvm_host.h
index acebb808c4b5,c18958ef17d2..000000000000
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@@ -1418,7 -1457,10 +1462,11 @@@ int kvm_cpu_get_interrupt(struct kvm_vc
  void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
  void kvm_vcpu_reload_apic_access_page(struct kvm_vcpu *vcpu);
 =20
+ int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
+     		    unsigned long ipi_bitmap_high, int min,
+ 		    unsigned long icr, int op_64_bit);
+=20
 +u64 kvm_get_arch_capabilities(void);
  void kvm_define_shared_msr(unsigned index, u32 msr);
  int kvm_set_shared_msr(unsigned index, u64 val, u64 mask);
 =20

--Sig_/1OR5IY1NiBKGFC38Vf+v5vT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzqvcACgkQAVBC80lX
0Gwhggf/ctETGDs4D+j+ZclbWNzdrsRwImGfMqVPCgWj4yCipovQVpyPKTBC5148
8p0tUPzfIKH70jYNCLJ7ZM3SqzZDdq8nTGyzee6yK8mMYoQmZQWA/rK3PVxIy9OW
p2AwmgGSyLXhZbg93P+Y/nSgFtAcxC5cXp9CDrWn5pfBWyyM8cfLoP0Eeyp+BVfR
EMkyJAoCSqddKrC4CtuNeXsky3krLmqCZ7GgYz3W03AOh36VwioPCAOfCN+Y6J9K
ALYoEW8vES7Dw7aY3rhvY4MlMPixA3+DoL8qEWGg0sfKSJ6BF24Db6Ms40KFen6N
dBPY21fJi+wwDEznsq2vv9yrQfy6pQ==
=RgA6
-----END PGP SIGNATURE-----

--Sig_/1OR5IY1NiBKGFC38Vf+v5vT--
