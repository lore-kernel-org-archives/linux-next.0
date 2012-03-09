From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: manual merge of the cpuidle-cons tree with the tip
 tree
Date: Fri, 09 Mar 2012 08:35:09 -0500
Message-ID: <1331300109.1149.17.camel@fedora>
References: <20120309184041.bd10edffa51dcd43ce069487@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120309184041.bd10edffa51dcd43ce069487@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Lee <rob.lee@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2012-03-09 at 18:40 +1100, Stephen Rothwell wrote:
> diff --cc drivers/cpuidle/cpuidle.c
> index 6588f43,56de5f7..0000000
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@@ -92,15 -109,13 +109,13 @@@ int cpuidle_idle_call(void
>                 return 0;
>         }
>   
> -       target_state = &drv->states[next_state];
> - 
>  -      trace_power_start(POWER_CSTATE, next_state, dev->cpu);
>  -      trace_cpu_idle(next_state, dev->cpu);
>  +      trace_power_start_rcuidle(POWER_CSTATE, next_state, dev->cpu);
>  +      trace_cpu_idle_rcuidle(next_state, dev->cpu);
>   
> -       entered_state = target_state->enter(dev, drv, next_state);
> +       entered_state = cpuidle_enter_ops(dev, drv, next_state);
>   
>  -      trace_power_end(dev->cpu);
>  -      trace_cpu_idle(PWR_EVENT_EXIT, dev->cpu);
>  +      trace_power_end_rcuidle(dev->cpu);
>  +      trace_cpu_idle_rcuidle(PWR_EVENT_EXIT, dev->cpu);
>   

Looks good. My change was just a rename of trace_power_* and
trace_cpu_*, and it looks like another change was the clean up of
target_state. This is a trivial conflict, and there should be no
surprises here.

-- Steve



>         if (entered_state >= 0) {
>                 /* Update cpuidle counters */ 
