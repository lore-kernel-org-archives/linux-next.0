From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Mon, 3 Aug 2009 11:31:44 +0200
Message-ID: <20090803093144.GC9074@elte.hu>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au> <4A718338.6050907@in.ibm.com> <20090730135623.GB16659@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754725AbZHCJcA@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090730135623.GB16659@aftab>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <borislav.petkov@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-next.vger.kernel.org


* Borislav Petkov <borislav.petkov@amd.com> wrote:

> Hi,
> 
> On Thu, Jul 30, 2009 at 04:55:44PM +0530, Sachin Sant wrote:
> > Today's Next failed to boot on a x86_64 box with following traces
> > 
> > ACPI: Core revision 20090625
> > BUG: unable to handle kernel NULL pointer dereference at (null)
> > IP: [<ffffffff81328c7b>] set_cpu_sibling_map+0x24f/0x353
> 
> I can't trigger it here, please send me your .config. In the meantime,
> you could try the following:
> 
> --
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 3ede593..5fd57fe 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1070,6 +1070,7 @@ void __init native_smp_prepare_cpus(unsigned int max_cpus)
>  	for_each_possible_cpu(i) {
>  		zalloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
>  		zalloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
> +		zalloc_cpumask_var(&per_cpu(cpu_node_map, i), GFP_KERNEL);
>  		zalloc_cpumask_var(&cpu_data(i).llc_shared_map, GFP_KERNEL);
>  	}

Borislav, this patch:

 From 4581c6313c16a38ffcef8bccd6ffbe9598d585b0 Mon Sep 17 00:00:00 2001
 From: Andreas Herrmann <andreas.herrmann3@amd.com>
 Date: Fri, 24 Jul 2009 10:21:06 +0200
 Subject: [PATCH] x86: provide CPU topology information for multi-node processors

 arch/x86/include/asm/processor.h |    2 ++
 arch/x86/include/asm/smp.h       |    6 ++++++
 arch/x86/include/asm/topology.h  |    2 ++
 arch/x86/kernel/cpu/common.c     |    2 ++
 arch/x86/kernel/cpu/proc.c       |    1 +
 arch/x86/kernel/smpboot.c        |   20 ++++++++++++++++----
 6 files changed, 29 insertions(+), 4 deletions(-)

has absolutely _ZERO_ place in the EDAC tree. It was submitted to 
the x86 tree and was under discussion - i requested changes to it so 
this current form has my NAK.

Please remove it from your tree and generally require your 
contributors to submit all arch/x86 patches to the x86 maintainers.

Thanks,

	Ingo
