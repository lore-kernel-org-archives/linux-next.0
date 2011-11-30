From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Wed, 30 Nov 2011 00:40:10 -0500 (EST)
Message-ID: <20111130.004010.1075431174091251814.davem@davemloft.net>
References: <20111130155226.b571cfd7887f03f9e8e1285b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:46981 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab1K3FmX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2011 00:42:23 -0500
In-Reply-To: <20111130155226.b571cfd7887f03f9e8e1285b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: akpm@linux-foundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 30 Nov 2011 15:52:26 +1100

> And many more similar.
> 
> Caused (or exposed) by commit 9222aa56c0ce
> ("include/net/netprio_cgroup.h: various fixes") from the akpm tree.
> 
> I have reverted that commit for today.

Andrew, please submit networking bug fixes to the networking maintainers
in order to avoid problems like this in the future.

Unlike other subsystems, I guarentee to handle it within 24 hours, often
much faster.

Thanks.
