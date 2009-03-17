From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for March 16 (slob)
Date: Tue, 17 Mar 2009 10:29:02 +0100
Message-ID: <20090317092902.GA6477@elte.hu>
References: <20090316220609.6f4a884c.sfr@canb.auug.org.au> <49BE9B20.70808@oracle.com> <20090317111129.5bf04ae6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43924 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752873AbZCQJ32 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2009 05:29:28 -0400
Content-Disposition: inline
In-Reply-To: <20090317111129.5bf04ae6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Nick Piggin <npiggin@suse.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Mon, 16 Mar 2009 11:32:00 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >
> > mm/slob.c:480: error: 'flags' undeclared (first use in this function)
> > 
> > pseudo-patch:
> > 
> > s/flags/gfp/
> 
> Caused by commit cf40bd16fdad42c053040bcd3988f5fdedbb6c57 ("lockdep:
> annotate reclaim context (__GFP_NOFS)") from the tracing tree.
> 
> Now fixed in the tip tree.

Note this has been broken for a relatively long time and only 
got fixed when i noticed that randconfig was not as random as it 
was supposed to be. That's how it started triggering in 
linux-next too i suspect.

	Ingo
