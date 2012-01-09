From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 09 Jan 2012 16:41:44 -0500
Message-ID: <1326145304.7642.40.camel@gandalf.stny.rr.com>
References: <20120105190405.1e3191fb5a43b2a0f1655e1f@canb.auug.org.au>
	 <20120105160448.dc482ef6.akpm@linux-foundation.org>
	 <20120109165950.53933c3050416bd242acff76@canb.auug.org.au>
	 <20120109.133512.1450319978863849902.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:38708 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932071Ab2AIVlv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 16:41:51 -0500
In-Reply-To: <20120109.133512.1450319978863849902.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, akpm@linux-foundation.org, fweisbec@gmail.com, mingo@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org

On Mon, 2012-01-09 at 13:35 -0800, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Jan 2012 16:59:50 +1100
> 
> >> > include/trace/events/kmem.h:267:1: error: implicit declaration of function 'check_trace_callback_type_mm_page_alloc_extfrag' [-Werror=implicit-function-declaration]
> >> > In file included from include/trace/ftrace.h:774:0,
> >> >                  from include/trace/define_trace.h:86,
> >> >                  from include/trace/events/power.h:240,
> >> >                  from kernel/trace/power-traces.c:14:
> >> > include/trace/events/kmem.h: In function 'perf_test_probe_mm_page_pcpu_drain':
> >> > include/trace/events/kmem.h:256:1: error: implicit declaration of function 'check_trace_callback_type_mm_page_pcpu_drain' [-Werror=implicit-function-declaration]
> 
> I think the problem has to do with slab_def.h's explicit inclusion of
> trace/kmem.h
> 
> If this somehow gets included while we are expanding define_trace.h, then
> TRACE_SYSTEM will get redefined and screw up all of the includes that
> define_trace.h is trying to perform for the sake of power.h
> 
> Other architectures probably hit slab_def.h via some earlier includes
> and therefore don't hit this situation like Sparc does.
> 
> Adding an explicit <linux/slab.h> include to power-traces.c indeed fixes
> the build.

Yeah, I have a patch that fixes the bug (removing the
trace/events/kmem.h from slab.h). I'll be posting it as soon as it
finishes my final tests.

-- Steve
