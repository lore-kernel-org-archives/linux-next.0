From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Mon, 6 Nov 2017 13:10:40 +1100
Message-ID: <20171106131040.6777cb03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Baron <jbaron@akamai.com>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/idle/intel_idle.c

between commit:

  0563bb7ba67e ("intel_idle: replace conditionals with static_cpu_has(X86_FEATURE_ARAT)")

from the pm tree and commit:

  675357362aeb ("Revert "x86/mm: Stop calling leave_mm() in idle code"")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/idle/intel_idle.c
index 5db5e3176f6a,f0b06b14e782..000000000000
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@@ -913,24 -913,19 +913,25 @@@ static __cpuidle int intel_idle(struct 
  	struct cpuidle_state *state = &drv->states[index];
  	unsigned long eax = flg2MWAIT(state->flags);
  	unsigned int cstate;
 +	bool uninitialized_var(tick);
+ 	int cpu = smp_processor_id();
  
 -	cstate = (((eax) >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK) + 1;
 -
  	/*
- 	 * NB: if CPUIDLE_FLAG_TLB_FLUSHED is set, this idle transition
- 	 * will probably flush the TLB.  It's not guaranteed to flush
- 	 * the TLB, though, so it's not clear that we can do anything
- 	 * useful with this knowledge.
+ 	 * leave_mm() to avoid costly and often unnecessary wakeups
+ 	 * for flushing the user TLB's associated with the active mm.
  	 */
+ 	if (state->flags & CPUIDLE_FLAG_TLB_FLUSHED)
+ 		leave_mm(cpu);
  
 -	if (!(lapic_timer_reliable_states & (1 << (cstate))))
 -		tick_broadcast_enter();
 +	if (!static_cpu_has(X86_FEATURE_ARAT)) {
 +		cstate = (((eax) >> MWAIT_SUBSTATE_SIZE) &
 +				MWAIT_CSTATE_MASK) + 1;
 +		tick = false;
 +		if (!(lapic_timer_reliable_states & (1 << (cstate)))) {
 +			tick = true;
 +			tick_broadcast_enter();
 +		}
 +	}
  
  	mwait_idle_with_hints(eax, ecx);
  
