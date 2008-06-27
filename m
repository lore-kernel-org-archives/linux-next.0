From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Fri, 27 Jun 2008 09:17:01 +0200
Message-ID: <20080627071701.GC28206@elte.hu>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au> <20080625071508.GA20454@elte.hu> <20080626015918.71a6b4d7.sfr@canb.auug.org.au> <20080625162923.GB6040@elte.hu> <alpine.LFD.1.10.0806251516460.3014@localhost.localdomain> <20080625195754.GA21689@elte.hu> <alpine.LFD.1.10.0806261838560.2988@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37231 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750928AbYF0HRU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 03:17:20 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0806261838560.2988@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>


* Len Brown <lenb@kernel.org> wrote:

> 
> 
> > I was thinking about these:
> > 
> >  acpi-acpi_numa_init-build-fix
> >  ia64, acpi: fix Altix boot breakage in ACPI
> >  acpi: fix boot breakage on Altix
> > 
> > note that this build failure does _not_ occur with current mainline, so 
> > it's a linux-next issue.
> > 
> > i've prepared a tip/acpi-for-len branch for you so that you can have a 
> > look at these, you can pull them from:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git acpi-for-len
> 
> I can see these on the web, but i've got no idea how to traverse your 
> tip tree by actually pulling it.  It seems to be a maze of branches, 
> and it isn't clear how to find the one i want.

the thing you want to look at this is to use the URI above:

   git-pull git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git acpi-for-len

it's based on -git, so it pulls in no other unrelated changes.

> are the 2nd and 3rd patches in response to the 1st patch? is the 1st 
> patch fixing something that happens in real life, or a random build 
> failuire that only a computer can find?

the build failure happens on allyesconfig as well. (but obviously we 
want to fix 'random' failures just as much - even if most users would be 
unlikely to find a particular config combination - to make the kernel 
more testable.)

	Ingo
