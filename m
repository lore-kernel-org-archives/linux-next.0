From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Sat, 24 Dec 2016 12:46:56 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1612241246210.3702@nanos>
References: <20161223114513.101402e4@canb.auug.org.au> <1482454594.2415.72.camel@HansenPartnership.com> <20161224123853.08284e8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:36397 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750979AbcLXLt6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Dec 2016 06:49:58 -0500
In-Reply-To: <20161224123853.08284e8a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@kernel.org>, James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Manish Rangankar <manish.rangankar@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <nilesh.javali@cavium.com>, Adheer Chandravanshi <adheer.chandravanshi@qlogic.com>, Chad Dupuis <chad.dupuis@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>

On Sat, 24 Dec 2016, Stephen Rothwell wrote:
> On Thu, 22 Dec 2016 16:56:34 -0800 James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> >
> > On Fri, 2016-12-23 at 11:45 +1100, Stephen Rothwell wrote:
> > > Hi James,
> > > 
> > > After merging the scsi tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/scsi/qedi/qedi_main.c: In function 'qedi_init':
> > > drivers/scsi/qedi/qedi_main.c:2073:2: error: implicit declaration of
> > > function 'register_hotcpu_notifier' [-Werror=implicit-function
> > > -declaration]
> > >   register_hotcpu_notifier(&qedi_cpu_notifier);
> > >   ^
> > > drivers/scsi/qedi/qedi_main.c: In function 'qedi_cleanup':
> > > drivers/scsi/qedi/qedi_main.c:2113:2: error: implicit declaration of
> > > function 'unregister_hotcpu_notifier' [-Werror=implicit-function
> > > -declaration]
> > >   unregister_hotcpu_notifier(&qedi_cpu_notifier);
> > >   ^
> > > 
> > > Caused by commit
> > > 
> > >   ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver
> > > framework.")
> > > 
> > > Interacting with commit
> > > 
> > >   8e38db753d95 ("cpu/hotplug: Remove obsolete cpu hotplug
> > > register/unregister functions")
> > > 
> > > from the tip tree.  
> > 
> > Well, that's a bit of a problem given that the SCSI tree has a pending
> > pull request including this driver.
> > 
> > Thomas, can you do another fixup in your tip tree like you did for the
> > two BNX2* drivers?
> 
> OK, so this is now a problem for the tip tree merge since James tree
> has been pulled by Linus.

Sure, because SSCI people merge broken crap and I can wipe up the mess they
create.

Dammit, SCSI folks knew for a long time that the old interface goes away,
but just waving crap through and let other people deal with the outcome is
way simpler.

And of course that hotplug code in this new driver is broken as hell. It
leaks notifiers in cases of errors and is racy against cpu hotplug. The
proper thing would be to mark this trainwreck broken and be done with it.

I'm seriously pissed off as I now have to rebase my stuff and cleanup that
sad affair in order to not break bisects completely.

Yours grumpy,

	tglx

.
