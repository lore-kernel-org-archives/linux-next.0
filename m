From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Sat, 13 Sep 2008 05:50:17 +1000
Message-ID: <20080913055017.f54fbf66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48974 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752551AbYILTu1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 15:50:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Arjan van de Ven <arjan@linux.intel.com>

Hi Avi,

Today's linux-next merge of the kvm tree got a conflict in
arch/x86/kvm/i8254.c between commit
beb20d52d03a51218827fb4a36a4b583debb03f9 ("hrtimer: convert kvm to the
new hrtimer apis") from the timers tree and commit
3dceed526eaab43af90bcec3476c4f534f98dd41 ("KVM: PIT: fix injection logic
and count") from the kvm tree.

Just contextual. I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kvm/i8254.c
index 1bf8f57,634132a..0000000
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@@ -200,13 -200,14 +200,14 @@@ static int __pit_timer_fn(struct kvm_kp
  
  	if (!atomic_inc_and_test(&pt->pending))
  		set_bit(KVM_REQ_PENDING_TIMER, &vcpu0->requests);
- 	if (vcpu0 && waitqueue_active(&vcpu0->wq)) {
- 		vcpu0->arch.mp_state = KVM_MP_STATE_RUNNABLE;
+ 
+ 	if (vcpu0 && waitqueue_active(&vcpu0->wq))
  		wake_up_interruptible(&vcpu0->wq);
- 	}
  
 -	pt->timer.expires = ktime_add_ns(pt->timer.expires, pt->period);
 -	pt->scheduled = ktime_to_ns(pt->timer.expires);
 +	hrtimer_add_expires_ns(&pt->timer, pt->period);
 +	pt->scheduled = ktime_to_ns(hrtimer_get_expires(&pt->timer));
+ 	if (pt->period)
+ 		ps->channels[0].count_load_time = pt->timer.expires;
  
  	return (pt->period == 0 ? 0 : 1);
  }
