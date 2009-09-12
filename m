From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Warning from ring buffer code (Was: Re: linux-next: tip tree
	build warning)
Date: Sat, 12 Sep 2009 09:39:06 +0200
Message-ID: <20090912073906.GA3972@elte.hu>
References: <20090804161640.70817ee6.sfr@canb.auug.org.au> <1249403089.4634.139.camel@localhost.localdomain> <20090912165300.9d257283.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54659 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751122AbZILHjb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 12 Sep 2009 03:39:31 -0400
Content-Disposition: inline
In-Reply-To: <20090912165300.9d257283.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <srostedt@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Steve,
> 
> On Tue, 04 Aug 2009 12:24:49 -0400 Steven Rostedt <srostedt@redhat.com> wrote:
> >
> > On Tue, 2009-08-04 at 16:16 +1000, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next build (powerpc ppc64_defconfig) produced these warnings:
> > > 
> > > kernel/trace/ring_buffer.c: In function 'rb_head_page_set':
> > > kernel/trace/ring_buffer.c:704: warning: initialization makes pointer from integer without a cast
> > > kernel/trace/ring_buffer.c:704: warning: initialization makes pointer from integer without a cast
> > > kernel/trace/ring_buffer.c: In function 'rb_head_page_replace':
> > > kernel/trace/ring_buffer.c:797: warning: initialization makes integer from pointer without a cast
> > > 
> > > Introduced by commit 77ae365eca895061c8bf2b2e3ae1d9ea62869739
> > > ("ring-buffer: make lockless").
> > 
> > Thanks, I'll take a look at it.
> 
> Now that this is in Linus' tree, can we have a fix for the waning, 
> please?

The first warning got fixed 1.5 months ago - the second one at line 
797 is still there but harmless - you can ignore it for now, it will 
be fixed.

	Ingo
