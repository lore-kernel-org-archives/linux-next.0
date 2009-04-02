From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: Tree for March 30: [BUG] kmemleak page fault
Date: Thu, 02 Apr 2009 17:08:35 +0100
Message-ID: <1238688515.28457.120.camel@pc1117.cambridge.arm.com>
References: <20090330200145.8d0da09b.sfr@canb.auug.org.au>
	 <20090330122437.GA4784@traven>
	 <1238578208.14550.4.camel@pc1117.cambridge.arm.com>
	 <20090401095207.GH8877@traven>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:37987 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755868AbZDBQJT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2009 12:09:19 -0400
In-Reply-To: <20090401095207.GH8877@traven>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 2009-04-01 at 11:52 +0200, Matthias Kaehlcke wrote:
> El Wed, Apr 01, 2009 at 10:30:08AM +0100 Catalin Marinas ha dit:
> 
> > On Mon, 2009-03-30 at 14:24 +0200, Matthias Kaehlcke wrote:
> > > linux-next 20090330 causes the following page fault on an edb9302
> > > (ARM) like board:
> > [...]
> > > the fault is reproducible and happens some seconds after having
> > > finished the boot process. please tell me if you need more information
> > > (like the .config, ...) in order to track this down
> > 
> > Yes, the .config would be useful. I'm mainly interested in which slab
> > allocator you are using. I'm testing kmemleak mainly on ARM and haven't
> > seen any issues.
> 
> attached is the .config for linux-next 20090401, which should be
> roughly the same than the 20090330 one.
> 
> some hours ago i booted the board with 20090401 and the page fault
> didn't happen

Do you still get this fault with the latest linux-next? I can't
reproduce it on my ARM platform (I tried it with the latest mainline
kernel as well).

-- 
Catalin
