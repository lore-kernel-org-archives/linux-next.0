From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Mon, 18 Feb 2019 14:42:00 +1100
Message-ID: <20190218144200.2dc3283f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kBSwC6M=QS2NBKYnWU6mIKd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Christopherson <sean.j.christopherson@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kBSwC6M=QS2NBKYnWU6mIKd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/../../../virt/kvm/coalesced_mmio.c:14:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/../../../virt/kvm/kvm_main.c:21:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/../../../virt/kvm/eventfd.c:24:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/../../../virt/kvm/irqchip.c:27:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/../../../virt/kvm/async_pf.c:23:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/../../../virt/kvm/vfio.c:14:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/x86.c:22:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/irq.h:27,
                 from arch/x86/kvm/mmu.c:21:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from arch/x86/kvm/emulate.c:23:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kvm_host.h:38,
                 from drivers/gpu/drm/i915/gvt/kvmgt.c:42:
arch/x86/include/asm/kvm_host.h:38:10: fatal error: asm/kvm_vcpu_regs.h: No=
 such file or directory
 #include <asm/kvm_vcpu_regs.h>
          ^~~~~~~~~~~~~~~~~~~~~

Caused by commits

  1561fcbc8e16 ("KVM: x86: Explicitly #define the VCPU_REGS_* indices")
  a46e726511f4 ("KVM: VMX: Move vCPU-run code to a proper assembly routine")

It looks like a file was not git added :-(

I have used the kvm tree from next-20190215 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/kBSwC6M=QS2NBKYnWU6mIKd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxqKYgACgkQAVBC80lX
0GwXJggAmATWb08AJYliDghecOEVUJ6KsLonX8QoruP/A+RWn1jUrxXwlk/aK42R
k0PKpAE1hNuvKQZVHZLa8KCuC5EbwM+9XjKm7OUd1Mu/czRJ1ceimTj3QdqUJEb8
U3gdHWbHM+G0jE1xIWKqMMyE31inS6D+4bUq/6t16Day86KcW3FdeSfrBh5JAn+k
VGWGzOoAdj4HWWxwDAVbnf2c5pY0VwoZamInLa6GihJB+7ii7SvGxdJdyPPH3BWS
OlfPdwISVUTFCKDwWT3ngp348TBRC6Mhbto5C6aezK22/VhyPO5dwo2A6UIbQcMY
y3e1HwvJyrN4+MliMZYnEd8xlGM+vw==
=N5hA
-----END PGP SIGNATURE-----

--Sig_/kBSwC6M=QS2NBKYnWU6mIKd--
