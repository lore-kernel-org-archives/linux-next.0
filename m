From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Sat, 24 Dec 2016 11:15:08 +0100
Message-ID: <20161224101508.GA12123@gmail.com>
References: <20161223114513.101402e4@canb.auug.org.au>
 <1482454594.2415.72.camel@HansenPartnership.com>
 <20161224123853.08284e8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33738 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751152AbcLXKPN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Dec 2016 05:15:13 -0500
Content-Disposition: inline
In-Reply-To: <20161224123853.08284e8a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manish Rangankar <manish.rangankar@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <nilesh.javali@cavium.com>, Adheer Chandravanshi <adheer.chandravanshi@qlogic.com>, Chad Dupuis <chad.dupuis@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi All,
> 
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

Yeah, we'll handle it - that's why the final chunk of changes were left to after 
-rc1, to not cause such merge conflicts upstream.

For now I've excluded the relevant -tip side commits from the linux-next branch.

Thanks,

	Ingo
