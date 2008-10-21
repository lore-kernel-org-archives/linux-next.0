From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Tue, 21 Oct 2008 10:28:44 +0200
Message-ID: <20081021082844.GA26815@elte.hu>
References: <20081021162942.00517398.sfr@canb.auug.org.au> <20081021073201.GB333@elte.hu> <19f34abd0810210107r59f182d1j8c8708c7489bbe4b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37514 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750873AbYJUI26 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 04:28:58 -0400
Content-Disposition: inline
In-Reply-To: <19f34abd0810210107r59f182d1j8c8708c7489bbe4b@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org


* Vegard Nossum <vegard.nossum@gmail.com> wrote:

> On Tue, Oct 21, 2008 at 9:32 AM, Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> >> Hi all,
> >>
> >> Today's linux-next merge of the kmemcheck tree got a conflict in
> >> kernel/sysctl.c between commit af936a1606246a10c145feac3770f6287f483f02
> >> ("vmscan: unevictable LRU scan sysctl") from Linus' tree and commit
> >> 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
> >> core") from the kmemcheck tree.
> >>
> >> Just overlapping additions (combined with a bad merge in the kmemcheck
> >> tree).  I fixed it up (see below).
> >
> > thanks!
> >
> >> [Ingo: it looks like commit 05416cc42ac7072f39bcff036485e2b0fc1da3a9
> >> ("Merge branch 'linus' into kmemcheck") in the kmemcheck tree merged
> >> the "rcutorture_runnable" sysctl into the wrong table.]
> >
> > hm, good spotting! Vegard, will you apply it to your tree? If kmemcheck
> > does not make it in in this cycle then maybe it's best to rebase it
> > shortly after -rc1 is released, to get rid of uglies like that?
> 
> I will apply it and send a pull request. Thanks :-)
> 
> You want to rebase all of kmemcheck on top of -rc1? Sure, we can do 
> it. There's been a lot of back-and-forth with the set_memory_4k()/PSE 
> stuff as well, I imagine the patch-set wouldn't look very nice to 
> somebody trying to follow the history. But isn't rebasing very evil?

it is, so lets avoid it if possible.

	Ingo
