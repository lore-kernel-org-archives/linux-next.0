From: Nadia Yvette Chambers <nyc@holomorphy.com>
Subject: Re: [patch] propagate name change to comments in kernel source
Date: Wed, 05 Dec 2012 20:17:14 -0500
Message-ID: <1354756634.9720.203.camel@tisifone>
References: <1354754668.9720.198.camel@tisifone>
	 <20121206120148.99919a3512c72947c8baba67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from atl4mhob12.myregisteredsite.com ([209.17.115.50]:36293 "EHLO
	atl4mhob12.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754139Ab2LFBRW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Dec 2012 20:17:22 -0500
Received: from mailpod1.hostingplatform.com (mailpod1.networksolutionsemail.com [206.188.198.65])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id qB61HKv3023446
	for <linux-next@vger.kernel.org>; Wed, 5 Dec 2012 20:17:20 -0500
In-Reply-To: <20121206120148.99919a3512c72947c8baba67@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, Andrew Morton <akpm@linux-foundation.org>

On Thu, 2012-12-06 at 12:01 +1100, Stephen Rothwell wrote:
> OK, that may be a problem.  Does this patch apply to Linus' tree
> currently?  I guess not.  So, either you need to split it up and send it
> to the various maintainers (most if it can probably go through the trivial
> tree (cc'd)).  Or wait until after v3.8-rc1 and fix it so it applies to
> Linus' tree and send it to him.
> Or Andrew (cc'd) may be able to take it (as his tree is based on
> linux-next currently).
> (I have attached the patch for Jiri's and Andrew's benefit)

It applies with offsets to Linus' current git, actually. I can provide a
diff applying with no offsets, but suspect it's unnecessary. The
affected comment blocks don't seem to have experienced much turnover
recently, if ever.

-- nyc
