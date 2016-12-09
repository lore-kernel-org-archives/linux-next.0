From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Fri, 09 Dec 2016 21:35:54 +0100
Message-ID: <4284516.VtSFlm1aM8@wuerfel>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com> <5572017.jUy2fe8FTb@wuerfel> <CAGXu5jKtoN+uUa5zCmHR0=s8907kS3x30xMNc+s-On0_nyGiHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:61269 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751143AbcLIUhJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2016 15:37:09 -0500
In-Reply-To: <CAGXu5jKtoN+uUa5zCmHR0=s8907kS3x30xMNc+s-On0_nyGiHg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>, PaX Team <pageexec@freemail.hu>, Emese Revfy <re.emese@gmail.com>, maxim.kuvyrkov@linaro.org, Kugan Vivekanandarajah <kuganv@linaro.org>

On Friday, December 9, 2016 11:13:20 AM CET Kees Cook wrote:
> On Fri, Dec 9, 2016 at 3:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thursday, December 8, 2016 11:00:42 AM CET Kees Cook wrote:
> >> If you have a moment, applying 215e2aa6c024[1] and reverting
> >> a519167e753e for an allyesconfig/allmodconfig build should let you
> >> know if things are working correctly with headers installed. If anyone
> >> sees any problems, please let me know and I can queue up fixes.
> >>
> > This is what I got on x86-64 with a gcc-7.0.0 snapshot:
> >
> > In file included from /git/arm-soc/scripts/gcc-plugins/gcc-common.h:42:0,
> >                  from <stdin>:1:
> > /home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/emit-rtl.h:371:41: error: use of enum ‘memmodel’ without previous declaration
> >  extern bool need_atomic_barrier_p (enum memmodel, bool);
> >                                          ^
> > In file included from /git/arm-soc/scripts/gcc-plugins/gcc-common.h:94:0,
> >                  from <stdin>:1:
> > /home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/tree-ssanames.h:70:40: error: use of enum ‘value_range_type’ without previous declaration
> >  extern void set_range_info (tree, enum value_range_type, const wide_int_ref &,
> >                                         ^
> > /home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/tree-ssanames.h:73:13: error: use of enum ‘value_range_type’ without previous declaration
> >  extern enum value_range_type get_range_info (const_tree, wide_int *,
> >              ^
> > /home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/tree-ssanames.h:98:55: error: use of enum ‘value_range_type’ without previous declaration
> >  extern void duplicate_ssa_name_range_info (tree, enum value_range_type,
> >                                                        ^
> > Cannot use CONFIG_GCC_PLUGINS: your gcc installation does not support plugins, perhaps the necessary headers are missing?
> > scripts/Makefile.gcc-plugins:51: recipe for target 'gcc-plugins-check' failed
> >
> > I manually fixed up the gcc header files to include the ones with the
> > definition for now, to address those, but I don't know if that change is
> > correct.
> 
> What was needed?

I added '#include "memmodel.h"' and '#include "tree-vrp.h"', respectively, to
the headers that failed to get compiled.

This might be the correct solution, or the headers might not be meant to
be used standalone and instead require being included in the right order.

Gcc commit svn+ssh://gcc.gnu.org/svn/gcc/trunk@239638 moved
value_range_type from tree-ssanames.h to tree-vrp.h, I've added
Kugan to Cc, maybe he can clarify what that means for plugins.

	Arnd
