From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Fri, 6 Feb 2015 21:11:57 +0100
Message-ID: <CA+icZUWB6XHvOxV-_b=m=c1-RvE3FVbeDeih__zZbZ23dVVJ6Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:57540 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754166AbbBFUL6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 15:11:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 6, 2015 at 9:06 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
>

Subject: x86/tbl/trace: ---> .../tlb/...

- Sedat -

> When taking a CPU down for suspend and resume, a tracepoint may be called
> when the CPU has been designated offline. As tracepoints require RCU for
> protection, they must not be called if the current CPU is offline.
>
> Unfortunately, trace_tlb_flush() is called in this scenario as was noted
> by LOCKDEP:
>
> ...
>
>  Disabling non-boot CPUs ...
>  intel_pstate CPU 1 exiting
>
>  ===============================
>  smpboot: CPU 1 didn't die...
>  [ INFO: suspicious RCU usage. ]
>  3.19.0-rc7-next-20150204.1-iniza-small #1 Not tainted
>  -------------------------------
>  include/trace/events/tlb.h:35 suspicious rcu_dereference_check() usage!
>
>  other info that might help us debug this:
>
>  RCU used illegally from offline CPU!
>  rcu_scheduler_active = 1, debug_locks = 0
>  no locks held by swapper/1/0.
>
>  stack backtrace:
>  CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.19.0-rc7-next-20150204.1-iniza-small #1
>  Hardware name: SAMSUNG ELECTRONICS CO., LTD. 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
>   0000000000000001 ffff88011a44fe18 ffffffff817e370d 0000000000000011
>   ffff88011a448290 ffff88011a44fe48 ffffffff810d6847 ffff8800c66b9600
>   0000000000000001 ffff88011a44c000 ffffffff81cb3900 ffff88011a44fe78
>  Call Trace:
>   [<ffffffff817e370d>] dump_stack+0x4c/0x65
>   [<ffffffff810d6847>] lockdep_rcu_suspicious+0xe7/0x120
>   [<ffffffff810b71a5>] idle_task_exit+0x205/0x2c0
>   [<ffffffff81054c4e>] play_dead_common+0xe/0x50
>   [<ffffffff81054ca5>] native_play_dead+0x15/0x140
>   [<ffffffff8102963f>] arch_cpu_idle_dead+0xf/0x20
>   [<ffffffff810cd89e>] cpu_startup_entry+0x37e/0x580
>   [<ffffffff81053e20>] start_secondary+0x140/0x150
>  intel_pstate CPU 2 exiting
>
> ...
>
> By converting the tlb_flush tracepoint to a TRACE_EVENT_CONDITION where the
> condition is cpu_online(smp_processor_id()), we can avoid calling RCU protected
> code when the CPU is offline.
>
> Link: http://lkml.kernel.org/r/CA+icZUUGiGDoL5NU8RuxKzFjoLjEKRtUWx=JB8B9a0EQv-eGzQ@mail.gmail.com
>
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  include/trace/events/tlb.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/trace/events/tlb.h b/include/trace/events/tlb.h
> index 13391d288107..0e7635765153 100644
> --- a/include/trace/events/tlb.h
> +++ b/include/trace/events/tlb.h
> @@ -13,11 +13,13 @@
>         { TLB_LOCAL_SHOOTDOWN,          "local shootdown" },            \
>         { TLB_LOCAL_MM_SHOOTDOWN,       "local mm shootdown" }
>
> -TRACE_EVENT(tlb_flush,
> +TRACE_EVENT_CONDITION(tlb_flush,
>
>         TP_PROTO(int reason, unsigned long pages),
>         TP_ARGS(reason, pages),
>
> +       TP_CONDITION(cpu_online(smp_processor_id())),
> +
>         TP_STRUCT__entry(
>                 __field(          int, reason)
>                 __field(unsigned long,  pages)
> --
> 2.1.4
>
>
