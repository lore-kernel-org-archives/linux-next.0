From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure
Date: Tue, 29 Jul 2008 13:40:29 +0200
Message-ID: <20080729114029.GA3836@elte.hu>
References: <20080729180317.94c64634.sfr@canb.auug.org.au> <20080729085815.GA1301@elte.hu> <20080729202731.F18F.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:48208 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755385AbYG2Lky (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 07:40:54 -0400
Content-Disposition: inline
In-Reply-To: <20080729202731.F18F.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Mike Travis <travis@sgi.com>


* KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:

> > 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi Ingo,
> > > 
> > > On Tue, 29 Jul 2008 10:00:55 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > > >
> > > > > -#define cpumask_of_cpu(cpu) ({ *get_cpu_mask(cpu); })
> > > > > +#define cpumask_of_cpu(cpu) (*get_cpu_mask(cpu))
> > > > 
> > > > hm, i'm wondering - is this a compiler bug?
> > > 
> > > Or maybe a deficiency in such an old compiler (v3.4.5) but the fix 
> > > makes sense anyway, right?
> > 
> > yeah, i was just wondering.
> 
> in linux/README
> 
> COMPILING the kernel:
> 
>  - Make sure you have at least gcc 3.2 available.
>    For more information, refer to Documentation/Changes.
> 
> So, if 3.4.5 is old, Should we change readme?

the fix is simple enough.

but the question is, wont it generate huge artificial stackframes with 
CONFIG_MAXSMP and NR_CPUS=4096? Maybe it is unable to figure out and 
simplify the arithmetics there - or something like that.

	Ingo
