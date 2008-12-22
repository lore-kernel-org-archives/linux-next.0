From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: scsi tree build failure
Date: Sun, 21 Dec 2008 19:59:25 -0600
Message-ID: <1229911165.25634.0.camel@localhost.localdomain>
References: <20081216013704.2496da40.sfr@canb.auug.org.au>
	 <1229352762.3293.1.camel@localhost.localdomain>
	 <20081217232049.67b72448.sfr@canb.auug.org.au>
	 <20081221143024.ed97091c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:50032 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753295AbYLVB73 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 20:59:29 -0500
In-Reply-To: <20081221143024.ed97091c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Robert Love <robert.w.love@intel.com>

On Sun, 2008-12-21 at 14:30 +1100, Stephen Rothwell wrote:
> Hi James, Robert,
> 
> On Wed, 17 Dec 2008 23:20:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 15 Dec 2008 08:52:42 -0600 James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > >
> > > On Tue, 2008-12-16 at 01:37 +1100, Stephen Rothwell wrote:
> > > > 
> > > > Today's linux-next build (powerpc allyesconfig) failed like this:
> > > 
> > > Heh, I really need to get this terrasoft system integrated into my
> > > builds
> > > 
> > > > drivers/scsi/libfc/fc_fcp.c: In function 'fc_eh_host_reset':
> > > > drivers/scsi/libfc/fc_fcp.c:1987: error: implicit declaration of function 'msleep'
> > > > 
> > > > That file needs to include <linux/delay.h>.
> > > 
> > > Thanks, that's exactly the problem.
> > > 
> > > Robert, please reroll the patches with this fix in ... I'll just
> > > exchange the new patches for the ones in my tree.
> > > 
> > > > Introduced by commit 389571f347629d879f9044582bbbafb43e4fe00b ("[SCSI]
> > > > libfc: A modular Fibre Channel library") from the scsi tree.  I reverted
> > > > that commit and commit 7aba33c5cfc7a9c104cc7469558c7849f373c3da ("[SCSI]
> > > > fcoe: Fibre Channel over Ethernet") which depended on it.
> > 
> > I have dropped the scsi tree until this is fixed up.
> 
> I still haven't see a fix for this ...

OK, gave up waiting for an updated patch, so I fixed this myself in my
tree.  scsi-misc should be safe to go again.

Thanks,

James
