From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the tip tree with the sparc-next
 tree
Date: Mon, 14 May 2012 01:03:14 -0400 (EDT)
Message-ID: <20120514.010314.489356554013696006.davem@davemloft.net>
References: <20120514145114.bc3e8b95da9478486ac0a13e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:52152 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661Ab2ENFHl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 May 2012 01:07:41 -0400
In-Reply-To: <20120514145114.bc3e8b95da9478486ac0a13e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 May 2012 14:51:14 +1000

> Today's linux-next merge of the tip tree got a conflict in
> arch/sparc/include/asm/thread_info_32.h between commit e7b7e0c35655
> ("sparc32: drop btfixup for alloc_thread_info_node/free_thread_info")
> from the sparc-next tree and commit f5e10287367d ("task_allocator: Use
> config switches instead of magic defines") from the tip tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks Stephen, you in fact probably will need to carry this one.
