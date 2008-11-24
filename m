From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 23 Nov 2008 20:28:47 -0800 (PST)
Message-ID: <20081123.202847.85900696.davem@davemloft.net>
References: <20081124134301.8aebd20f.sfr@canb.auug.org.au>
	<20081123.195602.16120267.davem@davemloft.net>
	<20081124152550.6a06efa4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:58876
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750870AbYKXE2s (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 23:28:48 -0500
In-Reply-To: <20081124152550.6a06efa4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Nov 2008 15:25:50 +1100

> Sorry, no.  If the build failure is caused by an interaction between two
> trees in linux-next, then I will spend some time trying to fix it up.
> However, a simple allmodconfig (even on sparc64, I think) build would
> have shown you the failure *before* publishing your tree.

Would not, I do an allmodconfig build on sparc64 before every
push of the net-next-2.6 tree.

That's why I'm so irritated by this.
