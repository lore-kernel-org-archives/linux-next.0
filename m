From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the arm tree
Date: Fri, 13 May 2011 10:47:40 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1105131047200.2866@ionos>
References: <20110513131437.8999e8eb.sfr@canb.auug.org.au> <20110513080634.GA13647@elte.hu> <20110513083738.GA19733@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110513083738.GA19733@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Jacob Pan <jacob.jun.pan@intel.com>, Glauber Costa <glommer@redhat.com>, Dimitri Sivanich <sivanich@sgi.com>, Rusty Russell <rusty@rustcorp.com.au>, Jeremy Fitzhardinge <jeremy@xensource.com>, Chris McDermott <lcm@us.ibm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: linux-next.vger.kernel.org

On Fri, 13 May 2011, Russell King - ARM Linux wrote:

> On Fri, May 13, 2011 at 10:06:34AM +0200, Ingo Molnar wrote:
> > 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi all,
> > > 
> > > Today's linux-next merge of the tip tree got a conflict in 
> > > arch/x86/kernel/i8253.c between commit 3490f584b9ba ("clocksource: convert 
> > > x86 to generic i8253 clocksource") from the arm tree and commit b01cc1b0eae0 
> > > ("x86: Convert remaining x86 clocksources to clocksource_register_hz/khz") 
> > > from the tip tree.
> > > 
> > > The former seems to supercede the latter, so I used the former.
> > 
> > Russell, how the heck did this commit:
> > 
> >  commit 3490f584b9ba5a0b6f63832fbc9c5ec72506697b
> >  Author:     Russell King <rmk+kernel@arm.linux.org.uk>
> >  AuthorDate: Sun May 8 18:55:19 2011 +0100
> >  Commit:     Russell King <rmk+kernel@arm.linux.org.uk>
> >  CommitDate: Tue May 10 08:20:54 2011 +0100
> > 
> >     clocksource: convert x86 to generic i8253 clocksource
> > 
> > which has such a clearly x86 diffstat:
> > 
> >  arch/x86/Kconfig             |    1 +
> >  arch/x86/include/asm/i8253.h |    2 +
> >  arch/x86/kernel/i8253.c      |   79 +-----------------------------------------
> >  3 files changed, 4 insertions(+), 78 deletions(-)
> > 
> > end up in the ARM tree without an ack from an x86 maintainer??

Acked-by-me!
 
> The "no response" means two things: either that people are busy, or people
> don't care about the patch.  There is a patch from David Martin modifying
> linux/elf.h adding one line to it which has not had any response.  Should
> we assume the silence means that people are busy?  If we did that, nothing
> would ever happen.
> 
> > I see the commit has an ack from John but that feedback is not visible in the 
> > lkml thread of this patch nor did John really realize the conflict nor the 
> 
> I have no idea why John's ack is not visible, especially as it was sent
> to lkml _and_ explicitly copied to you.
> 
> > build breakage. The patch was still in the to-be-reviewed queue of our patches.
> > 
> > Nor was it tested properly. The patch looks sane but your workflow sucks.
> > Please revert it and use a proper Git workflow to change arch/x86/ details ...
> 
> I don't think so.  I created a patch.  I posted it to relevant people.
> I got an ack.  So I put it into linux-next for further testing rather
> than having it sitting around here getting zero testing.
> 
> That's the _proper_ thing to do.  linux-next found some problems, so
> let's sort them out - great, that's what linux-next is there for.  Let's
> sort them out instead of assigning blame.
> 
> And hey, it found a problem, and the problem has now been fixed.  Which
> is great, and that should be visible to linux-next soon.
> 
> As for merge conflicts, they happen.  They get sorted.  It's no big deal.
> Again, that's what linux-next is there to find and allow people to
> _discuss_ how to resolve them.  It's not about avoiding all conflicts
> no matter what or blaming people when conflicts happen.
> 
> Lastly, I have absolutely no problem about pulling the x86 bits out of
> this series if they cause a conflict or don't get an ack.  I operate a
> flexible approach to my git tree for stuff like this which allows stuff
> to be dropped or updated as necessary.
> 
