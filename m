From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: linux-next: build failure
Date: Tue, 29 Jul 2008 20:28:24 +0900
Message-ID: <20080729202731.F18F.KOSAKI.MOTOHIRO@jp.fujitsu.com>
References: <20080729180317.94c64634.sfr@canb.auug.org.au> <20080729085815.GA1301@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:47194 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754305AbYG2L3n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Jul 2008 07:29:43 -0400
In-Reply-To: <20080729085815.GA1301@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: kosaki.motohiro@jp.fujitsu.com, Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Mike Travis <travis@sgi.com>

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Ingo,
> > 
> > On Tue, 29 Jul 2008 10:00:55 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > >
> > > > -#define cpumask_of_cpu(cpu) ({ *get_cpu_mask(cpu); })
> > > > +#define cpumask_of_cpu(cpu) (*get_cpu_mask(cpu))
> > > 
> > > hm, i'm wondering - is this a compiler bug?
> > 
> > Or maybe a deficiency in such an old compiler (v3.4.5) but the fix 
> > makes sense anyway, right?
> 
> yeah, i was just wondering.

in linux/README

COMPILING the kernel:

 - Make sure you have at least gcc 3.2 available.
   For more information, refer to Documentation/Changes.



So, if 3.4.5 is old, Should we change readme?
