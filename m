From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Tue, 4 Aug 2009 15:50:29 +0200
Message-ID: <20090804135029.GA6775@elte.hu>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au> <4A718338.6050907@in.ibm.com> <20090730135623.GB16659@aftab> <20090803093144.GC9074@elte.hu> <20090803101401.GA14442@aftab> <20090803120739.GA29156@elte.hu> <20090803125059.GB14442@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45127 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752454AbZHDNus (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Aug 2009 09:50:48 -0400
Content-Disposition: inline
In-Reply-To: <20090803125059.GB14442@aftab>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>


* Borislav Petkov <borislav.petkov@amd.com> wrote:

> Hi Ingo,
> 
> On Mon, Aug 03, 2009 at 02:07:39PM +0200, Ingo Molnar wrote:
> > The thing that was blocking this commit is really the insufficient 
> > sched-domains integration of said NUMA bits. I think the NUMA bits 
> > look good and if the EDAC tree makes use of it we can merge it in 
> > .32.
> >
> > Mind preparing a separate branch for it (.31-rc5 based) and send me 
> > a pull request so that we can share the commit between the EDAC tree 
> > and the x86 tree?
> 
> Well, Andreas says the patches need a little polishing and he'll 
> be sending updated versions soon so you can pick them up. And 
> since the EDAC MCE stuff might still change before .32 merge 
> window opens, let's synchronize our pull requests instead. In the 
> meantime, I'll be rediffing the EDAC stuff against -tip for 
> linux-next.

Would you rebase just due to this commit? No need for that, feel 
free to carry it until Andreas sends an updated version. Then i can 
put it into a separate .31-rc5 based topic that you can pull into 
the EDAC tree.

That way there are no rebases really and no dependencies.

	Ingo
