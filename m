From: Huang Rui <ray.huang@amd.com>
Subject: Re: linux-next: Tree for Mar 24 (events/amd/power)
Date: Fri, 25 Mar 2016 10:41:15 +0800
Message-ID: <20160325024114.GA5353@hr-amur2>
References: <20160324130941.5931a051@canb.auug.org.au>
 <56F41E3F.8000407@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56F41E3F.8000407@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, acme@kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Mar 24, 2016 at 10:05:03AM -0700, Randy Dunlap wrote:
> On 03/23/16 19:09, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any v4.7 related material to your linux-next included
> > trees until after v4.6-rc1 is released.
> > 
> > Changes since 20160323:
> > 
> 
> on i386:
> 
> when CONFIG_CPU_SUP_INTEL is not enabled:
> 
> In file included from ../include/linux/kobject.h:21:0,
>                  from ../include/linux/module.h:17,
>                  from ../arch/x86/events/amd/power.c:13:
> ../arch/x86/events/amd/../perf_event.h:660:31: error: 'events_sysfs_show' undeclared here (not in a function)
>   .attr  = __ATTR(_name, 0444, events_sysfs_show, NULL), \
>                                ^
> ../include/linux/sysfs.h:103:10: note: in definition of macro '__ATTR'
>   .show = _show,      \
>           ^
> ../arch/x86/events/amd/power.c:181:1: note: in expansion of macro 'EVENT_ATTR_STR'
>  EVENT_ATTR_STR(power-pkg, power_pkg, "event=0x01");
>  ^
> ../scripts/Makefile.build:291: recipe for target 'arch/x86/events/amd/power.o' failed
> 

Randy, thanks to report it.
Actually, because one patch is missed to apply.

https://git.kernel.org/cgit/linux/kernel/git/bp/bp.git/commit/?h=tip-perf&id=f5ba42d22cb478d32363b2b8e92e14b1fd190ce1

I will rebase and re-send it.

Thanks,
Rui
