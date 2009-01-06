From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 14:19:08 +0100
Message-ID: <20090106131908.GB15228@elte.hu>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au> <20090105124745.GC29758@elte.hu> <200901061921.49131.rusty@rustcorp.com.au> <496358F8.30308@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52236 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751853AbZAFNTi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 08:19:38 -0500
Content-Disposition: inline
In-Reply-To: <496358F8.30308@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Mike Travis <travis@sgi.com> wrote:

> Rusty Russell wrote:
> > On Monday 05 January 2009 23:17:45 Ingo Molnar wrote:
> >> That would allow Mike, Christoph and you to work this out cleanly from 
> >> scratch. It would also solve your merge conflict.
> >>
> >> Does that sound like a good solution?
> > 
> > Sure, but it won't make this window.  I guess since those patches 
> > don't do anything but lay groundwork it's not critical, but annoying 
> > they've lain fallow so long.
> > 
> > I'm happy to put them with the cpualloc patches, since they're related 
> > and going to conflict, but I still want to see if Mike has the rest of 
> > them?
> 
> I do.  And really, as soon as the cpus4096 is safely set for 2.6.29 I 
> can devote much more time on it.

I think the complete elimination of cpumask_t should be the primary 
priority - before jumping to any other aspect. If we dont get rid of it it 
will stick around forever, like the BKL. It was a nice migration helper 
but now it's time to wave goodbye? :)

	Ingo
