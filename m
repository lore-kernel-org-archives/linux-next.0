From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next 1/2] ring-buffer: Really make it generic.
Date: Thu, 25 Jun 2009 10:32:32 +0200
Message-ID: <20090625083232.GA2482@elte.hu>
References: <20090625053012.GB19944@linux-sh.org> <1245913744.28602.21.camel@perihelion.bos.jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:46820 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752128AbZFYIcq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2009 04:32:46 -0400
Content-Disposition: inline
In-Reply-To: <1245913744.28602.21.camel@perihelion.bos.jonmasters.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>, Steven Rostedt <rostedt@goodmis.org>, Jon Masters <jcm@jonmasters.org>, linux-next@vger.kernel.org


* Jon Masters <jonathan@jonmasters.org> wrote:

> On Thu, 2009-06-25 at 14:30 +0900, Paul Mundt wrote:
> > In hunting down the cause for the hwlat_detector ring buffer spew in
> > my failed -next builds it became obvious that folks are now treating
> > ring_buffer as something that is generic independent of tracing and thus,
> > suitable for public driver consumption.
> > 
> > Given that there are only a few minor areas in ring_buffer that 
> > have any reliance on CONFIG_TRACING or CONFIG_FUNCTION_TRACER, 
> > provide stubs for those and make it generally available.
> 
> Thanks for this. I had discussed it with Steven previously and I 
> can't imagine why he wouldn't be in favor of wider use - I 
> suggested that it's about time ring_buffer moved out of trace/ and 
> got it's own place (it's getting to be a big boy now, full of 
> youthful aspiration) but we'll have to wait for him to get back 
> from his trip and let us know what he wants.

The patch makes sense - i've queued it up in tip:tracing/urgent - 
the sooner we have it upstream the better.

	Ingo
