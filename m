From: Chris Ball <cjb@laptop.org>
Subject: Re: linux-next: manual merge of the mmc tree with the s5p tree
Date: Mon, 26 Mar 2012 23:29:47 -0400
Message-ID: <87haxayb4k.fsf@laptop.org>
References: <20120327141033.352dfd5cc4ee937ee7371860@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:57473 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757609Ab2C0D3z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Mar 2012 23:29:55 -0400
In-Reply-To: <20120327141033.352dfd5cc4ee937ee7371860@canb.auug.org.au>
	(Stephen Rothwell's message of "Tue, 27 Mar 2012 14:10:33 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Linus <torvalds@linux-foundation.org>

Hi,

On Mon, Mar 26 2012, Stephen Rothwell wrote:
> This conflict has been caused in part because you rebased your tree and
> copied some commits that used to be merged into your tree from a shared
> branch.   Do *not* do that ... BTW, when you rebased those commits into
> your tree, you did not sign them either.  This is exactly what Linus has
> just berated one of the other maintainers for ...

Ugh, I'm sorry for screwing this up.

> I am not fixing this conflict, I am just using the version of your tree
> that I have from next-20120326.  Please fix your tree up properly.

I've reverted to the version in next-20120326 too, and will avoid rebasing.

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
