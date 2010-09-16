From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Thu, 16 Sep 2010 08:39:22 +0200
Message-ID: <20100916063922.GA17596@elte.hu>
References: <20100914002932.850d02f3.sfr@canb.auug.org.au>
 <20100916163218.e09be473.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49581 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752361Ab0IPGjn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Sep 2010 02:39:43 -0400
Content-Disposition: inline
In-Reply-To: <20100916163218.e09be473.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@arm.linux.org.uk>, Yinghai Lu <yinghai@kernel.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Tue, 14 Sep 2010 00:29:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the final tree, today's linux-next build (arm
> > assabet_defconfig and serveral other arm configs) failed like this:
> > 
> > arch/arm/mm/init.c: In function 'arm_memory_present':
> > arch/arm/mm/init.c:260: warning: ISO C90 forbids mixed declarations and code
> > arch/arm/mm/init.c:338: error: invalid storage class for function 'free_area'
> > arch/arm/mm/init.c:357: error: invalid storage class for function 'free_memmap'
> > arch/arm/mm/init.c:386: error: invalid storage class for function 'free_unused_memmap'
> > arch/arm/mm/init.c:601: error: invalid storage class for function 'keepinitrd_setup'
> > arch/arm/mm/init.c:606: error: initializer element is not constant
> > arch/arm/mm/init.c:606: error: (near initialization for '__setup_keepinitrd_setup.setup_func')
> > arch/arm/mm/init.c:606: error: expected declaration or statement at end of input
> > arch/arm/mm/init.c:252: warning: unused variable 'i'
> > 
> > Caused by commit 719c1514f2fef5f01fcfa2bba81b7bb079c7c6a1 ("memblock/arm:
> > Use new accessors") which forgot a closing brace on a new
> > for_each_memblock() in arm_memory_present().
> 
> So this commit is back in tip and the error is back in the builds ...

The ARM defconfig build doesnt fail here:

  WARNING: modpost: Found 5 section mismatch(es).
  To see full details build your kernel with:
  'make CONFIG_DEBUG_SECTION_MISMATCH=y'

Is there some integration artifact here perhaps? If yes then linux-next 
needs to resolve the integration artifact. If not then benh, Yinghai, 
hpa, please have a look ...

Thanks,

	Ingo
