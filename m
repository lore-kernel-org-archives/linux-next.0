From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: wireless/wireless-current merge conflict
Date: Thu, 22 May 2008 09:41:05 -0400
Message-ID: <20080522134105.GB3996@tuxdriver.com>
References: <20080522132031.3c05b6f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ra.tuxdriver.com ([70.61.120.52]:3917 "EHLO ra.tuxdriver.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755215AbYEVN6Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 May 2008 09:58:25 -0400
Content-Disposition: inline
In-Reply-To: <20080522132031.3c05b6f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, linux-next@vger.kernel.org, Helmut Schaa <hschaa@suse.de>

On Thu, May 22, 2008 at 01:20:31PM +1000, Stephen Rothwell wrote:
> Hi John, Dave,
> 
> Today's linux-next merge of the net tree got a (trivial) conflict in
> net/mac80211/mlme.c between commit
> 0d580a774b3682b8b2b5c89ab9b813d149ef28e7 ("mac80211: fix NULL pointer
> dereference in ieee80211_compatible_rates") from the wireless-current
> tree and commit 988c0f723d0b1abb399e6e71d8bf3f8bf1949a70 ("mac80211: a
> few code cleanups") from the wireless tree.
> 
> The conflict is just contextual with the latter patch removing braces
> around some code very near the insertion in the former patch.  I did the
> obvious fixup.  You may want to check (around line 724).

It sounds like you did the right fix.  Did you hit one under
drivers/net/wireless/libertas as well?

I have just pushed a 'merge-test' branch here:

	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next-2.6 merge-test

You may wish to refer to it for the libertas conflict tomorrow.

John
-- 
John W. Linville
linville@tuxdriver.com
