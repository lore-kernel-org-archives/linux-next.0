From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 11 Dec 2013 20:01:27 -0500 (EST)
Message-ID: <20131211.200127.1712966779087317601.davem@davemloft.net>
References: <20131211.193639.2058525533631918382.davem@davemloft.net>
	<20131212114959.b08ea67fe5624ed6fb392c52@canb.auug.org.au>
	<20131211.195852.780453472852893891.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:60850 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab3LLBB3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2013 20:01:29 -0500
In-Reply-To: <20131211.195852.780453472852893891.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jasowang@redhat.com, wuzhy@linux.vnet.ibm.com

From: David Miller <davem@davemloft.net>
Date: Wed, 11 Dec 2013 19:58:52 -0500 (EST)

> Ok I should probably revert that one too.
> 
> I'll go ahead and do that now, because it's the most straightforward
> way to avoid this merge conflict.

Actually scratch that, there is no dependency between these two changes,
it just causes overlapping changes.

If it were the case that the 'net' bug fix actually added back a use
of that removed variable, things would be different.
