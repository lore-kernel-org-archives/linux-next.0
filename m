From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Sat, 15 May 2010 22:28:32 +0200
Message-ID: <20100515202829.GA7645@nowhere>
References: <20100514155312.9684cb9d.sfr@canb.auug.org.au> <20100514150343.GQ15159@redhat.com> <20100515073732.GA17120@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100515073732.GA17120@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Don Zickus <dzickus@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On Sat, May 15, 2010 at 09:37:32AM +0200, Ingo Molnar wrote:
> 
> * Don Zickus <dzickus@redhat.com> wrote:
> 
> > Sorry for the mess.  I think the following patch 
> > cleans it up.  The last piece deals with the sparc 
> > mess, the other two pieces should deal with the x86 
> > fallout.
> 
> This patch breaks x86:
> 
> arch/x86/built-in.o: In function `show_stack_log_lvl':
> (.text+0xc2c0): undefined reference to `touch_nmi_watchdog'
> arch/x86/built-in.o: In function `print_trace_address':
> dumpstack.c:(.text+0xd893): undefined reference to `touch_nmi_watchdog'
> arch/x86/built-in.o: In function `mce_timed_out':
> mce.c:(.text+0x20008): undefined reference to `touch_nmi_watchdog'
> arch/x86/built-in.o: In function `enable_lapic_nmi_watchdog':
> (.text+0x261f2): undefined reference to `touch_nmi_watchdog'
> 
> CONFIG_CLOCKSOURCE_WATCHDOG=y
> CONFIG_PERF_EVENTS_NMI=y
> CONFIG_IPMI_WATCHDOG=m
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_NOWAYOUT=y
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_HP_WATCHDOG=y
> CONFIG_SBC_EPX_C3_WATCHDOG=m
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_USBPCWATCHDOG is not set
> CONFIG_HAVE_FTRACE_NMI_ENTER=y
> CONFIG_FTRACE_NMI_ENTER=y
> 
> I'd _strongly_ suggest to simplify the code. There's 
> a few things that could be done to that end:
> 
> - just have a single watchdog option and dont split 
>   the soft-dog from the hard-dog.


This is what we have, ie: CONFIG_LOCKUP_DETECTOR

But we need to keep the softlockup detection out of
the perf dependency. This is what we had previously.
And more especially softlockup detection doesn't need
perf.



> - provide a smooth pathway for architectures that 
>   have an NMI watchdog right now. Dont overlap their 
>   symbols for example.



Agreed.


 
> ... and similar measures.


And I add: remove the old nmi watchdog code from x86, for good.

I'm working on it.
