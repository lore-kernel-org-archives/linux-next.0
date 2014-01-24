From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Thu, 23 Jan 2014 19:53:12 -0800
Message-ID: <20140124035312.GA31095@kroah.com>
References: <20140124130122.017195b49e852e4e42b77997@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45068 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750769AbaAXDwW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jan 2014 22:52:22 -0500
Content-Disposition: inline
In-Reply-To: <20140124130122.017195b49e852e4e42b77997@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 24, 2014 at 01:01:22PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/rtl8821ae/regd.c: In function '_rtl_reg_apply_beaconing_flags':
> drivers/staging/rtl8821ae/regd.c:200:20: error: 'IEEE80211_CHAN_NO_IBSS' undeclared (first use in this function)
>       ch->flags &= ~IEEE80211_CHAN_NO_IBSS;

Wait, I can't duplicate this at all here, either on just my staging-next
branch, or when merged together with Linus's tree.

Can you send me your .config that you used to cause this to fail
(allmodconfig works just fine here.)

Could this all be due to some wireless patches that aren't merged with
Linus yet but are in linux-next?

If this is going to be a pain, I can easily drop it all and just wait
for 3.15-rc1, but it being a stand-alone driver, that works for hardware
I have here (and rumor has it, Linus also has this box), I figured I
would try to stay ahead of the curve and get it merged :)

thanks,

greg k-h
