From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 08:02:51 +0200
Message-ID: <20080707060251.GA16144@elte.hu>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55531 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751380AbYGGGDP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:03:15 -0400
Content-Disposition: inline
In-Reply-To: <20080707142114.7985a9dd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the sched tree got a conflict in 
> include/linux/rculist.h between commit 
> 93921f5c2ce7427cc30341c86882527d1d1d8770 ("Introduce rculist.h") from 
> Linus' tree and commit 82524746c27fa418c250a56dd7606b9d3fc79826 ("rcu: 
> split list.h and move rcu-protected lists into rculist.h") from the 
> sched tree.
> 
> This, of course, was expected and I just took the version in the sched 
> tree and can carry that as a fixup.
> 
> At this point, it would be nice for the places we know that other 
> subsystems need to start using rculist.h to be sent independent 
> patches to do that.  That means creating persusbsystem parts from the 
> latter commit above.  Once they have been integrated, then I can 
> remove several build fix patches that I am carrying in linux-next.  It 
> would have been good if we have done this quite a while ago.

Well, it might have made sense a month or two ago, but now we are a week 
before the merge window so all this does is extra merge complications 
for me and others. So lets wait a week until tip/core/rcu hits upstream 
and then all these complications are resolved in one go, ok?

	Ingo
