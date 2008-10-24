From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Fri, 24 Oct 2008 16:16:45 +0200
Message-ID: <4901D8CD.7000405@gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au> <20081023121145.GB27984@x200.localdomain> <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com> <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com> <49008D12.5090204@gmail.com> <Pine.LNX.4.64.0810231635440.18978@anakin> <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com> <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain> <20081023163850.GB16591@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.187]:49001 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752758AbYJXNK4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Oct 2008 09:10:56 -0400
Received: by mu-out-0910.google.com with SMTP id g7so600774muf.1
        for <linux-next@vger.kernel.org>; Fri, 24 Oct 2008 06:10:54 -0700 (PDT)
In-Reply-To: <20081023163850.GB16591@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

Ingo Molnar wrote:
> * Alexey Dobriyan <adobriyan@gmail.com> wrote:
> 
>> On Thu, Oct 23, 2008 at 07:27:48PM +0200, Frederic Weisbecker wrote:
>>> When tracing is enabled, some arch have included <linux/irqflags.h>
>>> on their <asm/system.h> but others like alpha or m68k don't.
>>>
>>> Build error on alpha:
>>>
>>> kernel/trace/trace.c: In function 'tracing_generic_entry_update':
>>> kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'
>>> kernel/trace/trace.c: In function 'tracing_cpumask_write':
>>> kernel/trace/trace.c:2145: error: implicit declaration of function 'raw_local_irq_disable'
>>> kernel/trace/trace.c:2162: error: implicit declaration of function 'raw_local_irq_enable'
>>> kernel/trace/trace.c: In function 'trace_die_handler':
>>> kernel/trace/trace.c:3039: error: 'DIE_OOPS' undeclared (first use in this function)
>>>
>>> Build error on m68k:
>>> http://kisskb.ellerman.id.au/kisskb/buildresult/50641/
>>>
>>>
>>> Include it on kernel/trace/trace.c
>>>
>>> Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
>>> Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
>>> ---
>>> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
>>> index 78d5661..deb9684 100644
>>> --- a/kernel/trace/trace.c
>>> +++ b/kernel/trace/trace.c
>>> @@ -34,6 +34,7 @@
>>>  
>>>  #include <linux/stacktrace.h>
>>>  #include <linux/ring_buffer.h>
>>> +#include <linux/irqflags.h>
>> Sure, except it doesn't fix anything.
> 
> hm, zapped the commit then.
> 
> the problem is most likely that none of these architectures is lockdep 
> enabled, hence they have no irqtrace wrappers, hence not all of the 
> tracers can be built on them?
> 
> 	Ingo
> 

I just testes my patch by building with a cross compiler on Alpha.
Before the patch:

kernel/trace/trace.c: In function 'tracing_generic_entry_update':
kernel/trace/trace.c:664: error: implicit declaration of function 'irqs_disabled_flags'
kernel/trace/trace.c: In function 'tracing_cpumask_write':
kernel/trace/trace.c:2150: error: implicit declaration of function 'raw_local_irq_disable'
kernel/trace/trace.c:2167: error: implicit declaration of function 'raw_local_irq_enable'
kernel/trace/trace.c: In function 'trace_die_handler':
kernel/trace/trace.c:3044: error: 'DIE_OOPS' undeclared (first use in this function)
kernel/trace/trace.c:3044: error: (Each undeclared identifier is reported only once
kernel/trace/trace.c:3044: error: for each function it appears in.)

After the patch:

kernel/trace/trace.c: In function 'tracing_generic_entry_update':
kernel/trace/trace.c:664: error: implicit declaration of function 'irqs_disabled_flags'
kernel/trace/trace.c: In function 'trace_die_handler':
kernel/trace/trace.c:3044: error: 'DIE_OOPS' undeclared (first use in this function)
kernel/trace/trace.c:3044: error: (Each undeclared identifier is reported only once
kernel/trace/trace.c:3044: error: for each function it appears in.)

So the raw_local_irq_* functions are defined in linux/irqflags.h, even for arch that doesn't have CONFIG_TRACE_IRQFLAGS_SUPPORT. They just do a local_irq_save/restore.
That's what we wanted. And we have to include it on trace.c for archs like alpha.

So this patch fixes it.

The DIE_OOPS should be fixed by a recent patch from Steven (ftrace: move nmi die handler to arch specific).

The last issue is irqs_disabled_flags. But it's one other problem which is in discussion.
