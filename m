From: reinette chatre <reinette.chatre@intel.com>
Subject: Re: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Wed, 22 Apr 2009 11:23:46 -0700
Message-ID: <1240424626.29805.51.camel@rc-desk>
References: <20090422113230.8c36e9ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:14382 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753281AbZDVSRl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 14:17:41 -0400
In-Reply-To: <20090422113230.8c36e9ed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>

John,

On Tue, 2009-04-21 at 18:32 -0700, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> net/mac80211/pm.c between commit 7d42081a271bd8a82f2100524085c4f029e47717
> ("mac80211: do not print WARN if config interface") from the
> wireless-current tree and commit aa3590f6a8ebc24d38698ffb81fb51e97f03c4f4
> ("mac80211: add hardware restart function") from the wireless tree.
> 
> The latter moved the code (to net/mac80211/util.c:ieee80211_reconfig)
> that the former modified.  I just used the version in the wireless tree
> and will leave you to fix this up when the merge happens.

I have no idea how merges work upstream but there is a version of the
"mac80211: do not print WARN if config interface" patch [1] that applies
to net/mac80211/util.c:ieee80211_reconfig. Perhaps it will be easiest to
apply that patch after "mac80211: add hardware restart function"?

Reinette


[1] http://marc.info/?l=linux-wireless&m=124026667231209&w=2
