From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 19
Date: Mon, 29 Jun 2009 09:14:51 +0200
Message-ID: <20090629071451.GA20225@elte.hu>
References: <20090619172622.05adb236.sfr@canb.auug.org.au> <alpine.LFD.2.00.0906200012200.4325@localhost.localdomain> <20090620150433.4e038676.sfr@canb.auug.org.au> <alpine.LFD.2.00.0906201415400.4083@localhost.localdomain> <20090622015427.c749a0d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39489 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751611AbZF2HPL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 03:15:11 -0400
Content-Disposition: inline
In-Reply-To: <20090622015427.c749a0d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfi-devel@simplefirmware.org, x86@kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > > Basically, this should be just what you would send to Linus 
> > > (or ask him to fetch).  It is allowed to be rebased if you 
> > > deem it necessary.
> > 
> > The patches are tested on the pre-release platform that makes 
> > use of them.  There have been several internal reviews and 
> > re-writes, but since we just got permission to release the 
> > patches last week, they've not been publically vetted yet.
> > 
> > The content is quite close to what I plan to propose for 
> > upstream, but the format is not.  I'll be re-factoring the 
> > series into "clean history" and senting them to LKML on Sunday 
> > night.
> > 
> > I don't expect much comment on the generic part, but will want 
> > x86 maintainers to buy into the parts that touch their 
> > architecture.
> 
> OK, then I think I need to hear from the x86 maintainers, at 
> least, before we include this.

Yep, feel free, the SFI bits looked good in principle.

	Ingo
