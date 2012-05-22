From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 22 May 2012 15:05:25 -0400 (EDT)
Message-ID: <20120522.150525.1965961563976193101.davem@davemloft.net>
References: <20120522182010.f93a38e575ed34e88de5b787@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:49954 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755481Ab2EVTHc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 May 2012 15:07:32 -0400
In-Reply-To: <20120522182010.f93a38e575ed34e88de5b787@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 May 2012 18:20:10 +1000

> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
> 
> arch/sparc/kernel/time_32.c: In function 'timer_interrupt':
> arch/sparc/kernel/time_32.c:105:3: error: invalid use of undefined type 'struct clock_event_device'
 ...
> I have no idea what caused this, I did not get this yesterday.  I have
> left this build broken for today.

It builds cleanly in Linus's tree, and I have no local changes in sparc-next.
