From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH -next] alpha: fix link error re stacktrace
Date: Mon, 9 Feb 2009 19:55:01 -0200
Message-ID: <20090209215501.GB12820@ghostprotocols.net>
References: <20090209193908.1a448944.sfr@canb.auug.org.au> <20090209213836.GA9492@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:33154 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751080AbZBIVz1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2009 16:55:27 -0500
Content-Disposition: inline
In-Reply-To: <20090209213836.GA9492@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-next@vger.kernel.org

Em Tue, Feb 10, 2009 at 12:38:36AM +0300, Alexey Dobriyan escreveu:
> Please, fold this into 32c0bd9624115041cfec31c0436995418083090a
> "blktrace: the ftrace interface needs CONFIG_TRACING"
> to fix link error on alpha (which doesn't implenent stacktrace support)
> 
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -51,7 +51,7 @@ config BLK_DEV_IO_TRACE
>  	select DEBUG_FS
>  	select TRACEPOINTS
>  	select TRACING
> -	select STACKTRACE
> +	select STACKTRACE if STACKTRACE_SUPPORT
>  	help
>  	  Say Y here if you want to be able to trace the block layer actions
>  	  on a given queue. Tracing allows you to see any traffic happening

Well, with 51a763dd84253bab1d0a1e68e11a7753d1b702ca this can as well be
reverted :-)

- Arnaldo
