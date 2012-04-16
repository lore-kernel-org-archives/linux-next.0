From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (sparc-next tree related)
Date: Mon, 16 Apr 2012 02:16:13 -0400 (EDT)
Message-ID: <20120416.021613.606704342231219042.davem@davemloft.net>
References: <20120416155907.32c0041caa002f72da4635b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:41070 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751657Ab2DPGSX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 02:18:23 -0400
In-Reply-To: <20120416155907.32c0041caa002f72da4635b7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tkhai@yandex.ru, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Apr 2012 15:59:07 +1000

> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
> 
> arch/sparc/kernel/pcic.c: In function 'pci_time_init':
> arch/sparc/kernel/pcic.c:741:2: error: 'timer_cs_period' undeclared (first use in this function)
> 
> Caused by commit 62f082830d63 ("sparc32: generic clockevent support").
> 
> I have reverted that commit for today.

Sam, Tkhai, please fix this.
