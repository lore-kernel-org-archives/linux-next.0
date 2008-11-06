From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: new warnings
Date: Wed, 05 Nov 2008 20:09:01 -0800 (PST)
Message-ID: <20081105.200901.00689398.davem@davemloft.net>
References: <20081106142514.42bbe615.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50535
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752974AbYKFEJE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 23:09:04 -0500
In-Reply-To: <20081106142514.42bbe615.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: johannes@sipsolutions.net, linux-next@vger.kernel.org, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 6 Nov 2008 14:25:14 +1100

> Hi all,
> 
> Commit 7a5158ef8da70fdedeb0530faaa8128aa645be3c ("mac80211: fix short
> slot handling") added this:
> 
> /* XXX: remove all this once drivers stop trying to use it */
> static inline int __deprecated __IEEE80211_CONF_SHORT_SLOT_TIME(void)
> 	.
> 	.
> #define IEEE80211_CONF_SHORT_SLOT_TIME (__IEEE80211_CONF_SHORT_SLOT_TIME())
> 
> to include/net/mac80211.h.  I was wondering if any thought was given to
> getting rid of the (currently 4) in tree uses of
> IEEE80211_CONF_SHORT_SLOT_TIME before doing this so that we don't have
> even more new warnings from the kernel build.
> 
> The least that could be done is to clean them up now ...

John Linville told me that these warnings would show up because
of one of his merges and that he also has the patches pending
to get rid of them as well.

Please just ignore them for now.
