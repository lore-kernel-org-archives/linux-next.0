From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] revert headers_check fix: ia64, fpu.h
Date: Fri, 6 Feb 2009 14:42:53 +0100
Message-ID: <20090206134253.GA9919@uranus.ravnborg.org>
References: <1233385816.17794.16.camel@localhost.localdomain> <20090206164546.6291.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:55369 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753731AbZBFNlI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2009 08:41:08 -0500
Content-Disposition: inline
In-Reply-To: <20090206164546.6291.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, hskinnemoen@atmel.com, cooloney@kernel.org, tony.luck@intel.com, ralf@linux-mips.org, dhowells@redhat.com, matthew@wil.cx, chris@zankel.net, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>

On Fri, Feb 06, 2009 at 05:19:00PM +0900, KOSAKI Motohiro wrote:
> > diff --git a/arch/ia64/include/asm/fpu.h b/arch/ia64/include/asm/fpu.h
> > index 3859558..b6395ad 100644
> > --- a/arch/ia64/include/asm/fpu.h
> > +++ b/arch/ia64/include/asm/fpu.h
> > @@ -6,7 +6,7 @@
> >   *	David Mosberger-Tang <davidm@hpl.hp.com>
> >   */
> >  
> > -#include <asm/types.h>
> > +#include <linux/types.h>
> 
> this change break ia64 build perfectly.
> this patch seems don't tested at all.
> 
> Ingo, I hope you ask patch author how to test posted patch ;-)

Patch author test the patch by adding it to a git tree that hits -next.
And this catched ths bug - so -next served its purpose.

	Sam
