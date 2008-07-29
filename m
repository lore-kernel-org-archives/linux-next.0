From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure
Date: Tue, 29 Jul 2008 10:58:15 +0200
Message-ID: <20080729085815.GA1301@elte.hu>
References: <20080729162300.733b3e09.sfr@canb.auug.org.au> <20080729080055.GA28916@elte.hu> <20080729180317.94c64634.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756364AbYG2I6w@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080729180317.94c64634.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Mike Travis <travis@sgi.com>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Tue, 29 Jul 2008 10:00:55 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > > -#define cpumask_of_cpu(cpu) ({ *get_cpu_mask(cpu); })
> > > +#define cpumask_of_cpu(cpu) (*get_cpu_mask(cpu))
> > 
> > hm, i'm wondering - is this a compiler bug?
> 
> Or maybe a deficiency in such an old compiler (v3.4.5) but the fix 
> makes sense anyway, right?

yeah, i was just wondering.

	Ingo
