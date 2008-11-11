From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 11 Nov 2008 01:21:31 -0800 (PST)
Message-ID: <20081111.012131.33382347.davem@davemloft.net>
References: <20081110140253.f2c1d262.sfr@canb.auug.org.au>
	<20081110.230049.128216257.davem@davemloft.net>
	<20081111192453.96f685d1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40987
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755062AbYKKJVb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 04:21:31 -0500
In-Reply-To: <20081111192453.96f685d1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, alan@lxorguk.ukuu.org.uk, johannes@sipsolutions.net

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Nov 2008 19:24:53 +1100

> Hi David,
> 
> On Mon, 10 Nov 2008 23:00:49 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> >
> > Thanks for the heads up.  There will be even more conflicts,
> > between net-2.6 and net-next-2.6, that will need resolving
> > as well.
> 
> Is there some reason that you can't merge net-next-2.6 into net-2.6 when
> these conflicts arise?

What usually happens is I wait for Linus to take net-2.6 into
his tree (in case he doesn't like what I have pending and
I thus have to respin to eliminate the offending commits).

Once that happens I pull Linus's tree into net-2.6 and then
I pull net-2.6 into net-next-2.6

This resolves all the conflicts and at the same time avoids
the situation where my entire set of trees are ruined because
something inappropriate propagated into net-2.6 and this
poisons net-next-2.6 too if I just pull it in there before
Linus does decide to take it.

So when Linus takes my current pull request, I'll fix up the
conflicts.
