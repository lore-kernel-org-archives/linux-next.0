From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the net-current
 tree
Date: Sat, 14 Feb 2009 23:12:37 -0800 (PST)
Message-ID: <20090214.231237.266040656.davem@davemloft.net>
References: <20090212134604.5ce2fe53.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:43690
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751237AbZBOHMn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Feb 2009 02:12:43 -0500
In-Reply-To: <20090212134604.5ce2fe53.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, reinette.chatre@intel.com, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Feb 2009 13:46:04 +1100

> Hi David,
> 
> Today's linux-next merge of the net tree got conflicts in
> drivers/net/wireless/iwlwifi/iwl-agn.c and
> drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
> 89c581b3fb2986e303f1299e6458e3e9b115fa3f ("iwlwifi: fix suspend/resume
> and its usage of pci saved state") from the net-current tree and commits
> from the net tree.
> 
> I assume this is what John was referring to when he said:
> 
> > The iwlwifi patch corrects a problem (introduced by the previous iwlwifi
> > fix) that disables the iwlwifi devices after suspend/resume.  It will
> > conflict with what is already in -next -- just take the hunks that are
> > already in -next and ignore the hunks introduced here.
> 
> So I took that advise.

I'm clearing up this merge issue right now, thanks!
