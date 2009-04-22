From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree with the
	wireless-current tree
Date: Wed, 22 Apr 2009 14:38:03 -0400
Message-ID: <20090422183803.GH3288@tuxdriver.com>
References: <20090422113230.8c36e9ed.sfr@canb.auug.org.au> <1240424626.29805.51.camel@rc-desk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:47732 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754459AbZDVSpx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 14:45:53 -0400
Content-Disposition: inline
In-Reply-To: <1240424626.29805.51.camel@rc-desk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: reinette chatre <reinette.chatre@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>

On Wed, Apr 22, 2009 at 11:23:46AM -0700, reinette chatre wrote:
> John,
> 
> On Tue, 2009-04-21 at 18:32 -0700, Stephen Rothwell wrote:
> > Hi John,
> > 
> > Today's linux-next merge of the wireless tree got a conflict in
> > net/mac80211/pm.c between commit 7d42081a271bd8a82f2100524085c4f029e47717
> > ("mac80211: do not print WARN if config interface") from the
> > wireless-current tree and commit aa3590f6a8ebc24d38698ffb81fb51e97f03c4f4
> > ("mac80211: add hardware restart function") from the wireless tree.
> > 
> > The latter moved the code (to net/mac80211/util.c:ieee80211_reconfig)
> > that the former modified.  I just used the version in the wireless tree
> > and will leave you to fix this up when the merge happens.
> 
> I have no idea how merges work upstream but there is a version of the
> "mac80211: do not print WARN if config interface" patch [1] that applies
> to net/mac80211/util.c:ieee80211_reconfig. Perhaps it will be easiest to
> apply that patch after "mac80211: add hardware restart function"?

That doesn't really resolve the conflict.  It is, however, helpful
as a reference to me for how to resolve it.

Thanks,

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
