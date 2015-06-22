From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] Documentation/vDSO: don't build tests when cross
 compiling
Date: Mon, 22 Jun 2015 15:09:42 -0400
Message-ID: <20150622190942.GM16386@windriver.com>
References: <1434849028-26733-1-git-send-email-paul.gortmaker@windriver.com>
 <20150622104124.62299220@lwn.net>
 <CALCETrU=OZBbQhzi-7mSM5AXor15rqynrVippv9nMbKCxHGu7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:35945 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900AbbFVTJv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2015 15:09:51 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrU=OZBbQhzi-7mSM5AXor15rqynrVippv9nMbKCxHGu7A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

[Re: [PATCH] Documentation/vDSO: don't build tests when cross compiling] On 22/06/2015 (Mon 10:01) Andy Lutomirski wrote:

> On Mon, Jun 22, 2015 at 9:41 AM, Jonathan Corbet <corbet@lwn.net> wrote:
> > On Sat, 20 Jun 2015 21:10:28 -0400
> > Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> >> The following was seen in linux-next build coverage, which is somewhat
> >> unique since it uses powerpc host to cross compile x86:
> >>
> >> Documentation/vDSO/vdso_standalone_test_x86.c:49:2: error: impossible
> >> register constraint in 'asm'
> >> make[4]: *** [Documentation/vDSO/vdso_standalone_test_x86.o] Error 1
> >>
> >> It probably makes sense to just skip building these tests when
> >> we are cross compiling.
> >
> > So I guess I'm not totally averse to applying these; getting rid of build
> > errors is a good thing.  But I do get the feeling like it's papering over
> > the real problem.  As a general rule, cross-compiling works; what's
> > special about these programs that makes it fail?
> 
> Agreed.  What gcc version is this?

Just to re-iterate, this is ppc host, cross compiling x86_64 target.

The linux-next build I saw the errors in this weekend is here:

http://kisskb.ellerman.id.au/kisskb/buildresult/12445538/

According to that, it is gcc 4.6.3

It seems that the assumption is that nobody cross compiles x86, so
when people see CONFIG_X86_64 set, they assume HOSTCC can create x86
binaries and will do so by default.  Hence the breakdown in creation
of some of these sample programs.  We've already a similar fix in
mainline in e9107f88c985bc ("samples/seccomp/Makefile: do not build
tests if cross-compiling for MIPS")

I've added linux-next folks to Cc: -- probably should have done that on
the original send...  they know more about the toolchains used for -next.

Paul.
--

> 
> --Andy
> 
> >
> > Thanks,
> >
> > jon
> 
> 
> 
> -- 
> Andy Lutomirski
> AMA Capital Management, LLC
