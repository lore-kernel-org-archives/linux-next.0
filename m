From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] revert headers_check fix: ia64, fpu.h
Date: Fri, 6 Feb 2009 15:55:56 +0100
Message-ID: <20090206145556.GH18368@elte.hu>
References: <20090206164546.6291.KOSAKI.MOTOHIRO@jp.fujitsu.com> <3f9a31f40902060053x18dacf58u40c739ab89f13860@mail.gmail.com> <20090206180957.6294.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:35200 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbZBFO4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 09:56:38 -0500
Content-Disposition: inline
In-Reply-To: <20090206180957.6294.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Jaswinder Singh Rajput <jaswinderlinux@gmail.com>, Jaswinder Singh Rajput <jaswinder@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, hskinnemoen@atmel.com, cooloney@kernel.org, tony.luck@intel.com, ralf@linux-mips.org, dhowells@redhat.com, matthew@wil.cx, chris@zankel.net, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>


* KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:

> > > Index: b/arch/ia64/include/asm/fpu.h
> > > ===================================================================
> > > --- a/arch/ia64/include/asm/fpu.h
> > > +++ b/arch/ia64/include/asm/fpu.h
> > > @@ -6,7 +6,7 @@
> > >  *     David Mosberger-Tang <davidm@hpl.hp.com>
> > >  */
> > >
> > > -#include <linux/types.h>
> > > +#include <asm/types.h>
> > >
> > 
> > No , we do not even need asm/types.h
> > 
> > Subject: [PATCH] Neither asm/types.h nor linux/types.h is not required
> > for arch/ia64/include/asm/fpu.h
> > 
> > Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
> 
> ok. I confirmed.
> 	Tested-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
> 	Reviewed-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

Thanks.

Jaswinder, mind adding these tags to the commit and sending a pull request 
with all fixes?

	Ingo
