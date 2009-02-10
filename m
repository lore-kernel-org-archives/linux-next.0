From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] alpha: fix link error re stacktrace
Date: Tue, 10 Feb 2009 13:25:15 +0100
Message-ID: <20090210122515.GB28817@elte.hu>
References: <20090209193908.1a448944.sfr@canb.auug.org.au> <20090209213836.GA9492@x200.localdomain> <20090209215501.GB12820@ghostprotocols.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37346 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751724AbZBJMZf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Feb 2009 07:25:35 -0500
Content-Disposition: inline
In-Reply-To: <20090209215501.GB12820@ghostprotocols.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-next@vger.kernel.org


* Arnaldo Carvalho de Melo <acme@redhat.com> wrote:

> Em Tue, Feb 10, 2009 at 12:38:36AM +0300, Alexey Dobriyan escreveu:
> > Please, fold this into 32c0bd9624115041cfec31c0436995418083090a
> > "blktrace: the ftrace interface needs CONFIG_TRACING"
> > to fix link error on alpha (which doesn't implenent stacktrace support)
> > 
> > --- a/block/Kconfig
> > +++ b/block/Kconfig
> > @@ -51,7 +51,7 @@ config BLK_DEV_IO_TRACE
> >  	select DEBUG_FS
> >  	select TRACEPOINTS
> >  	select TRACING
> > -	select STACKTRACE
> > +	select STACKTRACE if STACKTRACE_SUPPORT
> >  	help
> >  	  Say Y here if you want to be able to trace the block layer actions
> >  	  on a given queue. Tracing allows you to see any traffic happening
> 
> Well, with 51a763dd84253bab1d0a1e68e11a7753d1b702ca this can as well be
> reverted :-)

ok, done - thanks Arnaldo!

	Ingo
