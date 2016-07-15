From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure after merge of the luto-misc tree
Date: Fri, 15 Jul 2016 12:24:36 -0300
Message-ID: <20160715152436.GB2523@redhat.com>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43434 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000AbcGOPYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2016 11:24:41 -0400
Content-Disposition: inline
In-Reply-To: <20160715150903.GA2523@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Fri, Jul 15, 2016 at 12:09:03PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Jul 15, 2016 at 09:31:19AM +0200, Peter Zijlstra escreveu:
> > On Fri, Jul 15, 2016 at 09:22:43AM +0200, Peter Zijlstra wrote:
> > > On Fri, Jul 15, 2016 at 05:06:54PM +1000, Stephen Rothwell wrote:
> > > > interacting with commit
> > > > 
> > > >   2a00f026a15d ("tools: Fix up BITS_PER_LONG setting")
> > > > 
> > > > from the tip tree.
> > > 
> > > Yuck.. that thing is horrid :/
> > > 
> > > What's wrong with so?
> > > 
> > > And if you really want to retain CONFIG_64BIT (because other headers
> > > might want it, and they currently do not) then do something like:
> > > 
> > > #ifdef __LP64__
> > > #define CONFIG_64BIT
> > > #else
> > > #define CONFIG_32BIT
> > > #endif
> > > 
> > > All GCC versions I checked have __CHAR_BIT__ and __SIZEOF_LONG__.
> > > 
> > > (and I checked most everything from 4.4 - 6.1)
> > 
> > clang-3.8 also defines all three of those, and I don't consider that a
> > usable compiler as it doesn't even build a kernel.
> 
> I was trying to have that file as close to the kernel as possible, but
> I'll try building with your patch in my test rig, lets see if one of the
> dozens of distros/releases barf at that...


Seems ok, but I'll reinstate this:

#if BITS_PER_LONG != __BITS_PER_LONG
#error Inconsistent word size. Check asm/bitsperlong.h
#endif

And now I'm rerunning these tests, that without the above check
produces:

# dm
alpine:3.4: Ok
android-ndk:r12b: Ok
centos:5: perf: Ok, objtool: FAIL   # But this one predates this patch, I'll fix it
centos:6: Ok
centos:7: Ok
debian:7: Ok
debian:8: Ok
debian:experimental: Ok
fedora:21: Ok
fedora:22: Ok
fedora:23: Ok
fedora:24: Ok
fedora:rawhide: Ok
opensuse:13.2: Ok
opensuse:42.1: Ok
ubuntu:14.04.4: Ok
ubuntu:15.10: Ok
ubuntu:16.04: Ok
#

- Arnaldo
