From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the akpm tree with the sparc-next
 tree
Date: Thu, 21 Mar 2013 16:21:53 -0400 (EDT)
Message-ID: <20130321.162153.1171536447340639084.davem@davemloft.net>
References: <20130321163328.2c6dccabad6a8dc8fe4b0e24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:46678 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589Ab3CUUVy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Mar 2013 16:21:54 -0400
In-Reply-To: <20130321163328.2c6dccabad6a8dc8fe4b0e24@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: akpm@linux-foundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, liuj97@gmail.com, tkhai@yandex.ru

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 Mar 2013 16:33:28 +1100

> Today's linux-next merge of the akpm tree got a conflict in
> arch/sparc/mm/init_64.c between commit ce835e513a93 ("sparc64: Do not
> change num_physpages during initmem freeing") from the sparc-next tree
> and commit "mm/SPARC: use common help functions to free reserved pages"
> from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

This was expected, and the merge resolution looks fine to me,
thanks Stephen!
