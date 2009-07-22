From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the
 wireless-current tree
Date: Tue, 21 Jul 2009 20:04:37 -0700 (PDT)
Message-ID: <20090721.200437.193707224.davem@davemloft.net>
References: <20090722115956.482777b4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52173
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753174AbZGVDEc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2009 23:04:32 -0400
In-Reply-To: <20090722115956.482777b4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, samuel.ortiz@intel.com, yi.zhu@intel.com, linville@tuxdriver.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Jul 2009 11:59:56 +1000

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/iwmc3200wifi/netdev.c between commit
> 513a2396d8e8327aff1ce50bea3fb4f16ff3455b ("iwmc3200wifi: fix NULL pointer
> dereference in iwm_if_free") from the wireless-current tree and commit
> 3549716484a95fd16f7fcf8b68699bd4c803b382 ("iwmc3200wifi: cache keys when
> interface is down") from the net tree.
> 
> Just context changes.   I fixed it up (see below) and can carry the fix
> as necessary.

Thanks Stephen, I'll let Linville and the wireless folks sort
this one out.
