From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: Tree for December 3
Date: Thu, 03 Dec 2009 17:30:19 +0900
Message-ID: <4B17771B.7050902@kernel.org>
References: <20091203180214.16e452ed.sfr@canb.auug.org.au> <4B176B50.4050901@petalogix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:43822 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752742AbZLCI3t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Dec 2009 03:29:49 -0500
In-Reply-To: <4B176B50.4050901@petalogix.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: michal.simek@petalogix.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

On 12/03/2009 04:40 PM, Michal Simek wrote:
> todays tree is working on MMU microblaze correctly without any visible
> problem but noMMU microblaze kernel still have that bug as I reported
> some days ago.

Other than triggering WARN_ON(), it doesn't cause any other problems,
right?  It's probably because SMP_CACHE_BYTES on that configuration is
lower than 8.  What is the value of SMP_CACHE_BYTES on the
configuration?  Also, doesn't the Linus's tree have the same problem?

The somewhat spurious WARN_ON() in percpu allocator should probably be
just removed or bumped to check against PAGE_SIZE as SMP code does.
The problem is that on UP even though the function takes @align
parameter, it just ignores it.  :-(

Thanks.

-- 
tejun
