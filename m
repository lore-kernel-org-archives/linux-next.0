From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Wed, 26 Nov 2008 11:21:19 +0100
Message-ID: <20081126102119.GA28112@elte.hu>
References: <20081125102234.GA4281@elte.hu> <7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com> <20081125153345.GA20733@elte.hu> <7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com> <20081125165118.GF22504@elte.hu> <20081126140032.72d86f17.sfr@canb.auug.org.au> <20081126033318.GE8242@elte.hu> <7c86c4470811260032n64d69b04w5762e5f6cbd0cff9@mail.gmail.com> <20081126084604.GN26036@elte.hu> <20081126010022.63049908.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50935 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751751AbYKZKWE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 05:22:04 -0500
Content-Disposition: inline
In-Reply-To: <20081126010022.63049908.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: eranian@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 26 Nov 2008 09:46:04 +0100 Ingo Molnar <mingo@elte.hu> wrote:
> 
> > _Especially_ if 
> > then the linux-next integrator also plays stupid about basic kernel 
> > workflow questions ;-)
> 
> He didn't.  I suggested to Stephane and Stephen that we get this 
> stuff into linux-next for a shot at 2.6.29 and that the collective 
> 'we' make an extra effort to get perfmon over the hump and merged 
> up.

Did you think of Cc:-ing the affected maintainers, as a basic 
courtesy, and to make sure it's aligned up with their next merge 
window plans? Inform them to warn them about upcoming conflicts and 
other possible trouble you are causing in the code they are 
maintaining.

I'm sure you must have noticed the x86 impact from that patchset:

 arch/x86/Kconfig                               |    2 +
 arch/x86/Makefile                              |    3 +
 arch/x86/ia32/ia32entry.S                      |    5 +
 arch/x86/include/asm/Kbuild                    |    1 +
 arch/x86/include/asm/irq_vectors.h             |    5 +
 arch/x86/include/asm/mach-default/entry_arch.h |    4 +
 arch/x86/include/asm/perfmon.h                 |   34 ++
 arch/x86/include/asm/perfmon_kern.h            |  438 +++++++++++++++++
 arch/x86/include/asm/thread_info.h             |    8 +-
 arch/x86/include/asm/unistd_32.h               |    5 +
 arch/x86/include/asm/unistd_64.h               |   11 +-
 arch/x86/kernel/entry_32.S                     |    2 +-
 arch/x86/kernel/entry_64.S                     |    8 +-
 arch/x86/kernel/irqinit_64.c                   |    5 +
 arch/x86/kernel/process_32.c                   |   10 +
 arch/x86/kernel/process_64.c                   |   10 +
 arch/x86/kernel/signal_32.c                    |    5 +
 arch/x86/kernel/signal_64.c                    |    5 +
 arch/x86/kernel/syscall_table_32.S             |    5 +
 arch/x86/oprofile/nmi_int.c                    |   10 +-
 arch/x86/perfmon/Kconfig                       |   33 ++
 arch/x86/perfmon/Makefile                      |    7 +
 arch/x86/perfmon/perfmon.c                     |  619 +++++++++++++++++++++++
 arch/x86/perfmon/perfmon_amd64.c               |  483 ++++++++++++++++++
 arch/x86/perfmon/perfmon_intel_arch.c          |  628 ++++++++++++++++++++++++
 25 files changed, 2340 insertions(+), 6 deletions(-)

There's a ton of RFC patches on lkml that affect x86, it's a naturally 
popular arch for various kernel features. Right now there's 4-5 RFC 
features on lkml that have an x86 impact. Should we NAK all of them as 
a precaution, just to be on the safe side against surprises?

> You missed that email, [...]

to put it into perspective, this is the single mail about this topic 
that you are referring to:

  http://lkml.org/lkml/2008/10/22/381

you wrote (well into the mail):

  | What it needs is a sustained effort to get it over the hump.  
  | How's about getting it into linux-next asap and then we all agree 
  | to do the re-re-re-review and runtime testing for a 2.6.29 merge?

That was deep inside an existing discussion, and posed as a question.

The rest is probably private mails between you and sfr, right? No Cc: 
to the affected x86 maintainers and without any syncing with the merge 
schedule of the affected maintainers. How do you expect us to have 
magically deducted what you've done after that point privately?

And what would it have costed you to actually ... ask our opinion? To 
make sure everyone is on the same page? Instead of doing this all 
privately and behind our backs in essence?

> [...] missed the presence of perfmon in linux-next and repeatedly 
> chose to not review the perfmon patch series when it went past.

So every patch that touches lkml and has not specifically been NAK-ed 
by maintainers can show up in linux-next tomorrow, overlapping 
existing and well-maintained subsystem trees? That's a rather new 
concept to me that goes straight again all current maintenance 
practices and i think it is an absurd notion. It does not and it 
cannot work like that.

Sometimes we maintainers volunteer and review an pick up larger 
patches from lkml without being asked to. (we dont actually _have_ to, 
but we try to - the influx of patches and the plans for the cycle 
_ALWAYS_ has to be synced up with affected maintainers)

Sometimes, especially if a difficult merge is upcoming, we wait for 
them to be actively submitted to us and prioritize features based on 
review and testing feedback. Especially if it's the 10th version of a 
rather complex patchset that seemed to be getting nowhere.

Also, i asked this from you before and have not gotten an answer to it 
yet: how am i supposed to follow what goes into linux-next, in an 
efficient manner?

linux-next is a huge tree with 4000+ ever changing commits, and it is 
not at all transparent in the Git space: a ton of commits get rebased 
on a daily basis (all the quilt queues). There's no history of for 
example the 'linux-next/master/Trees' file either that would show and 
explain when and why trees were added to (or removed from) linux-next.

So linux-next has no proper reviewable history - unless you expect us 
to standardize on doing nothing but parsing linux-next changelogs all 
day.

_You_ certainly know what goes into linux-next, simply because you are 
the one who gets Cc:-ed to everything that goes into it. So you are in 
a fundamentally assymetric position. But how can you then expect 
symmetric awareness from us?

On the other hand i can and i do monitor what goes into Linus's tree, 
because it's a proper append-only Git tree. I can see all the merge 
decisions and activities in a very straightforward manner. The same is 
not possible with linux-next.

	Ingo
