From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the xen-two tree with the tip tree
Date: Thu, 10 Feb 2011 13:24:23 +0100
Message-ID: <20110210122423.GC26094@elte.hu>
References: <20110210145528.95c90b63.sfr@au1.ibm.com>
 <alpine.LFD.2.00.1102101319440.31804@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1102101319440.31804@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@au1.ibm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> 
> 
> On Thu, 10 Feb 2011, Stephen Rothwell wrote:
> 
> > Hi Konrad,
> > 
> > Today's linux-next merge of the xen-two tree got a conflict in
> > kernel/irq/manage.c between commit
> > dc5f219e88294b93009eef946251251ffffb6d60 ("genirq: Add
> > IRQF_FORCE_RESUME") from the tip tree and commit
> > c6c5596743c2a333a8e31b0247f44cd367484a5e ("genirq: Add
> > IRQF_FORCE_RESUME") from the xen-two tree.
> > 
> > Despite having the same Author time stamps, these commits are not quite the
> > same.  I used the version from the tip tree which kept the line:
> > 
> > 		desc->status &= ~IRQ_SUSPENDED;
> 
> That's the correct one. I fear I messed up, when I gave xen folks the
> git url to pull from. I had the first version pushed out, and zapped
> right away when I noticed the missing line. Then fixed it and
> repushed. I should have checked git://..... which obviously had
> already picked up the borked one and did not pick up the correct one
> before xen folks pulled. Sorry about that.

The resolution would be for the Xen tree to pull again and pick the new commit's 
content as the conflict resolution result. That will resolve the linux-next conflict 
as well.

Thanks,

	Ingo
