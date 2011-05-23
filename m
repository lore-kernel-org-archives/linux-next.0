From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] x86: apic_flat_64.c needs module.h
Date: Mon, 23 May 2011 21:10:43 +0200
Message-ID: <20110523191043.GB23629@elte.hu>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
 <20110523104300.dd532a99.randy.dunlap@oracle.com>
 <4DDA9EAB.40304@gmail.com>
 <4DDAA2C0.7080108@gmail.com>
 <4DDAA384.2000203@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42754 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932091Ab1EWTLF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 May 2011 15:11:05 -0400
Content-Disposition: inline
In-Reply-To: <4DDAA384.2000203@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Cyrill Gorcunov <gorcunov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Suresh Siddha <suresh.b.siddha@intel.com>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> >>>  arch/x86/kernel/apic/apic_flat_64.c |    1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> --- linux-next-20110523.orig/arch/x86/kernel/apic/apic_flat_64.c
> >>> +++ linux-next-20110523/arch/x86/kernel/apic/apic_flat_64.c
> >>> @@ -16,6 +16,7 @@
> >>>  #include <linux/ctype.h>
> >>>  #include <linux/init.h>
> >>>  #include <linux/hardirq.h>
> >>> +#include <linux/module.h>
> >>>  #include <asm/smp.h>
> >>>  #include <asm/apic.h>
> >>>  #include <asm/ipi.h>
> >>
> >> Thanks Randy! For some reason I didn't hit this problem while
> >> were compiling the kernel and testing it (I usually do not use
> >> modules though).
> >>
> >> I've CC'ed Ingo and Suresh.
> >>
> > 
> > Randy, while adding module.h here is correct I fail to see why I didn't
> > hit this problem before, could you please post your config?
> 
> Certainly, it's attached.  It's a randconfig file.
> I saw this build error on roughly 5 out of 15 randconfig builds.
> 
> CONFIG_SMP is disabled...

Your config builds just fine here, using latest -tip:

 tip/master 726281b: Merge branch 'tools/kvm'

 Kernel: arch/x86/boot/bzImage is ready  (#2)

or using x86/apic directly:

 tip/x86/apic 1a8880a: x86, apic: Make apic drivers static

 System is 3001 kB
 CRC 882c2d5c
 Kernel: arch/x86/boot/bzImage is ready  (#3)

Has linux-next changed something that triggers this build bug?

Thanks,

	Ingo
