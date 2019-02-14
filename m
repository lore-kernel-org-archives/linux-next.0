From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm-fixes
 tree
Date: Thu, 14 Feb 2019 14:30:22 +1100
Message-ID: <20190214143022.1652616e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qC1DzH0xqhtUyHdE/8q9I3i"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/qC1DzH0xqhtUyHdE/8q9I3i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm/include/asm/kvm_host.h

between commit:

  358b28f09f0a ("arm/arm64: KVM: Allow a VCPU to fully reset itself")

from the kvm-fixes tree and commit:

  42a2502ef5f8 ("arm/arm64: KVM: Statically configure the host's view of MP=
IDR")

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

diff --cc arch/arm/include/asm/kvm_host.h
index 50e89869178a,8073267dc4a0..000000000000
--- a/arch/arm/include/asm/kvm_host.h
+++ b/arch/arm/include/asm/kvm_host.h
@@@ -148,13 -151,13 +152,20 @@@ struct kvm_cpu_context=20
 =20
  typedef struct kvm_cpu_context kvm_cpu_context_t;
 =20
+ static inline void kvm_init_host_cpu_context(kvm_cpu_context_t *cpu_ctxt,
+ 					     int cpu)
+ {
+ 	/* The host's MPIDR is immutable, so let's set it up at boot time */
+ 	cpu_ctxt->cp15[c0_MPIDR] =3D cpu_logical_map(cpu);
+ }
+=20
 +struct vcpu_reset_state {
 +	unsigned long	pc;
 +	unsigned long	r0;
 +	bool		be;
 +	bool		reset;
 +};
 +
  struct kvm_vcpu_arch {
  	struct kvm_cpu_context ctxt;
 =20

--Sig_/qC1DzH0xqhtUyHdE/8q9I3i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxk4M8ACgkQAVBC80lX
0GzeSAgAiMAKFE8uj5Pp8Y5aItPZH4Dn7b7E1+AxvKkaikY/L/3cQY/Dgvxhpbiv
j9YWc3NLmt83M1r/jZduGApGdfwIRgfHZeAdJv0fFcpp1dmbAuvd94P8IUV1L0c0
hHmq6EUepBAWQjHVZfvn6wkfSddW1aN1USOZH0d0uyHuvhG/Rz45M+/jqCaoUQPt
8sQpWCqTnqDKSbUJlvjOd6Qyc30D4BCUPUktnBioY28TySKFFKALAS9my6Pb1mvZ
AoQXJKYUe6TNjaHS3Gz+ModvD6O8+OPL4NrX7xqEZZrsQQndGGNfCxoGqsWU2OcA
6sLUGJQgycUjWzNeXvCrh8wAam+ABA==
=bfjp
-----END PGP SIGNATURE-----

--Sig_/qC1DzH0xqhtUyHdE/8q9I3i--
