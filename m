From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 19 Jun 2015 14:59:57 +1000
Message-ID: <1434689997.23771.9.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Amit <namit@cs.technion.ac.il>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/lapic.c

between commit:

  b6ac06953221 "KVM: x86: fix lapic.timer_mode on restore"

from the tip tree and commit:

  90de4a187518 "KVM: x86: Support for disabling quirks"

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc arch/x86/kvm/lapic.c
index 4c7deb4f78a1,beeef05bb4d9..000000000000
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@@ -1581,9 -1588,10 +1593,11 @@@ void kvm_lapic_reset(struct kvm_vcpu *v
  
  	for (i = 0; i < APIC_LVT_NUM; i++)
  		apic_set_reg(apic, APIC_LVTT + 0x10 * i, APIC_LVT_MASKED);
 -	apic->lapic_timer.timer_mode = 0;
++
 +	apic_update_lvtt(apic);
- 	apic_set_reg(apic, APIC_LVT0,
- 		     SET_APIC_DELIVERY_MODE(0, APIC_MODE_EXTINT));
+ 	if (!(vcpu->kvm->arch.disabled_quirks & KVM_QUIRK_LINT0_REENABLED))
+ 		apic_set_reg(apic, APIC_LVT0,
+ 			     SET_APIC_DELIVERY_MODE(0, APIC_MODE_EXTINT));
  
  	apic_set_reg(apic, APIC_DFR, 0xffffffffU);
  	apic_set_spiv(apic, 0xff);
