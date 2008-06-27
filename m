From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 13:21:57 +0200
Message-ID: <20080627112156.GB20851@kernel.dk>
References: <20080627161347.0af905fb.sfr@canb.auug.org.au> <20080627083053.GC6562@elte.hu> <20080627084758.GR20851@kernel.dk> <20080627092626.GA496@elte.hu> <20080627095737.GA22123@elte.hu> <20080627101138.GA4570@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:12275 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756648AbYF0LV7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 07:21:59 -0400
Content-Disposition: inline
In-Reply-To: <20080627101138.GA4570@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>

On Fri, Jun 27 2008, Ingo Molnar wrote:
> 
> > Jens, i've started testing this in -tip - there are three small build 
> > fixlets in the tip/generic-ipi branch so far.
> > 
> > If you dont have these fixes already then you can pull them from:
> > 
> >  git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git generic-ipi
> 
> this config is causing trouble too:
> 
>   http://redhat.com/~mingo/misc/config-Fri_Jun_27_12_03_13_CEST_2008.bad
> 
> it gives:
> 
>   include/asm-x86/mach-default/entry_arch.h: Assembler messages:
>   include/asm-x86/mach-default/entry_arch.h:16: Error: undefined symbol `CALL_FUNCTION_SINGLE_VECTOR' in operation
> 
> the irq vector definitions got moved around in include/asm-x86, it's 
> probably an integration effect of that. Stephen will likely see such 
> problems in linux-next too.
> 
> My suggestion would be: lets work on finishing the integration in 
> tip/auto-generic-ipi-next and then offer it to Stephen once that looks 
> good in testing?

Yep agreed, that's the best way forward.

-- 
Jens Axboe
