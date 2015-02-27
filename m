From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Tree for Feb 27 (microblaze build failure)
Date: Fri, 27 Feb 2015 14:39:35 -0800
Message-ID: <1425076775.2690.14.camel@perches.com>
References: <20150227154917.6d285971@canb.auug.org.au>
	 <20150227195958.GA13445@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0008.hostedemail.com ([216.40.44.8]:56989 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754888AbbB0Wjj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Feb 2015 17:39:39 -0500
In-Reply-To: <20150227195958.GA13445@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2015-02-27 at 11:59 -0800, Guenter Roeck wrote:
> On Fri, Feb 27, 2015 at 03:49:17PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150226:
> > 
> > New Tree: rpi
> > 
> > The drm-intel tree gained a conflict against the drm-intel-fixes tree.
> > 
> > The rcu tree gained a build failure so I used the version from
> > next-20150226.
> > 
> > The clk tree lost its build failure but gained another so I used the
> > version from next-20150225.
> > 
> > Non-merge commits (relative to Linus' tree): 1432
> >  1565 files changed, 41138 insertions(+), 36333 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> Building microblaze:mmu_defconfig ... failed
> --------------
> Error log:
> arch/microblaze/kernel/cpu/mb.c: In function 'show_cpuinfo':
> arch/microblaze/kernel/cpu/mb.c:105:2: error: 'x' undeclared (first use in this
> function)
>   x seq_puts(m, "Icache:\t\tno\n");
>     ^
> Joe Perches' fat fingers are to blame for that one.

I have long, slender, exquisite fingers and am the highest
paid hand model in the world.

Oh wait, those are dreams.  Real life _is_ different.

Andrew Morton already picked up the corrected patch I sent.
Dunno how long it'll take to get picked up.

cheers, Joe
