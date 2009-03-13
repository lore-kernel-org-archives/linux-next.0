From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net-current/net tree build failure
Date: Fri, 13 Mar 2009 10:23:35 -0700 (PDT)
Message-ID: <20090313.102335.132685232.davem@davemloft.net>
References: <20090313131655.33117fb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54884
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1756535AbZCMRXt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2009 13:23:49 -0400
In-Reply-To: <20090313131655.33117fb9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, bhutchings@solarflare.com, yanok@emcraft.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Mar 2009 13:16:55 +1100

> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/net/dnet.c: In function 'dnet_poll':
> drivers/net/dnet.c:411: error: implicit declaration of function 'netif_rx_complete'
> drivers/net/dnet.c: In function 'dnet_interrupt':
> drivers/net/dnet.c:510: error: implicit declaration of function 'netif_rx_schedule_prep'
> drivers/net/dnet.c:519: error: implicit declaration of function '__netif_rx_schedule'
> 
> Caused by commit 4796417417a62e2ae83d92cb92e1ecf9ec67b5f5 ("dnet: Dave
> DNET ethernet controller driver (updated)") from the net-current tree
> interacting with commit 288379f050284087578b77e04f040b57db3db3f8 ("net:
> Remove redundant NAPI functions") from the net tree.
> 
> So for today, I have reverted the net-current commit and commit
> 2c5849ea38fdad477d72dcf1c8c4842db4b33aae ("dnet: Fix warnings on 64-bit")
> that depended on it.

This should be fixed now thanks to Ilya's patch which is now in
net-2.6, thanks!
