From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 4 Jul 2008 10:45:54 +1000
Message-ID: <200807041045.54623.rusty@rustcorp.com.au>
References: <20080703150328.44061d16.sfr@canb.auug.org.au> <20080703180729.1f6b8620.sfr@canb.auug.org.au> <20080703081906.GB22246@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:44072 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754070AbYGDAp7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 20:45:59 -0400
In-Reply-To: <20080703081906.GB22246@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thursday 03 July 2008 18:19:06 Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > The "home tree" of the commit is
> > > tip/sched/new-API-sched_setscheduler, and that's integrated to the
> > > auto-sched-next branch. If there's any update to the patch we should
> > > iterate it there.
> >
> > That would be a question for Rusty.  He may be able to split out the
> > conflicting part of his simplification patch and send it to you.  But
> > it may not be worth it.
>
> should be all OK as long as Rusty sends his patches to Linus after the
> -tip changes go upstream. (in that case the base patch will fall out of
> Rusty's Quilt queue naturally, leaving the followup change.)

That's the plan.  I'm still testing the stop_machine changes though: it's 
simpler, but seems to have increased latency slightly.   If I was completely 
sure I'd just shuffle it to Ingo.

Cheers,
Rusty.
