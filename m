From: Emese Revfy <re.emese@gmail.com>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Sat, 10 Dec 2016 17:45:31 +0100
Message-ID: <20161210174531.3c6b66ec00cbbbe7290ed69e@gmail.com>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
        <2680957.ot0HfIkH6p@wuerfel>
        <CAGXu5jJpBiffFhdQ+sjwWeeWOnpEkz4JQyH8VwmVCWP3TzXmLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:36373 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752328AbcLJQqg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 10 Dec 2016 11:46:36 -0500
In-Reply-To: <CAGXu5jJpBiffFhdQ+sjwWeeWOnpEkz4JQyH8VwmVCWP3TzXmLQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>, PaX Team <pageexec@freemail.hu>

On Fri, 9 Dec 2016 11:12:18 -0800
Kees Cook <keescook@google.com> wrote:

> On Fri, Dec 9, 2016 at 2:40 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thursday, December 8, 2016 11:00:42 AM CET Kees Cook wrote:
> >
> >> If you have a moment, applying 215e2aa6c024[1] and reverting
> >> a519167e753e for an allyesconfig/allmodconfig build should let you
> >> know if things are working correctly with headers installed. If anyone
> >> sees any problems, please let me know and I can queue up fixes.
> >
> > Using gcc-4.9.3 or gcc-5.3.1 for an ARM allmodconfig build, I get tons of
> > errors such as this one:
> >
> > /git/arm-soc/init/initramfs.c: In function 'error':
> > /git/arm-soc/init/initramfs.c:50:1: error: unrecognizable insn:
> >  }
> >  ^
> > (insn 26 25 27 5 (set (reg:SI 111 [ local_entropy.243 ])
> >         (rotatert:SI (reg:SI 116 [ local_entropy.243 ])
> >             (const_int -30 [0xffffffffffffffe2]))) -1
> >      (nil))
> > *** WARNING *** there are active plugins, do not report this as a bug unless you can reproduce it without enabling any plugins.
> > Event                            | Plugins
> > PLUGIN_ATTRIBUTES                | latent_entropy_plugin
> > PLUGIN_START_UNIT                | latent_entropy_plugin
> > /git/arm-soc/init/initramfs.c:50:1: internal compiler error: in extract_insn, at recog.c:2202
> > /git/arm-soc/arch/arm/vfp/vfpmodule.c: In function 'vfp_init':
> > /git/arm-soc/arch/arm/vfp/vfpmodule.c:824:1: error: unrecognizable insn:
> >  }
> >  ^
> > (insn 138 137 139 17 (set (reg:SI 165 [ local_entropy.93 ])
> >         (rotatert:SI (reg:SI 150 [ local_entropy.93 ])
> >             (const_int -9 [0xfffffffffffffff7]))) -1
> >      (nil))
> > *** WARNING *** there are active plugins, do not report this as a bug unless you can reproduce it without enabling any plugins.
> 
> Well that's exciting! :P

Hi,

You can find the fix here:
https://github.com/ephox-gcc-plugins/latent_entropy/commit/c91275a1bfcebbcfc0ca1af03396e06039f04db8

-- 
Emese
