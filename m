From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Fri, 7 Nov 2008 20:25:41 +1100
Message-ID: <20081107202541.85d6a823.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_20_25_41_+1100_9l0Pw2d4oKPvRR9x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58290 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754325AbYKGJZz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 04:25:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Hollis Blanchard <hollisb@us.ibm.com>

--Signature=_Fri__7_Nov_2008_20_25_41_+1100_9l0Pw2d4oKPvRR9x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (powerpc ppc44x_config) failed like this:

arch/powerpc/kvm/built-in.o: In function `kvm_vcpu_ioctl':
kvm_main.c:(.text+0x890): undefined reference to `kvm_arch_vcpu_ioctl_get_s=
regs'
kvm_main.c:(.text+0xa84): undefined reference to `kvm_arch_vcpu_ioctl_set_f=
pu'
kvm_main.c:(.text+0xadc): undefined reference to `kvm_arch_vcpu_ioctl_get_r=
egs'
kvm_main.c:(.text+0xb58): undefined reference to `kvm_arch_vcpu_ioctl_get_f=
pu'
kvm_main.c:(.text+0xc48): undefined reference to `kvm_arch_vcpu_ioctl_trans=
late'
kvm_main.c:(.text+0xd7c): undefined reference to `kvm_arch_vcpu_ioctl_set_r=
egs'
kvm_main.c:(.text+0xdbc): undefined reference to `kvm_arch_vcpu_ioctl_set_s=
regs'
arch/powerpc/kvm/built-in.o: In function `kvm_exit':
(.text+0x117e): undefined reference to `debugfs_entries'
arch/powerpc/kvm/built-in.o: In function `kvm_exit':
(.text+0x1182): undefined reference to `debugfs_entries'
arch/powerpc/kvm/built-in.o: In function `kvm_exit':
(.text+0x1186): undefined reference to `debugfs_entries'
arch/powerpc/kvm/built-in.o: In function `kvm_init':
(.text+0x13ce): undefined reference to `debugfs_entries'
arch/powerpc/kvm/built-in.o: In function `kvm_init':
(.text+0x13da): undefined reference to `debugfs_entries'
arch/powerpc/kvm/built-in.o:(.text+0x13de): more undefined references to `d=
ebugfs_entries' follow
arch/powerpc/kvm/built-in.o: In function `kvm_vm_ioctl':
kvm_main.c:(.text+0x2d20): undefined reference to `kvm_arch_vcpu_setup'
arch/powerpc/kvm/built-in.o: In function `kvm_vcpu_ioctl_interrupt':
(.text+0x38b4): undefined reference to `kvmppc_core_queue_external'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_ioctl_run':
(.text+0x3a0c): undefined reference to `kvmppc_core_deliver_interrupts'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_ioctl_run':
(.text+0x3a28): undefined reference to `__kvmppc_vcpu_run'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_put':
(.text+0x3de0): undefined reference to `kvmppc_core_load_host_debugstate'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_put':
(.text+0x3de8): undefined reference to `kvmppc_core_vcpu_put'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_load':
(.text+0x3e24): undefined reference to `kvmppc_core_load_guest_debugstate'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_load':
(.text+0x3e30): undefined reference to `kvmppc_core_vcpu_load'
arch/powerpc/kvm/built-in.o: In function `kvmppc_decrementer_func':
powerpc.c:(.text+0x3ea4): undefined reference to `kvmppc_core_queue_dec'
arch/powerpc/kvm/built-in.o: In function `kvm_cpu_has_pending_timer':
(.text+0x3efc): undefined reference to `kvmppc_core_pending_dec'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_free':
(.text+0x3f1c): undefined reference to `kvmppc_core_vcpu_free'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_destroy':
(.text+0x3f3c): undefined reference to `kvmppc_core_vcpu_free'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_vcpu_create':
(.text+0x3f5c): undefined reference to `kvmppc_core_vcpu_create'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_destroy_vm':
(.text+0x3f90): undefined reference to `kvmppc_core_vcpu_free'
arch/powerpc/kvm/built-in.o: In function `kvm_arch_check_processor_compat':
(.text+0x4034): undefined reference to `kvmppc_core_check_processor_compat'
arch/powerpc/kvm/built-in.o: In function `kvmppc_emulate_instruction':
(.text+0x41b4): undefined reference to `kvmppc_core_emulate_op'
arch/powerpc/kvm/built-in.o: In function `kvmppc_emulate_instruction':
(.text+0x4380): undefined reference to `kvmppc_core_queue_program'
arch/powerpc/kvm/built-in.o: In function `kvmppc_emulate_instruction':
(.text+0x45ac): undefined reference to `kvmppc_core_emulate_mtspr'
arch/powerpc/kvm/built-in.o: In function `kvmppc_emulate_instruction':
(.text+0x468c): undefined reference to `kvmppc_core_emulate_mfspr'

I have reverted the merge of the kvm tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_20_25_41_+1100_9l0Pw2d4oKPvRR9x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkUCZUACgkQjjKRsyhoI8zNcQCbBwBKhMG6u0nnPvHwWDsijV33
5QcAn03fEEdOhHpnBImGFkkgPCg3tgnm
=PS/Y
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_20_25_41_+1100_9l0Pw2d4oKPvRR9x--
