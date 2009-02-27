From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with Linus' tree
Date: Thu, 26 Feb 2009 23:17:39 -0800 (PST)
Message-ID: <20090226.231739.102662627.davem@davemloft.net>
References: <20090226134859.402ed4df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:59002
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754145AbZB0HRz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Feb 2009 02:17:55 -0500
In-Reply-To: <20090226134859.402ed4df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, fenghua.yu@intel.com, David.Woodhouse@intel.com, bhavesh@vmware.com, chrisw@sous-sol.org, tomas.winkler@intel.com, samuel.ortiz@intel.com, reinette.chatre@intel.com, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Feb 2009 13:48:59 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/iwlwifi/iwl-tx.c between commit
> 6aa03ab06978e97b3e0720f83280d7841051916b ("Fix iwlan DMA mapping
> direction") from Linus' tree and commit
> 7aaa1d79e3a2d573ac469744506f17b1c9386840 ("iwlwifi: Add TFD library
> operations") from the net tree.
> 
> The latter moved some code that the former modified.  I fixed it up (see
> below) and can carry it for a while.

I'll sort this out, thanks Stephen.
