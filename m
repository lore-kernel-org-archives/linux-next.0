From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Thu, 06 Nov 2008 20:47:58 -0800 (PST)
Message-ID: <20081106.204758.156056378.davem@davemloft.net>
References: <20081107152424.175b101a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:47567
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751665AbYKGEr7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Nov 2008 23:47:59 -0500
In-Reply-To: <20081107152424.175b101a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, andrey@cozybit.com, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 7 Nov 2008 15:24:24 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/ath5k/base.c between commit
> 934f6c3f8e7f5d6a6d07ae2df283fd02393019dd ("Revert "ath5k: honor
> FIF_BCN_PRBRESP_PROMISC in STA mode"") from the net-current tree and
> commit b706e65b40417e03c2451bb3f92488f3736843fa ("ath5k: fix mesh point
> operation") from the net tree.
> 
> Just a context change.  I fixed it up (see below) and assume it will be
> fixed in your tree soon.

Thanks a lot Stephen, I'll do a merge to fix this up!
