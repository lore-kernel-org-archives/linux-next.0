From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: sparc/firmware build failure
Date: Tue, 28 Oct 2008 11:42:34 +0000
Message-ID: <1225194154.18031.185.camel@macbook.infradead.org>
References: <20080901191019.5df57434.sfr@canb.auug.org.au>
	 <20081028214559.c6715cc0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53683 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751939AbYJ1Lmh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Oct 2008 07:42:37 -0400
In-Reply-To: <20081028214559.c6715cc0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, David Miller <davem@davemloft.net>

On Tue, 2008-10-28 at 21:45 +1100, Stephen Rothwell wrote:
> I have now been carrying this patch since September 1.  David (W), are
> going to pick it up, please?  This should be put into the firmware tree
> as part of the merge commit merging Linus' current tree.

I'll merge it; thanks.

> Incidentally, what is to be the fate of the rest of the firmware tree?

We're planning to get the patches in for 2.6.29. 

I told Dave that I'd hold off on the network bits until the first round
of patches had been shipped successfully -- so putting them into
2.6.28-rc within _days_ of the 2.6.27 release didn't seem to be the
right thing to do.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
