From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 11:26:26 +0200
Message-ID: <20080627092626.GA496@elte.hu>
References: <20080627161347.0af905fb.sfr@canb.auug.org.au> <20080627083053.GC6562@elte.hu> <20080627084758.GR20851@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42543 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751811AbYF0J0t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 05:26:49 -0400
Content-Disposition: inline
In-Reply-To: <20080627084758.GR20851@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>


* Jens Axboe <jens.axboe@oracle.com> wrote:

> > That way we could pull it into tip/x86 and give it some testing on 
> > the x86 side, and resolve its integration effects. Would that be 
> > possible?
> 
> Currently I have two branches for this - one is generic-ipi, which 
> contains the generic bits and all the arch conversions. The other is 
> smp_call_function, which kills the unused argument to 
> smp_call_function() (and friends) and on_each_cpu(). If I separate out 
> the non-x86 archs, I'll have trouble getting it all in for 2.6.27 as 
> I'll be on vacation as of july 5th.
> 
> So it's not tied in with any block bits, but it does have all archs. 
> Even if it's a bit of a weird thing to put the whole thing into the 
> x86 tree, I don't mind if we do that. Heck, it's in the block repo to 
> begin with :-)

i'll put this into tip/generic-ipi and wont put into the x86 topics 
towards linux-next - i just want to see the effects in practice.

This is the 102th -tip topic, there's space for all :-)

> So if you could pull:
> 
> git://git.kernel.dk/linux-2.6-block.git generic-ipi
> 
> and
> 
> git://git.kernel.dk/linux-2.6-block.git smp_call_function
> 
> and merge them with the x86 changes, that would be fine. It's also the 
> place where we currently have conflicts due to 32-bit and 64-bit stuff 
> being merged, so it would help Stephen as well.

i have an even better, brilliant plan :-)

what we could do is that we could offer an auto-generic-ipi-next 
integration branch that to Stephen that is tip/auto-x86-next plus 
tip/generic-ipi.

in fact i've just implemented this. You can pull the resulting 
tip/auto-generic-ipi-next tree from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git auto-generic-ipi-next

[ note: just first raw merge and conflict resolution, not tested yet. ]

note that it embedds your tree in a Git way and we can update the 
tip/generic-ipi branch in an append-only manner and it can go towards 
Linus in whatever way you prefer. (as long as you do not rebase the 
tree)

If you agree with this setup then this tree could be put after all these 
-next branches:

  auto-core-next
  auto-cpus4096-next
  auto-ftrace-next
  auto-genirq-next
  auto-safe-poison-pointers-next
  auto-sched-next
  auto-stackprotector-next
  auto-test
  auto-test-fixes
  auto-timers-next
  auto-x86-next

and then it will merge without conflicts. It's auto-updated to all these 
branches - i.e. when these branches are iterated then 
auto-generic-ipi-next will be iterated as well.

how does this sound to you? Nothing changes to your work flow (just keep 
those branches updated and let me know when i should pull from them), 
but conflicts are auto-eliminated from Stephen's flow and the conflict 
resolution workload and burden is put on those who generate them (the 
x86 folks and you).

	Ingo
