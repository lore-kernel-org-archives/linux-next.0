From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the wireless tree
Date: Tue, 17 May 2011 10:09:39 +0200
Message-ID: <20110517080939.GD22093@elte.hu>
References: <20110517131417.731cf095.sfr@canb.auug.org.au>
 <20110517070558.GP2573@linux.vnet.ibm.com>
 <20110517172103.a196fbe1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54839 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753148Ab1EQIKR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 May 2011 04:10:17 -0400
Content-Disposition: inline
In-Reply-To: <20110517172103.a196fbe1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: paulmck@linux.vnet.ibm.com, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>, "David S. Miller" <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes.berg@intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Paul,
> 
> On Tue, 17 May 2011 00:05:58 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > One of these is mine in -tip (0744371aeb).  Please let me know what
> > I should be doing about it.
> 
> In this case, I would say absolutely nothing (assuming I did the
> resolution correctly) :-)  If I can figure it out, Linus can as well and
> will do so when these trees hit his in a week or so.

Yeah. The two trees are doing different things, and both commits are within 
their own scopes - so this conflict is a natural (and as it seems, mostly 
contextual) conflict, not a workflow messup.

If such conflicts become too numerous then it would make sense to first push 
rcu_kfree() interface upstream and propagate all the fixlets via the individual 
maintainer trees.

I don't think that's necessary: so far the fallout appears to be limited, but 
Stephen will (or should :-) tell us if a conflicts become too painful for him.

Thanks,

	Ingo
