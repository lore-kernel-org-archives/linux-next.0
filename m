From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: new warnings
Date: Thu, 6 Nov 2008 08:30:02 -0500
Message-ID: <20081106133001.GA14184@tuxdriver.com>
References: <20081106142514.42bbe615.sfr@canb.auug.org.au> <20081105.200901.00689398.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:48025 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777AbYKFNqI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Nov 2008 08:46:08 -0500
Content-Disposition: inline
In-Reply-To: <20081105.200901.00689398.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, johannes@sipsolutions.net, linux-next@vger.kernel.org

On Wed, Nov 05, 2008 at 08:09:01PM -0800, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 6 Nov 2008 14:25:14 +1100
> 
> > Hi all,
> > 
> > Commit 7a5158ef8da70fdedeb0530faaa8128aa645be3c ("mac80211: fix short
> > slot handling") added this:
> > 
> > /* XXX: remove all this once drivers stop trying to use it */
> > static inline int __deprecated __IEEE80211_CONF_SHORT_SLOT_TIME(void)
> > 	.
> > 	.
> > #define IEEE80211_CONF_SHORT_SLOT_TIME (__IEEE80211_CONF_SHORT_SLOT_TIME())
> > 
> > to include/net/mac80211.h.  I was wondering if any thought was given to
> > getting rid of the (currently 4) in tree uses of
> > IEEE80211_CONF_SHORT_SLOT_TIME before doing this so that we don't have
> > even more new warnings from the kernel build.
> > 
> > The least that could be done is to clean them up now ...
> 
> John Linville told me that these warnings would show up because
> of one of his merges and that he also has the patches pending
> to get rid of them as well.
> 
> Please just ignore them for now.

Yes, sorry for the delay.  I've been down with pneumonia all week. :-(

John
-- 
John W. Linville		Linux should be at the core
linville@tuxdriver.com			of your literate lifestyle.
