From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: origin tree build failure
Date: Mon, 12 Jan 2009 11:44:02 +0100
Message-ID: <20090112104402.GD10405__13497.3968416036$1231757168$gmane$org@elte.hu>
References: <20090112104837.69feedec.sfr@canb.auug.org.au> <1231719015.22571.4.camel@pasglop> <20090112090552.GD26750@elte.hu> <1231753791.8959.7.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55790 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752182AbZALKod (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 05:44:33 -0500
Content-Disposition: inline
In-Reply-To: <1231753791.8959.7.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>, Mike Travis <travis@sgi.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>


* Michael Ellerman <michael@ellerman.id.au> wrote:

> On Mon, 2009-01-12 at 10:05 +0100, Ingo Molnar wrote:
> > * Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> > 
> > > On Mon, 2009-01-12 at 10:48 +1100, Stephen Rothwell wrote:
> > > > Hi Linus,
> > > > 
> > > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > > > 
> > > > arch/powerpc/platforms/pasemi/cpufreq.c: In function 'pas_cpufreq_cpu_init':
> > > > arch/powerpc/platforms/pasemi/cpufreq.c:216: error: incompatible types in assignment
> > > > arch/powerpc/platforms/powermac/cpufreq_64.c: In function 'g5_cpufreq_cpu_init':
> > > > arch/powerpc/platforms/powermac/cpufreq_64.c:365: error: incompatible types in assignment
> > > > arch/powerpc/platforms/cell/cbe_cpufreq.c: In function 'cbe_cpufreq_cpu_init':
> > > > arch/powerpc/platforms/cell/cbe_cpufreq.c:121: error: incompatible types in assignment
> > > > 
> > > > Caused by commit 835481d9bcd65720b473db6b38746a74a3964218 ("cpumask:
> > > > convert struct cpufreq_policy to cpumask_var_t") which missed updating
> > > > all the powerpc (at least) cpufreq drivers.
> > > 
> > > Yeah, it only updates x86 it seems ... 
> > 
> > Yeah - and that build bug was stupid too - when touching a generic file 
> > that is called include/linux/cpufreq.h and changing a key data field one 
> > should at minimum get the idea that it's generic for a reason and should 
> > start grepping the tree ...
> > 
> > It slipped through because it didnt get caught in build tests because 
> > cpufreq isnt enabled in the powerpc defconfig.
> 
> Which defconfig?
>
> powerpc(master) $ git grep CPU_FREQ=y arch/powerpc/configs/ppc64_defconfig
> arch/powerpc/configs/ppc64_defconfig:CONFIG_CPU_FREQ=y

ah, indeed - you are right.

	Ingo
