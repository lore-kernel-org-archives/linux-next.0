From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Wed, 25 Jun 2008 15:18:40 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0806251516460.3014@localhost.localdomain>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au>
 <20080625071508.GA20454@elte.hu>
 <20080626015918.71a6b4d7.sfr@canb.auug.org.au> <20080625162923.GB6040@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms042pub.verizon.net ([206.46.252.42]:53470 "EHLO
	vms042pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752034AbYFYTTZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jun 2008 15:19:25 -0400
Received: from localhost.localdomain ([72.93.254.151])
 by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01 (built Apr
 3 2006)) with ESMTPA id <0K3100BSP9N7Q441@vms042.mailsrvcs.net> for
 linux-next@vger.kernel.org; Wed, 25 Jun 2008 14:18:44 -0500 (CDT)
In-reply-to: <20080625162923.GB6040@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>



On Wed, 25 Jun 2008, Ingo Molnar wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Wed, 25 Jun 2008 09:15:08 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > >
> > > I suspect we cannot really eliminate this particular conflict 
> > > because the latter change is a (much welcome!) infrastructure 
> > > cleanup in all things ACPI, the former is an early init 
> > > refactoring/cleanup that depends on a whole lot of other (non-ACPI) 
> > > changes in tip/x86/*. It's too late in .26-rc cycle to push the 
> > > infrastructure cleanup upstream, so i suspect we have to live with 
> > > this conflict for a while.
> > 
> > No problem.  How long can it be until all this is merged in Linus' 
> > tree anyway? :-)
> 
> if Len acks these patches i can do a by-line mini-topic with just these 
> commits and put them into tip/auto-x86-next. It's Len's call though :-)

Ingo,
can you point me tot he patches you'd like me to review/ack?

I don't understand how you propose to void a linux-next merge conflict --
unless you're going to cherry-pick the ACPICA changes into your tree?

thanks,
-Len
