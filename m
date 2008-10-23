From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 23 Oct 2008 20:34:33 +0400
Message-ID: <20081023163433.GA3160@x200.localdomain>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au> <20081023121145.GB27984@x200.localdomain> <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com> <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com> <49008D12.5090204@gmail.com> <Pine.LNX.4.64.0810231635440.18978@anakin> <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com> <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:54314 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753239AbYJWQbZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 12:31:25 -0400
Received: by ey-out-2122.google.com with SMTP id 6so129682eyi.37
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 09:31:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4900B414.7090002@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

On Thu, Oct 23, 2008 at 07:27:48PM +0200, Frederic Weisbecker wrote:
> When tracing is enabled, some arch have included <linux/irqflags.h>
> on their <asm/system.h> but others like alpha or m68k don't.
> 
> Build error on alpha:
> 
> kernel/trace/trace.c: In function 'tracing_generic_entry_update':
> kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'
> kernel/trace/trace.c: In function 'tracing_cpumask_write':
> kernel/trace/trace.c:2145: error: implicit declaration of function 'raw_local_irq_disable'
> kernel/trace/trace.c:2162: error: implicit declaration of function 'raw_local_irq_enable'
> kernel/trace/trace.c: In function 'trace_die_handler':
> kernel/trace/trace.c:3039: error: 'DIE_OOPS' undeclared (first use in this function)
> 
> Build error on m68k:
> http://kisskb.ellerman.id.au/kisskb/buildresult/50641/
> 
> 
> Include it on kernel/trace/trace.c
> 
> Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
> Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> ---
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 78d5661..deb9684 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -34,6 +34,7 @@
>  
>  #include <linux/stacktrace.h>
>  #include <linux/ring_buffer.h>
> +#include <linux/irqflags.h>

Sure, except it doesn't fix anything.
