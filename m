From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: linux-next: kernel/trace/trace.c:658: error:
Date: Thu, 23 Oct 2008 14:48:15 +0200
Message-ID: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
	 <20081023121145.GB27984@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755862AbYJWMsb@vger.kernel.org>
In-Reply-To: <20081023121145.GB27984@x200.localdomain>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

2008/10/23 Alexey Dobriyan <adobriyan@gmail.com>:
> On alpha-smp-n-debug-y:
>
> kernel/trace/trace.c: In function 'tracing_generic_entry_update':
> kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'
> kernel/trace/trace.c: In function 'tracing_cpumask_write':
> kernel/trace/trace.c:2145: error: implicit declaration of function 'raw_local_irq_disable'
> kernel/trace/trace.c:2162: error: implicit declaration of function 'raw_local_irq_enable'
> kernel/trace/trace.c: In function 'trace_die_handler':
> kernel/trace/trace.c:3039: error: 'DIE_OOPS' undeclared (first use in this function)
>
> This has something with config dependencies, because adding include doesn't fix it.
>

A lot of arch have an asm/irqflags.h but not alpha.
In linux/irqflags, raw_local_irq_* functions are defined to be
local_irq_* function if they don't support
CONFIG_TRACE_IRQFLAGS_SUPPORT.
It seems the error is here, alpha may turn this option off.
