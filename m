From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: please add queue for removal of __cpuinit and
 friends.
Date: Wed, 26 Jun 2013 12:01:12 -0400
Message-ID: <20130626160112.GB2172@windriver.com>
References: <20130625152702.GA27288@windriver.com>
 <20130626112202.0929939fdc416f23d4bc06fa@canb.auug.org.au>
 <20130626173822.957f35baad3637092bb61a7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:43060 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751832Ab3FZQAj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 12:00:39 -0400
Content-Disposition: inline
In-Reply-To: <20130626173822.957f35baad3637092bb61a7d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>

[Re: linux-next: please add queue for removal of __cpuinit and friends.] On 26/06/2013 (Wed 17:38) Stephen Rothwell wrote:

> Hi Paul,
> 
> On Wed, 26 Jun 2013 11:22:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I will try it today and see how we go.  I assume that the current set of
> > patches is based on next-20130625?
> 
> OK, its in today.  Just for info (at the end of today's linux-next):
> 
> $ git grep -l __cpuinit
> arch/arm/mach-keystone/platsmp.c
> arch/arm/mach-sti/platsmp.c
> arch/mips/ath79/setup.c
> arch/mips/cavium-octeon/octeon-irq.c
> arch/mips/cavium-octeon/smp.c

[...]

> arch/mips/kernel/bmips_vec.S
> arch/mips/kernel/head.S
> arch/mips/mm/cex-sb1.S
> arch/mips/netlogic/common/smpboot.S
> include/linux/init.h
> 
> So I guess the Ralf hasn't put the mips patch in his mips-for-linux-next
> branch yet.  And a few more uses have crept in. :-(

Odd.  It was in mips-for-linux-next on the 20th.  Accidentally dropped?

I've re-inserted the mips patch into my patch queue, fixed up the new
uses that crept in, and refreshed the arm patch that gained a conflict.

Thanks,
Paul.
--

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
