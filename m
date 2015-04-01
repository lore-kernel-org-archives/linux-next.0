From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: build failure after merge of the idle tree
Date: Tue, 31 Mar 2015 22:05:40 -0400
Message-ID: <CAJvTdKn4_7uQazbaOzB2kaOCy7YTPgPm9WUmirPZfNZZmgK53w@mail.gmail.com>
References: <20150330124353.62c1329e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150330124353.62c1329e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Thanks for catching this.
Should be all set now.

cheers,
-Len


On Sun, Mar 29, 2015 at 9:43 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Len,
>
> After merging the idle tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from arch/x86/include/asm/msr.h:131:0,
>                  from arch/x86/include/asm/processor.h:20,
>                  from arch/x86/include/asm/thread_info.h:23,
>                  from include/linux/thread_info.h:54,
>                  from arch/x86/include/asm/preempt.h:6,
>                  from include/linux/preempt.h:18,
>                  from include/linux/smp.h:55,
>                  from include/linux/kernel_stat.h:4,
>                  from drivers/cpufreq/intel_pstate.c:14:
> drivers/cpufreq/intel_pstate.c: In function 'core_get_turbo_pstate':
> drivers/cpufreq/intel_pstate.c:593:9: error: 'MSR_NHM_TURBO_RATIO_LIMIT' undeclared (first use in this function)
>   rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
>          ^
> arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsrl'
>   val = paravirt_read_msr(msr, &_err); \
>                           ^
> drivers/cpufreq/intel_pstate.c:593:9: note: each undeclared identifier is reported only once for each function it appears in
>   rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
>          ^
> arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsrl'
>   val = paravirt_read_msr(msr, &_err); \
>                           ^
>
> Caused by commit ce62fbaf893c ("tools/power turbostat: define and dump
> MSR_TURBO_RATIO_LIMIT2").  Grep is your friend ...
>
> I have used the idle tree from next-20150327 for today.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Len Brown, Intel Open Source Technology Center
