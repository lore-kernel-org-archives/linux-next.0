From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Thu, 21 May 2009 15:25:11 -0700 (PDT)
Message-ID: <20090521.152511.171736740.davem@davemloft.net>
References: <20090521140610.551574fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:60943
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754334AbZEUWZN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 18:25:13 -0400
In-Reply-To: <20090521140610.551574fc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, abhijeet.kolekar@intel.com, linville@tuxdriver.com, reinette.chatre@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 May 2009 14:06:10 +1000

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/iwlwifi/iwl-agn.c
> drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
> fbc9f97bbf5e1eaee562eba93dc60faaff3f3bfa ("iwlwifi: do not cancel delayed
> work inside spin_lock_irqsave") from the wireless-current tree and commit
> 727882d62477ed45d248e8cd6d53cf794537b073 ("iwl3945: use iwl_set_mode in
> 3945") from the net tree.
> 
> I removed iwl{3945,}_set_mode() from and applied the following patch.

I'll sort this out right now, thanks Stephen.
