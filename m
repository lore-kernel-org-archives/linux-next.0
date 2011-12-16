From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 16 Dec 2011 02:34:54 -0500 (EST)
Message-ID: <20111216.023454.1487467569404744896.davem@davemloft.net>
References: <20111216120758.60f967a88c934890e77fa7bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:48105 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756364Ab1LPHhI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2011 02:37:08 -0500
In-Reply-To: <20111216120758.60f967a88c934890e77fa7bd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Dec 2011 12:07:58 +1100

> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in
> net/ipv6/route.c between commit bb3c36863e80 ("ipv6: Check dest prefix
> length on original route not copied one in rt6_alloc_cow()") from the net
> tree and commit 3830847396fa ("ipv6: Various cleanups in route.c") from
> the net-next tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Yep, thanks, I just resolved this by merging net into net-next.
