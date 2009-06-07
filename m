From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH next] errno.h: define ERFKILL
Date: Sat, 6 Jun 2009 21:47:50 -0400
Message-ID: <20090607014750.GA6743@bombadil.infradead.org>
References: <1244196408-12771-1-git-send-email-a.beregalov@gmail.com> <1244201424.2653.3.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:51880 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753231AbZFGBsE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 6 Jun 2009 21:48:04 -0400
Content-Disposition: inline
In-Reply-To: <1244201424.2653.3.camel@johannes.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linville@tuxdriver.com, linux-next@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, kyle@mcmartin.ca, rth@twiddle.net, ink@jurassic.park.msu.ru

On Fri, Jun 05, 2009 at 01:30:24PM +0200, Johannes Berg wrote:
> On Fri, 2009-06-05 at 14:06 +0400, Alexander Beregalov wrote:
> > Commit 1f87f7d3 (cfg80211: add rfkill support) added ERFKILL
> > to asm-generic/errno.h, but alpha, mips, parisc and sparc use
> > their own numbering scheme and do not include asm-generic/errno.h.
> > We need to add definition of ERFKILL for them.
> 
> Oh, I wasn't aware of that, thanks.
> 
> johannes
> 
> > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Cool with me.

Acked-by: Kyle McMartin <kyle@mcmartin.ca>
