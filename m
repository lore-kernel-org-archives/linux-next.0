From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] Documentation/vDSO: don't build tests when cross
 compiling
Date: Mon, 22 Jun 2015 16:41:10 -0400
Message-ID: <20150622204109.GN16386@windriver.com>
References: <1434849028-26733-1-git-send-email-paul.gortmaker@windriver.com>
 <20150622104124.62299220@lwn.net>
 <CALCETrU=OZBbQhzi-7mSM5AXor15rqynrVippv9nMbKCxHGu7A@mail.gmail.com>
 <20150622190942.GM16386@windriver.com>
 <CALCETrX1r6_CJgN=iZsnOxdOQRNgc6JH-qBN2O9-Hu-jDnxTpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrX1r6_CJgN=iZsnOxdOQRNgc6JH-qBN2O9-Hu-jDnxTpw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

[Re: [PATCH] Documentation/vDSO: don't build tests when cross compiling] On 22/06/2015 (Mon 12:46) Andy Lutomirski wrote:

> On Mon, Jun 22, 2015 at 12:09 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> > [Re: [PATCH] Documentation/vDSO: don't build tests when cross compiling] On 22/06/2015 (Mon 10:01) Andy Lutomirski wrote:
> >
> >> On Mon, Jun 22, 2015 at 9:41 AM, Jonathan Corbet <corbet@lwn.net> wrote:
> >> > On Sat, 20 Jun 2015 21:10:28 -0400
> >> > Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >> >
> >> >> The following was seen in linux-next build coverage, which is somewhat
> >> >> unique since it uses powerpc host to cross compile x86:
> >> >>
> >> >> Documentation/vDSO/vdso_standalone_test_x86.c:49:2: error: impossible
> >> >> register constraint in 'asm'
> >> >> make[4]: *** [Documentation/vDSO/vdso_standalone_test_x86.o] Error 1
> >> >>
> >> >> It probably makes sense to just skip building these tests when
> >> >> we are cross compiling.
> >> >
> >> > So I guess I'm not totally averse to applying these; getting rid of build
> >> > errors is a good thing.  But I do get the feeling like it's papering over
> >> > the real problem.  As a general rule, cross-compiling works; what's
> >> > special about these programs that makes it fail?
> >>
> >> Agreed.  What gcc version is this?
> >
> > Just to re-iterate, this is ppc host, cross compiling x86_64 target.
> >
> > The linux-next build I saw the errors in this weekend is here:
> >
> > http://kisskb.ellerman.id.au/kisskb/buildresult/12445538/
> >
> > According to that, it is gcc 4.6.3
> >
> > It seems that the assumption is that nobody cross compiles x86, so
> > when people see CONFIG_X86_64 set, they assume HOSTCC can create x86
> > binaries and will do so by default.  Hence the breakdown in creation
> > of some of these sample programs.  We've already a similar fix in
> > mainline in e9107f88c985bc ("samples/seccomp/Makefile: do not build
> > tests if cross-compiling for MIPS")
> >
> > I've added linux-next folks to Cc: -- probably should have done that on
> > the original send...  they know more about the toolchains used for -next.
> 
> Oh, right.
> 
> Do we have something like hostprogs that builds for the target instead
> of the host?

I just re-scanned Documentation/kbuild/makefiles.txt ; section 4 in
there is "Host Program support" --- nothing jumps out at me.

Something else worth mentioning is that the toolchains I (and many
others?) use from kernel.org for cross-compile testing of my multi-arch
or tree-wide changes do explicitly say this:

"These compilers are only functional for kernel builds. They cannot be
used to build userspace code".   --- they can be found here:

https://www.kernel.org/pub/tools/crosstool/

I'm thinking that by the time we support toolchains and libraries
that can cross compile user space cruft, we'll be 90% towards
reinventing what the yocto project has with full sysroots etc.

I'm open to other solutions than what I've posted here, but at the
moment it is kind of looking like just omitting these test progs and
userspace progs when x-compiling is the best choice currently.

Paul.
--

> 
> --Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
