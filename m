From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 11 Nov 2008 22:07:05 -0500
Message-ID: <20081112030705.GA3465@tuxdriver.com>
References: <20081112135934.763d688b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:34132 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297AbYKLDQP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Nov 2008 22:16:15 -0500
Content-Disposition: inline
In-Reply-To: <20081112135934.763d688b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Jianjun Kong <jianjun@zeuux.org>

On Wed, Nov 12, 2008 at 01:59:34PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> net/mac80211/debugfs_sta.c between commit
> 013cd397532e5803a1625954a884d021653da720 ("mac80211: fix a buffer overrun
> in station debug code") from Linus' tree and commit
> 804feeb826f8a32c8c71a09101fae31804b40ad1 ("mac80211: remove aggregation
> status write support from debugfs") from the wireless/net tree.
> 
> The latter change just removes the code that the former change was
> modifying.  I used the latter and assume that this will be fixed in your
> tree soon.

I have a patch in wireless-next-2.6 that addresses the same issue as
a one-liner Dave merged already.  FWIW, I like mine better -- so it
should go to Dave with the next batch of -next stuff in a day or two.

Thanks,

John
-- 
John W. Linville		Linux should be at the core
linville@tuxdriver.com			of your literate lifestyle.
