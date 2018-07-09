From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [next-20180709][bisected 9cf57731][ppc] build fail with ld: BFD
 version 2.26.1-1.fc25 assertion fail elf64-ppc.c:14734
Date: Mon, 09 Jul 2018 23:40:14 +0530
Message-ID: <1531159814.6480.11.camel@abdul.in.ibm.com>
References: <1531129883.6480.7.camel@abdul.in.ibm.com>
         <20180709114716.GN2476@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709114716.GN2476@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-next <linux-next@vger.kernel.org>, stephen Rothwell <sfr@canb.auug.org.au>, mpe <mpe@ellerman.id.au>, sachinp <sachinp@linux.vnet.ibm.com>, Ingo Molnar <mingo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2018-07-09 at 13:47 +0200, Peter Zijlstra wrote:
> On Mon, Jul 09, 2018 at 03:21:23PM +0530, Abdul Haleem wrote:
> > Greeting's
> > 
> > Today's next fails to build on powerpc with below error
> > 
> > kernel/cpu.o:(.data.rel+0x18e0): undefined reference to
> > `lockup_detector_online_cpu'
> > ld: BFD version 2.26.1-1.fc25 assertion fail elf64-ppc.c:14734
> > kernel/cpu.o:(.data.rel+0x18e8): undefined reference to
> > `lockup_detector_offline_cpu'
> > ld: BFD version 2.26.1-1.fc25 assertion fail elf64-ppc.c:14734
> > Makefile:1005: recipe for target 'vmlinux' failed
> > make: *** [vmlinux] Error 1
> 
> Urgh, sorry about that. I think the below should cure that.
> 
> I got confused by all the varioud CONFIG options here abour and
> conflated CONFIG_LOCKUP_DETECTOR and CONFIG_SOFTLOCKUP_DETECTOR it
> seems.
> 
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 80664bbeca43..08f9247e9827 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -33,15 +33,10 @@ extern int sysctl_hardlockup_all_cpu_backtrace;
>  #define sysctl_hardlockup_all_cpu_backtrace 0
>  #endif /* !CONFIG_SMP */
> 
> -extern int lockup_detector_online_cpu(unsigned int cpu);
> -extern int lockup_detector_offline_cpu(unsigned int cpu);
> -
>  #else /* CONFIG_LOCKUP_DETECTOR */
>  static inline void lockup_detector_init(void) { }
>  static inline void lockup_detector_soft_poweroff(void) { }
>  static inline void lockup_detector_cleanup(void) { }
> -#define lockup_detector_online_cpu	NULL
> -#define lockup_detector_offline_cpu	NULL
>  #endif /* !CONFIG_LOCKUP_DETECTOR */
> 
>  #ifdef CONFIG_SOFTLOCKUP_DETECTOR
> @@ -50,12 +45,18 @@ extern void touch_softlockup_watchdog(void);
>  extern void touch_softlockup_watchdog_sync(void);
>  extern void touch_all_softlockup_watchdogs(void);
>  extern unsigned int  softlockup_panic;
> -#else
> +
> +extern int lockup_detector_online_cpu(unsigned int cpu);
> +extern int lockup_detector_offline_cpu(unsigned int cpu);
> +#else /* CONFIG_SOFTLOCKUP_DETECTOR */
>  static inline void touch_softlockup_watchdog_sched(void) { }
>  static inline void touch_softlockup_watchdog(void) { }
>  static inline void touch_softlockup_watchdog_sync(void) { }
>  static inline void touch_all_softlockup_watchdogs(void) { }
> -#endif
> +
> +#define lockup_detector_online_cpu	NULL
> +#define lockup_detector_offline_cpu	NULL
> +#endif /* CONFIG_SOFTLOCKUP_DETECTOR */
> 
>  #ifdef CONFIG_DETECT_HUNG_TASK
>  void reset_hung_task_detector(void);
> 

Thanks Peter for the patch, build and boot is fine.

Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
