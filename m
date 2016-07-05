From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the tip tree (from the
 drm-intel tree)
Date: Tue, 5 Jul 2016 10:59:59 -0700
Message-ID: <20160705175959.GW4650@linux.vnet.ibm.com>
References: <20160705135303.6a1bc80a@canb.auug.org.au>
 <20160705082512.GX30921@twins.programming.kicks-ass.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10642 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751105AbcGER7z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2016 13:59:55 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u65HwvSH051010
	for <linux-next@vger.kernel.org>; Tue, 5 Jul 2016 13:59:55 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0b-001b2d01.pphosted.com with ESMTP id 23x77yd75d-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 05 Jul 2016 13:59:54 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 5 Jul 2016 13:59:54 -0400
Content-Disposition: inline
In-Reply-To: <20160705082512.GX30921@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

On Tue, Jul 05, 2016 at 10:25:12AM +0200, Peter Zijlstra wrote:
> On Tue, Jul 05, 2016 at 01:53:03PM +1000, Stephen Rothwell wrote:
> > diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> > index d3502c0603e5..1f91f187b2a8 100644
> > --- a/drivers/gpu/drm/i915/i915_gem.c
> > +++ b/drivers/gpu/drm/i915/i915_gem.c
> > @@ -3290,7 +3290,7 @@ i915_gem_retire_work_handler(struct work_struct *work)
> >  	 * We do not need to do this test under locking as in the worst-case
> >  	 * we queue the retire worker once too often.
> >  	 */
> > -	if (lockless_dereference(dev_priv->gt.awake))
> > +	if (/*lockless_dereference*/(dev_priv->gt.awake))
> >  		queue_delayed_work(dev_priv->wq,
> >  				   &dev_priv->gt.retire_work,
> >  				   round_jiffies_up_relative(HZ));
> > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> > index f6de8dd567a2..2c1926418691 100644
> > --- a/drivers/gpu/drm/i915/i915_irq.c
> > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > @@ -3095,7 +3095,7 @@ static void i915_hangcheck_elapsed(struct work_struct *work)
> >  	if (!i915.enable_hangcheck)
> >  		return;
> >  
> > -	if (!lockless_dereference(dev_priv->gt.awake))
> > +	if (!/*lockless_dereference*/(dev_priv->gt.awake))
> >  		return;
> >  
> >  	/* As enabling the GPU requires fairly extensive mmio access,
> 
> Right, neither case appears to include a data dependency and thus
> lockless_dereference() seems misguided.

Agreed!  At first glance, this code wants READ_ONCE() rather than
lockless_dereference().

							Thanx, Paul
