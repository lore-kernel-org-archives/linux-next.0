From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Tue, 28 Aug 2018 09:43:41 +0900
Message-ID: <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
        <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
        <20180828072333.36af4d5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828072333.36af4d5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, 28 Aug 2018 07:23:33 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Masami,
> 
> On Sun, 26 Aug 2018 17:10:58 +0900 Masami Hiramatsu <mhiramat@kernel.org> wrote:
> >
> > Hmm, unfortunately, I couldn't reproduce the ".data..LPBX1" error with
> > my gcc-8.1.0 + ld-2.30 distributed at https://cdn.kernel.org/pub/tools/crosstool/.
> > Could you also try to enable CONFIG_GCOV_PROFILE_ALL=y and build the kernel?
> > If it causes similar error, it should be caused by gcov support.
> 
> Using the allyesconfig as a base and disabling CONFIG_COMPILE_TESTING
> allowed me to enable COMFIG_GCOV_PROFILE_ALL, but that just generated a
> lot more messages.  Some about data..Lusan sections (I think).

OK, so it sounds like GCOV kernel itself is broken with your toolchain
(native gcc-8.2.0 on ppc64?) as same as arm32.

I added Peter in loop, he is the maintainer of GCOV kernel.

Hi Peter,
I recently added a gcov profiling for ftrace, following Documentation/dev-tools/gcov.rst.
6b7dca401cb1 ("tracing: Allow gcov profiling on only ftrace subsystem")

and it caused may orphan section warnings/errors on arm and powerpc64.
We also found same error happens when CONFIG_GCOV_PROFILE_ALL=y.
So I guess GCOV kernel subsystem broken in some environment.

(cross build)
gcc-7.3.0 + ld-2.30 => arm:NG, arm64:OK, powerpc64:OK
gcc-8.1.0 + ld-2.30 => arm:NG, arm64:OK, powerpc64:OK
(native build?)
gcc-8.2.0 + ld 2.31.1 => powerpc64:NG
gcc-7.2.1 + ld 2.27 => x86-64: OK

ppc64 NG report:
https://lkml.org/lkml/2018/8/24/72

arm NG report:
https://lkml.org/lkml/2018/8/24/345

Would you know how we can fix this issue?

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
