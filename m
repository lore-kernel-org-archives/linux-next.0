From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Tue, 26 May 2015 14:45:27 +1000
Message-ID: <20150526144527.07dfc438@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H9PgBp/+h/uvukjMdsqLZBQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Amit <namit@cs.technion.ac.il>
List-Id: linux-next.vger.kernel.org

--Sig_/H9PgBp/+h/uvukjMdsqLZBQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got conflicts in
arch/x86/include/asm/kvm_host.h and arch/x86/kvm/x86.c between commit
0ee6a5172573 ("x86/fpu, kvm: Simplify fx_init()") (and a few others)
from the tip tree and commit d28bc9dd25ce ("KVM: x86: INIT and reset
sequences are different") from the kvm tree.

I fixed it up (since the former commit made fx_init() static, I just
removed the declaration and see below) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kvm/x86.c
index 989cfc01e2a5,457b908244f2..000000000000
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@@ -7002,11 -7088,19 +7089,13 @@@ int kvm_arch_vcpu_ioctl_set_fpu(struct=20
  	return 0;
  }
 =20
- static void fx_init(struct kvm_vcpu *vcpu)
 -int fx_init(struct kvm_vcpu *vcpu, bool init_event)
++static void fx_init(struct kvm_vcpu *vcpu, bool init_event)
  {
- 	fpstate_init(&vcpu->arch.guest_fpu.state);
 -	int err;
 -
 -	err =3D fpu_alloc(&vcpu->arch.guest_fpu);
 -	if (err)
 -		return err;
 -
+ 	if (!init_event)
 -		fpu_finit(&vcpu->arch.guest_fpu);
++		fpstate_init(&vcpu->arch.guest_fpu.state);
+=20
  	if (cpu_has_xsaves)
 -		vcpu->arch.guest_fpu.state->xsave.xsave_hdr.xcomp_bv =3D
 +		vcpu->arch.guest_fpu.state.xsave.header.xcomp_bv =3D
  			host_xcr0 | XSTATE_COMPACTION_ENABLED;
 =20
  	/*
@@@ -7038,16 -7140,25 +7127,25 @@@ void kvm_put_guest_fpu(struct kvm_vcpu=20
  {
  	kvm_put_guest_xcr0(vcpu);
 =20
- 	if (!vcpu->guest_fpu_loaded)
+ 	if (!vcpu->guest_fpu_loaded) {
+ 		vcpu->fpu_counter =3D 0;
  		return;
+ 	}
 =20
  	vcpu->guest_fpu_loaded =3D 0;
 -	fpu_save_init(&vcpu->arch.guest_fpu);
 +	copy_fpregs_to_fpstate(&vcpu->arch.guest_fpu);
  	__kernel_fpu_end();
  	++vcpu->stat.fpu_reload;
- 	if (!vcpu->arch.eager_fpu)
- 		kvm_make_request(KVM_REQ_DEACTIVATE_FPU, vcpu);
-=20
+ 	/*
+ 	 * If using eager FPU mode, or if the guest is a frequent user
+ 	 * of the FPU, just leave the FPU active for next time.
+ 	 * Every 255 times fpu_counter rolls over to 0; a guest that uses
+ 	 * the FPU in bursts will revert to loading it on demand.
+ 	 */
+ 	if (!use_eager_fpu()) {
+ 		if (++vcpu->fpu_counter < 5)
+ 			kvm_make_request(KVM_REQ_DEACTIVATE_FPU, vcpu);
+ 	}
  	trace_kvm_fpu(0);
  }
 =20
@@@ -7346,7 -7450,9 +7445,7 @@@ int kvm_arch_vcpu_init(struct kvm_vcpu=20
  		goto fail_free_mce_banks;
  	}
 =20
- 	fx_init(vcpu);
 -	r =3D fx_init(vcpu, false);
 -	if (r)
 -		goto fail_free_wbinvd_dirty_mask;
++	fx_init(vcpu, false);
 =20
  	vcpu->arch.ia32_tsc_adjust_msr =3D 0x0;
  	vcpu->arch.pv_time_enabled =3D false;

--Sig_/H9PgBp/+h/uvukjMdsqLZBQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVY/psAAoJEMDTa8Ir7ZwV0yYP/1Wg1oNshHaEH1SDa+oD2K6l
mgmHiHNltuDZbP2MNMTFzV8qhOGZimbAD99adjlmVHQ7GW+RVkoCoVrh/IJQLkqh
Ru5djsBpXvgaOBInzbS4Gyg5dqTLynYX0OPUDTtBcDPBYf7yoqx+G1q76ZhYy2qo
smUUGpLjgDOr7N5RVCIIAs1mF8WzKnpQrJnApkEPKC3ucW0o7IrxCLpso1w5dcK7
Q0qMwpQQNCwKLn1ibwrMY4OwzMQIypxqjFnjCar/27wpN8mSyaVyLZxw3six+6+J
RvdxBmXOtP10oTiEk47eNBsThzaZcxVdGb0wUf8jPH+ql3r2KaLpijTN5Om7jHZY
eJxcSW8BOfsptdBb6ZZ8a3hxB2bt9DtMSOEvdw3hElrGz+7IgUJfd/3qk+pwHy5I
PsDtc/I1gip0rjz90vj/3aolVLi7+f1vENGq1bCWu0U+sBx7B3RNdRyIo6EdFs6Q
ReiXkiHAYWlfuHloP7sBGQyBEroY3DW9GrWGxTwVZWNKTqmeW6y7i7ArwxQsmqu0
HWh+k/3L7L/UkdddxlYf22DWrgYbkRVnOFZVMG0dcMBoUVb1dso/6F2YK7oFWvjP
NyRzOJX/0r4EUhMRttCNOdaZfxkLIxX/ALdysHDjo2Y27G76iJntzPuia4G8E6m4
wvWOyXOgrc54zGsH6AGW
=6r0M
-----END PGP SIGNATURE-----

--Sig_/H9PgBp/+h/uvukjMdsqLZBQ--
