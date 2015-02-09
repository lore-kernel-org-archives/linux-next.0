From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Subject: Re: randconfig build error with next-20150209, in arch/x86/kvm/vmx.c
Date: Mon, 9 Feb 2015 22:44:07 +0100
Message-ID: <20150209214407.GC1804@potion.brq.redhat.com>
References: <CA+r1Zhi87M6c7DxJ-k-tn-kWeRJJsvfEM_JwfyA0A3f0toZA=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39869 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761295AbbBIVoW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2015 16:44:22 -0500
Content-Disposition: inline
In-Reply-To: <CA+r1Zhi87M6c7DxJ-k-tn-kWeRJJsvfEM_JwfyA0A3f0toZA=A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, gleb@kernel.org, pbonzini@redhat.com, tglx <tglx@linutronix.de>, mingo@redhat.com, hpa <hpa@zytor.com>, x86 <x86@kernel.org>, kvm@vger.kernel.org

2015-02-09 10:46-0700, Jim Davis:
> Building with the attached random configuration file,

Thank you for catching it!

> arch/x86/kvm/vmx.c: In function =E2=80=98vmx_deliver_nested_posted_in=
terrupt=E2=80=99:
> arch/x86/kvm/vmx.c:4378:4: error: =E2=80=98apic=E2=80=99 undeclared (=
first use in this function)
>     apic->send_IPI_mask(get_cpu_mask(vcpu->cpu),
>     ^

---8<---
KVM: VMX: include <asm/apic.h> to fix build error

<asm/apic.h> isn't included directly and without CONFIG_SMP, an option
that automagically pulls it can't be enabled.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
---
 We could just #ifdef because the vcpu isn't running at that time,
 but I think that including the header instead of introducing an
 exception is worth the slowdown on UP.   #ifdef for comparison:
   @@ -4374,9 +4374,11 @@ static int vmx_deliver_nested_posted_interrup=
t(struct kvm_vcpu *vcpu,
    	if (is_guest_mode(vcpu) &&
    	    vector =3D=3D vmx->nested.posted_intr_nv) {
    		/* the PIR and ON have been set by L1. */
   +#ifdef CONFIG_SMP
    		if (vcpu->mode =3D=3D IN_GUEST_MODE)
    			apic->send_IPI_mask(get_cpu_mask(vcpu->cpu),
    				POSTED_INTR_VECTOR);
   +#endif
    		/*
    		 * If a posted intr is not recognized by hardware,
    		 * we will accomplish it in the next vmentry.
=20
 arch/x86/kvm/vmx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index 6e112472b0b3..3f73bfad0349 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -45,6 +45,7 @@
 #include <asm/perf_event.h>
 #include <asm/debugreg.h>
 #include <asm/kexec.h>
+#include <asm/apic.h>
=20
 #include "trace.h"
=20
