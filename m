From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 16 Sep 2010 21:39:39 -0700 (PDT)
Message-ID: <20100916.213939.24608537.davem@davemloft.net>
References: <20100917124238.aa0596cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46675
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750724Ab0IQEjU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Sep 2010 00:39:20 -0400
In-Reply-To: <20100917124238.aa0596cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: paulmck@linux.vnet.ibm.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eric.dumazet@gmail.com, netdev@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Sep 2010 12:42:38 +1000

> Subject: [PATCH] net: include inetdevice.h for rcu_dereference_raw api change
> 
> rcu_dereference_raw() now needs to know the type of its argument.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I've tossed this into net-next-2.6, thanks!
