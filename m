From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 11:35:13 +0100
Message-ID: <20111219103513.GA17928@elte.hu>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
 <20111219080813.GB30432@elte.hu>
 <20111219101134.3c2c0db5@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111219101134.3c2c0db5@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>
List-Id: linux-next.vger.kernel.org


* Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:

> On Mon, 19 Dec 2011 09:08:13 +0100
> Ingo Molnar <mingo@elte.hu> wrote:
> 
> > 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi all,
> > > 
> > > Today's linux-next merge of the tip tree got a conflict in
> > > fs/proc/uptime.c between commit c3e0ef9a298e ("[S390] fix cputime
> > > overflow in uptime_proc_show") from the cputime tree and commit
> > > 3292beb340c7 ("sched/accounting: Change cpustat fields to an array") from
> > > the tip tree.
> > > 
> > > I fixed it up (I think - see below) and can carry the fix as necessary.
> > > 
> > > Generally, you guys seem to be working a little at cross purposes ...
> > 
> > Agreed.
> > 
> > Martin, could you please send Peter and me a pull request of the 
> > current cputime bits merged on top of tip:sched/core? Those bits 
> > should go upstream via the scheduler tree.
> > 
> 
> All of it including "[S390] cputime: add sparse checking and 
> cleanup" or just the fix for uptime ?

I suspect we can take it all if it's all scheduling/time 
related, and add new patches to sched/core to keep it all 
concentrated in a single tree?

Thanks,

	Ingo
