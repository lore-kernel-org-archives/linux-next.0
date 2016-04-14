From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 14 Apr 2016 12:08:01 -0300
Message-ID: <20160414150801.GE2439@redhat.com>
References: <20160414121418.288bd117@canb.auug.org.au>
 <20160414123552.GD2439@redhat.com>
 <1460638547.21066.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35202 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754083AbcDNPIG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Apr 2016 11:08:06 -0400
Content-Disposition: inline
In-Reply-To: <1460638547.21066.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Thu, Apr 14, 2016 at 10:55:47PM +1000, Michael Ellerman escreveu:
> On Thu, 2016-04-14 at 09:35 -0300, Arnaldo Carvalho de Melo wrote:
> > Em Thu, Apr 14, 2016 at 12:14:18PM +1000, Stephen Rothwell escreveu:
> > > Hi all,
> > > 
> > > After merging the tip tree, today's linux-next build (powerpc64le perf)
> > > failed like this:
> > > 
> > > make[3]: *** No rule to make target '/home/sfr/next/perf/arch/x86/include/generated/asm/syscalls_64.c', needed by '/home/sfr/next/perf/util/syscalltbl.o'.  Stop.
> > > 
> > > (I build in /home/sfr/next/next with objects in /home/sfr/next/perf.)
> > 
> > I'll check, should've been caught by a cross compiler build for ppc64le
> > I have in place :-\
> > 
> > minimal-ubuntu-x-ppc64el: Ok
> > 
> > But maybe not, as this requires audit-libs-devel and that is not present
> > on that minimal ubuntu x-compiler setup, sigh :-\
> 
> Hi acme,
> 
> I have a jenkins which builds perf on ppc64le, but it only builds Linus' tree
> and linux-next.
> 
> Which branch in your tree should I be building in order to catch problems like
> this, perf/core ?
> 
> https://git.kernel.org/cgit/linux/kernel/git/acme/linux.git/log/?h=perf/core

yes, please, I use two normally, one for devel stuff, perf/core, and
perf/urgent when sending stuff to the current merge window.

I'll continue trying to get a local, more complete, cross compiler
environment, need to look again at how that multiarch stuff is in
debian...

- Arnaldo
