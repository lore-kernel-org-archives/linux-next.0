From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 25 Mar 2014 00:31:46 -0400 (EDT)
Message-ID: <20140325.003146.1533027544821884786.davem@davemloft.net>
References: <20140325130447.e38f4242c03090fd48eae340@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:47386 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbaCYEbr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Mar 2014 00:31:47 -0400
In-Reply-To: <20140325130447.e38f4242c03090fd48eae340@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, roy.qing.li@gmail.com, ebiederm@xmission.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 Mar 2014 13:04:47 +1100

> Today's linux-next merge of the net-next tree got a conflict in
> net/core/netpoll.c between commit c27f0872a344 ("netpoll: fix the skb
> check in pkt_is_ns") from the net tree and commit 9c62a68d1311 ("netpoll:
> Remove dead packet receive code (CONFIG_NETPOLL_TRAP)") from the net-next
> tree.
> 
> I fixed it up (the latter removes the code fixed by the former, so I did
> that) and can carry the fix as necessary (no action is required).

That's a perfect resolution, thanks.
