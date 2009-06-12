From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: origin tree build failure
Date: Fri, 12 Jun 2009 19:33:17 +1000
Message-ID: <1244799197.7172.106.camel@pasglop>
References: <20090612102427.32582baa.sfr@canb.auug.org.au>
	 <1244768406.7172.1.camel@pasglop>  <20090612092054.GB32052@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:57996 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754420AbZFLJds (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 05:33:48 -0400
In-Reply-To: <20090612092054.GB32052@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulus@samba.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>


> Ah - thanks. The bug was caused by me being a bit too optimistic in 
> applying the shiny-new Power7 support patches on the last day. (nice 
> CPU btw.)

In that case paulus tells me it's actually Peter screwing up moving
something from the powerpc code to generic :-)

 .../...

> Such bugs happen, and they are easy enough to fix. What matters 
> arent the 1-2 short-lived bugs that do happen when a new combination 
> of trees is created, but the long-lived combination bugs and 
> conflicts.

I'm not saying -next would fix world hunger ... but in this case we have
two sets of issues, perfctr and the init ordering change which both got
merged totally bypassing -next... We should at least -try- to follow the
process we've defined, don't you think ?

Cheers,
Ben.
