From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the net-current
 tree
Date: Thu, 13 Aug 2009 19:50:42 -0700 (PDT)
Message-ID: <20090813.195042.203385912.davem@davemloft.net>
References: <20090814124040.534dd43c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44940
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753737AbZHNCub (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2009 22:50:31 -0400
In-Reply-To: <20090814124040.534dd43c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhananjay@netxen.com, amit@netxen.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 14 Aug 2009 12:40:40 +1000

> Hi David,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/netxen/netxen_nic_main.c between commits
> e424fa9d6a0add1a9b812b07e3607daaa5b9e53d ("netxen: remove netxen
> workqueue") and 232e7d68d50c9ac3a55d716e5ae215ecd1e043b9 ("netxen: free
> napi resources during detach") from the net-current tree and commits
> 6598b169b856793f8f9b80a3f3c5a48f5eaf40e3 ("netxen: enable ip addr
> hashing"), f17443f4b01659a5c44d5fc6f5c502c39c293959 ("netxen: refactor
> net_device setup code") and 7042cd8f148345bfca6c336f009c96a416674f5e
> ("netxen: support for ethtool set ringparam") from the net tree.
> 
> I fixed it up (I hope) (see below) and can carry the fix as necessary.

Thanks for the note Stephen.

I'll do a merge of net-2.6 into net-next-2.6 to resolve this
and get it out of your hair.
