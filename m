From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 13:31:51 +0100
Message-ID: <20111219133151.4d14af80@de.ibm.com>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
	<20111219080813.GB30432@elte.hu>
	<20111219101134.3c2c0db5@de.ibm.com>
	<20111219103513.GA17928@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp18.uk.ibm.com ([195.75.94.114]:57168 "EHLO
	e06smtp18.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866Ab1LSMcM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Dec 2011 07:32:12 -0500
Received: from /spool/local
	by e06smtp18.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
	Mon, 19 Dec 2011 12:32:11 -0000
In-Reply-To: <20111219103513.GA17928@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>

On Mon, 19 Dec 2011 11:35:13 +0100
Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:
> 
> > On Mon, 19 Dec 2011 09:08:13 +0100
> > Ingo Molnar <mingo@elte.hu> wrote:
> > 
> > > 
> > > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the tip tree got a conflict in
> > > > fs/proc/uptime.c between commit c3e0ef9a298e ("[S390] fix cputime
> > > > overflow in uptime_proc_show") from the cputime tree and commit
> > > > 3292beb340c7 ("sched/accounting: Change cpustat fields to an array") from
> > > > the tip tree.
> > > > 
> > > > I fixed it up (I think - see below) and can carry the fix as necessary.
> > > > 
> > > > Generally, you guys seem to be working a little at cross purposes ...
> > > 
> > > Agreed.
> > > 
> > > Martin, could you please send Peter and me a pull request of the 
> > > current cputime bits merged on top of tip:sched/core? Those bits 
> > > should go upstream via the scheduler tree.
> > > 
> > 
> > All of it including "[S390] cputime: add sparse checking and 
> > cleanup" or just the fix for uptime ?
> 
> I suspect we can take it all if it's all scheduling/time 
> related, and add new patches to sched/core to keep it all 
> concentrated in a single tree?

Ok, will do. Just one question: are you sure that you want the cpustat array
to be u64 instead of cputime64_t? The content of the cpustat array is defined
by the architecture semantics of cputime64_t, for CONFIG_VIRT_CPU_ACCOUNTING=y
this is not a jiffy counter. If the array is u64 we won't get the sparse
checking when reading from cpustat.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
