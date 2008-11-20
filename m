From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree
Date: Thu, 20 Nov 2008 08:48:09 -0500
Message-ID: <20081120134808.GA4329@tuxdriver.com>
References: <20081120140750.1373326e.sfr@canb.auug.org.au> <20081120.002705.95132527.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:41814 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754756AbYKTOBR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2008 09:01:17 -0500
Content-Disposition: inline
In-Reply-To: <20081120.002705.95132527.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, johannes@sipsolutions.net, tomas.winkler@intel.com, reinette.chatre@intel.com, yi.zhu@intel.com

On Thu, Nov 20, 2008 at 12:27:05AM -0800, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 20 Nov 2008 14:07:50 +1100
> 
> > Today's linux-next merge of the wireless tree got a conflict in
> > drivers/net/wireless/iwlwifi/iwl-rx.c between commit
> > 4018517a1a69a85c3d61b20fa02f187b80773137 ("iwlagn: fix RX skb alignment")
> > from the wireless-current tree and commit
> > 07e27f25d0c73f42562473f642f20b8fa996a9de ("iwlwifi: move rx queue read
> > pointer into rxq") from the wireless tree.
> > 
> > I wasn't sure how to resolve the conflict so have dropped the wireless
> > tree for today.  I assume it will be fixed in the wireless (or net) tree
> > soon.
> 
> I'll sort these out with John somehow, thanks for the report
> Stephen,

I have all these sorted (including the ieee80211_notify_mac one)
in the merge-test branch of wireless-next-2.6.

John
-- 
John W. Linville		Linux should be at the core
linville@tuxdriver.com			of your literate lifestyle.
