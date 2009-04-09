From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 9 Apr 2009 07:36:30 +0200
Message-ID: <20090409053630.GH5352@elte.hu>
References: <20090409151722.c8eabb56.sfr@canb.auug.org.au> <20090409052717.GF5352@elte.hu> <20090408.222845.176097923.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:32989 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752394AbZDIFgw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2009 01:36:52 -0400
Content-Disposition: inline
In-Reply-To: <20090408.222845.176097923.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org, dvhltc@us.ibm.com


* David Miller <davem@davemloft.net> wrote:

> From: Ingo Molnar <mingo@elte.hu>
> Date: Thu, 9 Apr 2009 07:27:17 +0200
> 
> > 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> >> Hi all,
> >> 
> >> Today's linux-next build (sparc64 defconfig) failed like this:
> >> 
> >> arch/sparc/kernel/built-in.o: In function `trap_init':
> >> (.init.text+0x4): undefined reference to `thread_info_offsets_are_bolixed_dave'
> >> 
> >> Caused by commit 52400ba946759af28442dee6265c5c0180ac7122 ("futex: add
> >> requeue_pi functionality") (from the tip-core tree) which changed the
> >> size of struct restart_block.
> >> 
> >> Dave, this might be a good time to suggest that sparc64 create its TI_
> >> offsets automatically via asm-offsets ...
> >> 
> >> I applied the following patch for today.
> > 
> > David, would it be appropriate for us to queue up Stephen's fix 
> > in the futex tree, so that any rewrite can be decoupled from 
> > these changes and the Sparc tree would still work as well?
> 
> Yes, but it's going to conflict with the dynamic per-cpu work I'm 
> doing in the sparc-next tree right now.

Would it be possible for you to reserve the extra futex related 
pointer right now? (or is that not possible without changing the 
restart block in linux/thread_info.h?)

Last i checked the futex changes looked pretty ready: queued up for 
.31, they were ABI-acked by Ulrich, Roland, etc. and were tested 
through - so there's no additional churn or reverts / disappearing 
commits expected. (Thomas please confirm that this is indeed so.)

That way then when Stephen resolves the conflict then the futex tree 
change is overriden with your changes in the Sparc tree.

That will make it all bisectable as well - should anyone ever have 
the need to bisect down into that set of commits.

	Ingo
