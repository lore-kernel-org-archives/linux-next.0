From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (net-next tree related)
Date: Thu, 19 Apr 2012 02:40:34 -0400 (EDT)
Message-ID: <20120419.024034.1013342902483709669.davem@davemloft.net>
References: <20120419162859.904574e2518c5a904802efbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:45874 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918Ab2DSGmo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Apr 2012 02:42:44 -0400
In-Reply-To: <20120419162859.904574e2518c5a904802efbc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, majianpeng@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Apr 2012 16:28:59 +1000

> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> net/ipv4/route.c: In function 'ip_static_sysctl_init':
> net/ipv4/route.c:3517:2: error: implicit declaration of function 'kmemleak_not_leak' [-Werror=implicit-function-declaration]
...
> net/core/sysctl_net_core.c: In function 'sysctl_core_init':
> net/core/sysctl_net_core.c:259:2: error: implicit declaration of function 'kmemleak_not_leak' [-Werror=implicit-function-declaration]
...

I already checked in a fix for this, thanks Stephen.
