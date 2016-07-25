From: Rich Felker <dalias@libc.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 25 Jul 2016 10:48:46 -0400
Message-ID: <20160725144846.GS15995@brightrain.aerifal.cx>
References: <20160724153233.49f1574d@canb.auug.org.au>
 <alpine.DEB.2.11.1607250915160.5629@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:59185 "EHLO
	brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbcGYOvP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 10:51:15 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1607250915160.5629@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>

On Mon, Jul 25, 2016 at 09:16:48AM +0200, Thomas Gleixner wrote:
> On Sun, 24 Jul 2016, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > In file included from include/linux/clocksource.h:18:0,
> >                  from include/linux/clockchips.h:13,
> >                  from drivers/clocksource/jcore-pit.c:14:
> > include/linux/of.h:1004:20: warning: comparison of distinct pointer types lacks a cast
> >         .data = (fn == (fn_type)NULL) ? fn : fn  }
> >                     ^
> > include/linux/of.h:1020:3: note: in expansion of macro '_OF_DECLARE'
> >    _OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
> >    ^
> > include/linux/clocksource.h:247:2: note: in expansion of macro 'OF_DECLARE_1_RET'
> >   OF_DECLARE_1_RET(clksrc, name, compat, fn)
> >   ^
> > drivers/clocksource/jcore-pit.c:277:1: note: in expansion of macro 'CLOCKSOURCE_OF_DECLARE'
> >  CLOCKSOURCE_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init);
> >  ^
> > 
> > Introduced by commits
> > 
> >   b7c4db861683 ("clocksource/drivers/clksrc-probe: Introduce init functions with return code")
> >   177cf6e52b0a ("clocksources: Switch back to the clksrc table")
> > 
> > interacting with commit
> > 
> >   e0aa0655c60b ("clocksource: add J-Core timer/clocksource driver")
> > 
> > from the sh tree.
> 
> And why is that driver coming through the superh tree and not through the
> clocksource maintainers? It's not only based on an old interface it's probably
> unreviewed as well ...

Drivers will go upstream through their proper subsystem maintainers,
not from my tree, but last time I got feedback that these drivers had
not seen any testing in linux-next. I can refrain from including
patches that I can't upstream directly in my for-next branch in the
future if you'd prefer but this way seemed to make less work for
others.

Rich
