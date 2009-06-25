From: Jon Masters <jonathan@jonmasters.org>
Subject: Re: [PATCH -next 1/2] ring-buffer: Really make it generic.
Date: Thu, 25 Jun 2009 03:09:04 -0400
Message-ID: <1245913744.28602.21.camel@perihelion.bos.jonmasters.org>
References: <20090625053012.GB19944@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:39336 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbZFYHJK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2009 03:09:10 -0400
In-Reply-To: <20090625053012.GB19944@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@elte.hu>, Jon Masters <jcm@jonmasters.org>, linux-next@vger.kernel.org

On Thu, 2009-06-25 at 14:30 +0900, Paul Mundt wrote:
> In hunting down the cause for the hwlat_detector ring buffer spew in
> my failed -next builds it became obvious that folks are now treating
> ring_buffer as something that is generic independent of tracing and thus,
> suitable for public driver consumption.
> 
> Given that there are only a few minor areas in ring_buffer that have any
> reliance on CONFIG_TRACING or CONFIG_FUNCTION_TRACER, provide stubs for
> those and make it generally available.

Thanks for this. I had discussed it with Steven previously and I can't
imagine why he wouldn't be in favor of wider use - I suggested that it's
about time ring_buffer moved out of trace/ and got it's own place (it's
getting to be a big boy now, full of youthful aspiration) but we'll have
to wait for him to get back from his trip and let us know what he wants.

Jon.
