From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Jan 7 (rcutorture)
Date: Mon, 14 Jan 2013 20:05:55 -0800
Message-ID: <20130115040555.GI3384@linux.vnet.ibm.com>
References: <20130107221627.GZ2525@linux.vnet.ibm.com>
 <20130108095959.98d83d91dbd0e9e1ac023373@canb.auug.org.au>
 <1357600327.5190.13.camel@gandalf.local.home>
 <1357605379.5190.15.camel@gandalf.local.home>
 <20130108035348.GF2525@linux.vnet.ibm.com>
 <50F43612.8080600@infradead.org>
 <20130114173208.GY3384@linux.vnet.ibm.com>
 <50F45321.50808@infradead.org>
 <20130114194956.GB3384@linux.vnet.ibm.com>
 <1358219321.4068.9.camel@gandalf.local.home>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:35962 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950Ab3AOEGA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jan 2013 23:06:00 -0500
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 14 Jan 2013 21:05:59 -0700
Content-Disposition: inline
In-Reply-To: <1358219321.4068.9.camel@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 14, 2013 at 10:08:41PM -0500, Steven Rostedt wrote:
> On Mon, 2013-01-14 at 11:49 -0800, Paul E. McKenney wrote:
> 
> > diff --git a/kernel/rcu.h b/kernel/rcu.h
> > index 7f8e759..b5d30c3 100644
> > --- a/kernel/rcu.h
> > +++ b/kernel/rcu.h
> > @@ -24,6 +24,7 @@
> >  #define __LINUX_RCU_H
> >  
> >  #ifdef CONFIG_RCU_TRACE
> > +#include <linux/trace_clock.h>
> >  #define RCU_TRACE(stmt) stmt
> >  #else /* #ifdef CONFIG_RCU_TRACE */
> >  #define RCU_TRACE(stmt)
> > @@ -118,4 +119,13 @@ int rcu_jiffies_till_stall_check(void);
> >  
> >  #endif /* #ifdef CONFIG_RCU_STALL_COMMON */
> >  
> > +static inline u64 notrace rcu_trace_clock_local(void)
> 
> "inline" now implies notrace. That is, we define inline to include
> notrace in the headers. The 'notrace' now is redundant.

Cool!!!  I have removed the "notrace", having just barely resisted the
urge to add two more instances of "notrace", just for good measure.  ;-)

							Thanx, Paul

> -- Steve
> 
> > +{
> > +#ifdef CONFIG_RCU_TRACE
> > +	return trace_clock_local();
> > +#else /* #ifdef CONFIG_RCU_TRACE */
> > +	return 0;
> > +#endif /* #else #ifdef CONFIG_RCU_TRACE */
> > +}
> > +
> >  #endif /* __LINUX_RCU_H */
> 
> 
