From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-ppc tree with the tip tree
Date: Mon, 24 Aug 2015 15:59:54 +1000
Message-ID: <20150824155954.0cb8a6a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Graf <agraf@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Paul Mackerras <paulus@samba.org>
List-Id: linux-next.vger.kernel.org

Hi Alexander,

Today's linux-next merge of the kvm-ppc tree got a conflict in:

  arch/powerpc/kvm/book3s_hv.c

between commit:

  c56dadf39761 ("sched/preempt, powerpc, kvm: Use need_resched() instead of should_resched()")

from the tip tree and commit:

  ec2571650826 ("KVM: PPC: Book3S HV: Make use of unused threads when running guests")

from the kvm-ppc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/kvm/book3s_hv.c
index a9f753fb73a8,fad52f226c12..000000000000
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@@ -2178,11 -2670,12 +2670,13 @@@ static int kvmppc_run_vcpu(struct kvm_r
  		vc->runner = vcpu;
  		if (n_ceded == vc->n_runnable) {
  			kvmppc_vcore_blocked(vc);
 -		} else if (should_resched()) {
 +		} else if (need_resched()) {
 +			vc->vcore_state = VCORE_PREEMPT;
+ 			kvmppc_vcore_preempt(vc);
  			/* Let something else run */
  			cond_resched_lock(&vc->lock);
- 			vc->vcore_state = VCORE_INACTIVE;
+ 			if (vc->vcore_state == VCORE_PREEMPT)
+ 				kvmppc_vcore_end_preempt(vc);
  		} else {
  			kvmppc_run_core(vc);
  		}
