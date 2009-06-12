From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: origin tree build failure
Date: Fri, 12 Jun 2009 19:57:15 +1000
Message-ID: <1244800635.7172.114.camel@pasglop>
References: <20090612102427.32582baa.sfr@canb.auug.org.au>
	 <1244768406.7172.1.camel@pasglop>  <20090612092054.GB32052@elte.hu>
	 <1244799197.7172.106.camel@pasglop>  <1244799786.6691.1133.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:55686 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761718AbZFLJ6E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 05:58:04 -0400
In-Reply-To: <1244799786.6691.1133.camel@laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulus@samba.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Fri, 2009-06-12 at 11:43 +0200, Peter Zijlstra wrote:
> On Fri, 2009-06-12 at 19:33 +1000, Benjamin Herrenschmidt wrote:
> > We should at least -try- to follow the
> > process we've defined, don't you think ?
> 
> So you're saying -next should include whole new subsystems even though
> its not clear they will be merged?

Maybe yes. And if there's some debate as to whether it should be merged
or not, maybe Linus should make the decision, let -next carry it for a
few days to iron out those problems, and -then- merge it.

> That'll invariably create the opposite case where a tree doesn't get
> pulled and breaks bits due to its absence.
> 
> -next does a great job of sorting the existing subsystem trees, but I
> don't think its Stephens job to decide if things will get merged.

No, it's not, but then, maybe Linus could play the game and -tell- us
whether he intend to merge or not at least a few days in advance :-)

> Therefore when things are in limbo (there was no definite ACK from Linus
> on perf counters) both inclusion and exclusion from -next can lead to
> trouble.

Well, Linus did ACK by merging :-) So he should have been able to give
that ack a few days in advance too..

Cheers,
Ben.
