From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build failure
Date: Tue, 17 Jun 2008 07:58:16 +0200
Message-ID: <20080617055816.GA13556@elte.hu>
References: <20080617134615.d70be9f6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:49411 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751594AbYFQF6d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 01:58:33 -0400
Content-Disposition: inline
In-Reply-To: <20080617134615.d70be9f6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) after merging the x86 tree
> failed like this:
> 
> In file included from arch/x86/kernel/setup_64.c:34:
> include/linux/acpi.h:97:1: warning: "NR_NODE_MEMBLKS" redefined
> In file included from include/acpi/platform/aclinux.h:59,
>                  from include/acpi/platform/acenv.h:140,
>                  from include/acpi/acpi.h:54,
>                  from include/linux/acpi.h:39,
>                  from arch/x86/kernel/setup_64.c:34:
> include2/asm/acpi.h:165:1: warning: this is the location of the previous definition
> 
> NR_NODE_MEMBLKS is defined in linux/acpi.h if CONFIG_HAVE_ARCH_PARSE_SRAT
> is defined and in asm-x86/acpi.h if CONFIG_ACPI_NUMA and CONFIG_X86_64
> are defined ...

that's not really the x86 tree's fault, i've been carrying the fix for 
that problem in tip/out-of-tree for 1.5 months:

| commit d94325315f241f86bd07a2ce113cbf28dc98de72
| Author: Ingo Molnar <mingo@elte.hu>
| Date:   Thu May 1 09:51:47 2008 +0000
|
|     acpi-acpi_numa_init-build-fix
|
|     x86.git testing found the following build error on latest -git:
|
|     drivers/acpi/numa.c: In function 'acpi_numa_init':
|     drivers/acpi/numa.c:226: error: 'NR_NODE_MEMBLKS' undeclared (first use in
|     drivers/acpi/numa.c:226: error: (Each undeclared identifier is reported onl
|     drivers/acpi/numa.c:226: error: for each function it appears in.)

> Lots of the above, as well as:
> 
> arch/x86/mm/srat_64.c:101: error: syntax error before 'do'
> arch/x86/mm/srat_64.c:108: error: syntax error before 'do'
> arch/x86/mm/srat_64.c:113: error: syntax error before 'if'
> 
> and it went down hill from here ...
> 
> srat_64.c is built if CONFIG_X86_32 is *not* 'y' and CONFIG_ACPI_NUMA is
> 'y' while in include/linux/acpi.h, acpi_numa_slit_init,
> acpi_numa_processor_affinity_init, acpi_numa_memory_affinity_init and
> acpi_numa_arch_fixup are all macros if CONFIG_HAVE_ARCH_PARSE_SRAT is
> defined.
> 
> So we have CONFIG_X86_64, CONFIG_ACPI_NUMA and
> CONFIG_HAVE_ARCH_PARSE_SRAT all defined.
> 
> I have no idea how (or time) to fix this, so the x86 tree is dropped for
> today.  [...]

hm, i guess you mean you went back to the previous version?

> [...] If you guys are going to auto generate a tree for me each day, 
> then you need to test build it a bit, please.

i _did_ test it prior pushing it out and it passed 30 build+boot 
iterations until it ran into that tip/out-of-tree fix. I decided not to 
add it to auto-x86-next because it does not belong into the x86 tree.

you could also revert:

| commit 6ca7b49a8d6ca765426540c8902d89f1345b14af
| Author: Yinghai Lu <yhlu.kernel@gmail.com>
| Date:   Fri Jun 6 19:54:25 2008 -0700
|
|    x86: add SRAT parsing to 64-bit

which makes that acpi build bug not trigger in allmodconfig. But this 
just obscures the bug.

	Ingo
