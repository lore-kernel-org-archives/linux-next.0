From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH -next 1/2] ring-buffer: Really make it generic.
Date: Thu, 25 Jun 2009 16:16:48 +0900
Message-ID: <20090625071648.GA21069@linux-sh.org>
References: <20090625053012.GB19944@linux-sh.org> <1245913744.28602.21.camel@perihelion.bos.jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:36825 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128AbZFYHRu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2009 03:17:50 -0400
Content-Disposition: inline
In-Reply-To: <1245913744.28602.21.camel@perihelion.bos.jonmasters.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@elte.hu>, Jon Masters <jcm@jonmasters.org>, linux-next@vger.kernel.org

On Thu, Jun 25, 2009 at 03:09:04AM -0400, Jon Masters wrote:
> On Thu, 2009-06-25 at 14:30 +0900, Paul Mundt wrote:
> > In hunting down the cause for the hwlat_detector ring buffer spew in
> > my failed -next builds it became obvious that folks are now treating
> > ring_buffer as something that is generic independent of tracing and thus,
> > suitable for public driver consumption.
> > 
> > Given that there are only a few minor areas in ring_buffer that have any
> > reliance on CONFIG_TRACING or CONFIG_FUNCTION_TRACER, provide stubs for
> > those and make it generally available.
> 
> Thanks for this. I had discussed it with Steven previously and I can't
> imagine why he wouldn't be in favor of wider use - I suggested that it's
> about time ring_buffer moved out of trace/ and got it's own place (it's
> getting to be a big boy now, full of youthful aspiration) but we'll have
> to wait for him to get back from his trip and let us know what he wants.
> 
Ok, then as a stop-gap solution it should at least depend on RING_BUFFER
so that it doesn't blow up the other builds ;-)
