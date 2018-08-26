From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Sun, 26 Aug 2018 17:10:58 +0900
Message-ID: <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824224211.2934d7c0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, 24 Aug 2018 22:42:11 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Masami,
> 
> On Fri, 24 Aug 2018 20:47:56 +0900 Masami Hiramatsu <mhiramat@kernel.org> wrote:
> >
> > gcc-7.3.0 cross build ld shows below warnings.
> > 
> >   MODPOST vmlinux.o
> > /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> >   KSYM    .tmp_kallsyms1.o
> > /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> >   KSYM    .tmp_kallsyms2.o
> > /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> >   KSYM    .tmp_kallsyms3.o
> >   LD      vmlinux
> > /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
> 
> I reported those a while ago when I started using the native Debian gcc
> on my Powerpc build box.
> 
> > But it seems another warning, and I couldn't see your warnings. Could you tell me your gcc version?
> 
> Currently, it is the Debian gcc 8.2.0, ld 2.31.1.

Hmm, unfortunately, I couldn't reproduce the ".data..LPBX1" error with
my gcc-8.1.0 + ld-2.30 distributed at https://cdn.kernel.org/pub/tools/crosstool/.
Could you also try to enable CONFIG_GCOV_PROFILE_ALL=y and build the kernel?
If it causes similar error, it should be caused by gcov support.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
