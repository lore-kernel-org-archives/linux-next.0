From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Sun, 14 Dec 2008 22:59:09 -0800 (PST)
Message-ID: <20081214.225909.128383970.davem@davemloft.net>
References: <20081215144405.d284833d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48362
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753487AbYLOG7I (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 01:59:08 -0500
In-Reply-To: <20081215144405.d284833d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, jeffrey.t.kirsher@intel.com, bruce.w.allan@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Dec 2008 14:44:05 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/e1000e/ich8lan.c between commit
> 30bb0e0dce78427f3e5cb728d6b5ea73acbefffa ("e1000e: fix double release of
> mutex") from the net-current tree and commit
> 0285c8dcaeaa73ddadc4f38383e5bbc03c394a29 ("e1000e: cosmetic newline in
> debug message") from the net tree.
> 
> Trivial context overlap.  I fixed it up (see below) and will carry as
> necessary.

Thanks Stephen.

This will be cleared up next time I merge.
