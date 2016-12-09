From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Fri, 09 Dec 2016 12:33:22 +0100
Message-ID: <5572017.jUy2fe8FTb@wuerfel>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:59011 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932465AbcLILe1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2016 06:34:27 -0500
In-Reply-To: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>

On Thursday, December 8, 2016 11:00:42 AM CET Kees Cook wrote:
> Hi,
> 
> I'd like to get the GCC plugins building under
> allyesconfig/allmodconfig for -next soon (with the intention of
> landing the change in v4.11). Specifically, I intend to revert
> a519167e753e ("gcc-plugins: disable under COMPILE_TEST").
> 
> Right now the plugins are only supported on x86, arm, and arm64,
> though powerpc may happen in either v4.10 or v4.11 as well. This means
> that the autobuilders for these architectures need to have the "gcc
> plugin development" package installed which contains the GCC headers
> needed for the plugins. For Debian/Ubuntu, this is gcc-$N-plugin-dev
> (and for cross compilers: gcc-$N-plugin-dev-$arch-linux-$abi). For
> Fedora, it is gcc-plugin-devel (though I'm not sure the naming for
> cross compilers). Manual builds of compilers should already have these
> headers installed.
> 
> The "noisy" plugin, cyc_complexity, is just an example, and I have
> disabled it (which is pending[1] for v4.10). The remaining ones
> (sancov and latent_entropy) are what I'm hoping to see tested
> tree-wide (with the expectation that more are coming down the road:
> initify, randstruct, structleak, constify, ...)
> 
> IIUC, the 0day builder already has the headers installed. I tried to
> look through linux-next to find all the other folks that do
> autobuilding on these architectures; apologies if I've missed anyone.
> 
> If you have a moment, applying 215e2aa6c024[1] and reverting
> a519167e753e for an allyesconfig/allmodconfig build should let you
> know if things are working correctly with headers installed. If anyone
> sees any problems, please let me know and I can queue up fixes.
> 
> Thanks!
> 
> -Kees
> 
> [1] http://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/commit/?h=for-next/gcc-plugins&id=215e2aa6c024d27cdbe88e2ea88cb59dcab588eb

This is what I got on x86-64 with a gcc-7.0.0 snapshot:

In file included from /git/arm-soc/scripts/gcc-plugins/gcc-common.h:42:0,
                 from <stdin>:1:
/home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/emit-rtl.h:371:41: error: use of enum ‘memmodel’ without previous declaration
 extern bool need_atomic_barrier_p (enum memmodel, bool);
                                         ^
In file included from /git/arm-soc/scripts/gcc-plugins/gcc-common.h:94:0,
                 from <stdin>:1:
/home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/tree-ssanames.h:70:40: error: use of enum ‘value_range_type’ without previous declaration
 extern void set_range_info (tree, enum value_range_type, const wide_int_ref &,
                                        ^
/home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/tree-ssanames.h:73:13: error: use of enum ‘value_range_type’ without previous declaration
 extern enum value_range_type get_range_info (const_tree, wide_int *,
             ^
/home/arnd/cross-gcc/lib/gcc/x86_64-linux/7.0.0/plugin/include/tree-ssanames.h:98:55: error: use of enum ‘value_range_type’ without previous declaration
 extern void duplicate_ssa_name_range_info (tree, enum value_range_type,
                                                       ^
Cannot use CONFIG_GCC_PLUGINS: your gcc installation does not support plugins, perhaps the necessary headers are missing?
scripts/Makefile.gcc-plugins:51: recipe for target 'gcc-plugins-check' failed

I manually fixed up the gcc header files to include the ones with the
definition for now, to address those, but I don't know if that change is
correct.

	Arnd
