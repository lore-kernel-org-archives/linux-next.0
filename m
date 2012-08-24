From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [next-20120823] NOHZ: local_softirq_pending 200 on s/r
Date: Fri, 24 Aug 2012 07:52:47 -0700
Message-ID: <20120824145247.GB2472@linux.vnet.ibm.com>
References: <CA+icZUW2aUP=vjBeoksFU=NAVFMJEiBQy6sNKZczzRPEP9kOfw@mail.gmail.com>
 <1345793168.4331.64.camel@marge.simpson.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:46171 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754458Ab2HXOxP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Aug 2012 10:53:15 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 24 Aug 2012 08:53:14 -0600
Content-Disposition: inline
In-Reply-To: <1345793168.4331.64.camel@marge.simpson.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Galbraith <efault@gmx.de>
Cc: sedat.dilek@gmail.com, Paul McKenney <paul.mckenney@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, linux-next <linux-next@vger.kernel.org>

On Fri, Aug 24, 2012 at 09:26:08AM +0200, Mike Galbraith wrote:
> On Thu, 2012-08-23 at 12:04 +0200, Sedat Dilek wrote:
> 
> > Jack Winter confirmed to see similiar NOHZ messages also on
> > v3.4.9-rt17 kernel (CPU: Core2Duo when no suspend performed):
> > 
> > [15223.171585] NOHZ: local_softirq_pending 08
> 
> These can be caused by blocking while holding local_softirq_lock.
> 
> Even with per softirq threads, and then (yet more overhead) splitting
> the lock to make sure one softirq type can't block another, _and_ only
> griping if the lock for the pending softirq is _not_ held, seems the
> little bugger can still be triggered very rarely by syn flood induced
> handler bail/raise.  Annoying little gripe :)

Hmmm...  Now that you mention it, if I understand correctly, the
conversion of spinlocks to sleeplocks in -rt would seem to invalidate
this particular diagnostic completely.

So, what am I missing?

							Thanx, Paul
