From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree with Linus' tree
Date: Tue, 15 Jun 2010 10:42:05 -0400
Message-ID: <20100615144205.GA2415@tuxdriver.com>
References: <20100615120048.5d497ce1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:47024 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757890Ab0FOOpL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2010 10:45:11 -0400
Content-Disposition: inline
In-Reply-To: <20100615120048.5d497ce1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>

On Tue, Jun 15, 2010 at 12:00:48PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> net/mac80211/mlme.c between commit
> b054b747a694927879c94dd11af54d04346aed7d ("mac80211: fix deauth before
> assoc") from Linus' tree and commit
> 36b3a628a4e85d002ee8813ebd2a5caef6d3c1a7 ("mac80211: common work skb
> freeing") from the wireless tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix
> for a while.

Yes, that looks correct.  I will get the merge sorted-out when I send
the next pull request to Dave, probably this week.

Thanks,

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
