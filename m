From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Sun, 26 Aug 2018 03:53:23 +0900
Message-ID: <20180826035323.254463c8b183e6912c5b9a13@kernel.org>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <CAK8P3a0LXxq8tgsz9YL3hT47dB6nKeBdip3gFA5w0dgRGDwCMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0LXxq8tgsz9YL3hT47dB6nKeBdip3gFA5w0dgRGDwCMQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Arnd,

On Fri, 24 Aug 2018 14:46:16 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Fri, Aug 24, 2018 at 10:23 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> >
> > On Fri, 24 Aug 2018 13:32:06 +1000
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > > Hi all,
> > >
> > > After merging the origin tree, today's linux-next build (powerpc
> > > allyesconfig) produced these warnings:
> > >
> > > Maybe introduced by commit
> > >
> > >   6b7dca401cb1 ("tracing: Allow gcov profiling on only ftrace subsystem")
> > >
> > > I am guessing, but that is the only new thing that affects all of
> > > kernel/trace ...
> >
> > Yes, I agree. But I just followed Documentation/dev-tools/gcov.rst
> > to enable profiling in kernel/trace. Hmm, doesn't ppc64 support
> > GCOV_PROFILE?  (But as far as I can see, ARCH_HAS_GCOV_PROFILE_ALL
> > is enabled in arch/powerpc/Kconfig)
> >
> > Anyway, I'll try to reproduce it.
> 
> Thje same commit causes a link failure on ARM with a randconfig
> kernel (see https://pastebin.com/KspjpyKG for the .config):

OK, I confirmed that this happened with both gcc-7.3.0 and gcc-8.1.0
with your config.
I also confirmed that CONFIG_GCOV_PROFILE_ALL causes same issue.
(Note that CONFIG_GCOV_PROFILE_ALL depends on !CONFIG_COMPILE_TEST,
 so allyesconfig disables it always)

Hmm, now gcov kernel itself might have a problem on arm and 
powerpc(on gcc-8)?

Thanks,


-- 
Masami Hiramatsu <mhiramat@kernel.org>
