From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the wireless tree
Date: Thu, 20 Nov 2008 00:27:05 -0800 (PST)
Message-ID: <20081120.002705.95132527.davem@davemloft.net>
References: <20081120140750.1373326e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54703
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754502AbYKTI1F (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 03:27:05 -0500
In-Reply-To: <20081120140750.1373326e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linville@tuxdriver.com, linux-next@vger.kernel.org, johannes@sipsolutions.net, tomas.winkler@intel.com, reinette.chatre@intel.com, yi.zhu@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Nov 2008 14:07:50 +1100

> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/iwlwifi/iwl-rx.c between commit
> 4018517a1a69a85c3d61b20fa02f187b80773137 ("iwlagn: fix RX skb alignment")
> from the wireless-current tree and commit
> 07e27f25d0c73f42562473f642f20b8fa996a9de ("iwlwifi: move rx queue read
> pointer into rxq") from the wireless tree.
> 
> I wasn't sure how to resolve the conflict so have dropped the wireless
> tree for today.  I assume it will be fixed in the wireless (or net) tree
> soon.

I'll sort these out with John somehow, thanks for the report
Stephen,
