From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Thu, 21 May 2009 20:33:33 -0400
Message-ID: <20090522003333.GA2646@tuxdriver.com>
References: <20090521140610.551574fc.sfr@canb.auug.org.au> <20090521.152511.171736740.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:36868 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752228AbZEVApY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2009 20:45:24 -0400
Content-Disposition: inline
In-Reply-To: <20090521.152511.171736740.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, abhijeet.kolekar@intel.com, reinette.chatre@intel.com

On Thu, May 21, 2009 at 03:25:11PM -0700, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 21 May 2009 14:06:10 +1000
> 
> > Today's linux-next merge of the net tree got a conflict in
> > drivers/net/wireless/iwlwifi/iwl-agn.c
> > drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
> > fbc9f97bbf5e1eaee562eba93dc60faaff3f3bfa ("iwlwifi: do not cancel delayed
> > work inside spin_lock_irqsave") from the wireless-current tree and commit
> > 727882d62477ed45d248e8cd6d53cf794537b073 ("iwl3945: use iwl_set_mode in
> > 3945") from the net tree.
> > 
> > I removed iwl{3945,}_set_mode() from and applied the following patch.
> 
> I'll sort this out right now, thanks Stephen.

wireless-next-2.6 has a merge-test branch for reference.

Hth!

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
