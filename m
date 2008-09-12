From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Sat, 13 Sep 2008 05:59:06 +1000
Message-ID: <20080913055906.616452c4.sfr@canb.auug.org.au>
References: <20080913055017.f54fbf66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47749 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755519AbYILT7M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 15:59:12 -0400
In-Reply-To: <20080913055017.f54fbf66.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Arjan van de Ven <arjan@linux.intel.com>

Hi all,

On Sat, 13 Sep 2008 05:50:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Just contextual. I fixed it up (see below) and can carry the fix.

Oops, I needed to add the below as well.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 6a961e3..944c435 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -207,7 +207,7 @@ static int __pit_timer_fn(struct kvm_kpit_state *ps)
 	hrtimer_add_expires_ns(&pt->timer, pt->period);
 	pt->scheduled = ktime_to_ns(hrtimer_get_expires(&pt->timer));
 	if (pt->period)
-		ps->channels[0].count_load_time = pt->timer.expires;
+		ps->channels[0].count_load_time = hrtimer_get_expires(&pt->timer);
 
 	return (pt->period == 0 ? 0 : 1);
 }
