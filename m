From: Kees Cook <keescook@google.com>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Fri, 9 Dec 2016 11:12:18 -0800
Message-ID: <CAGXu5jJpBiffFhdQ+sjwWeeWOnpEkz4JQyH8VwmVCWP3TzXmLQ@mail.gmail.com>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
 <2680957.ot0HfIkH6p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2680957.ot0HfIkH6p@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>, PaX Team <pageexec@freemail.hu>, Emese Revfy <re.emese@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 9, 2016 at 2:40 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday, December 8, 2016 11:00:42 AM CET Kees Cook wrote:
>
>> If you have a moment, applying 215e2aa6c024[1] and reverting
>> a519167e753e for an allyesconfig/allmodconfig build should let you
>> know if things are working correctly with headers installed. If anyone
>> sees any problems, please let me know and I can queue up fixes.
>
> Using gcc-4.9.3 or gcc-5.3.1 for an ARM allmodconfig build, I get tons of
> errors such as this one:
>
> /git/arm-soc/init/initramfs.c: In function 'error':
> /git/arm-soc/init/initramfs.c:50:1: error: unrecognizable insn:
>  }
>  ^
> (insn 26 25 27 5 (set (reg:SI 111 [ local_entropy.243 ])
>         (rotatert:SI (reg:SI 116 [ local_entropy.243 ])
>             (const_int -30 [0xffffffffffffffe2]))) -1
>      (nil))
> *** WARNING *** there are active plugins, do not report this as a bug unless you can reproduce it without enabling any plugins.
> Event                            | Plugins
> PLUGIN_ATTRIBUTES                | latent_entropy_plugin
> PLUGIN_START_UNIT                | latent_entropy_plugin
> /git/arm-soc/init/initramfs.c:50:1: internal compiler error: in extract_insn, at recog.c:2202
> /git/arm-soc/arch/arm/vfp/vfpmodule.c: In function 'vfp_init':
> /git/arm-soc/arch/arm/vfp/vfpmodule.c:824:1: error: unrecognizable insn:
>  }
>  ^
> (insn 138 137 139 17 (set (reg:SI 165 [ local_entropy.93 ])
>         (rotatert:SI (reg:SI 150 [ local_entropy.93 ])
>             (const_int -9 [0xfffffffffffffff7]))) -1
>      (nil))
> *** WARNING *** there are active plugins, do not report this as a bug unless you can reproduce it without enabling any plugins.

Well that's exciting! :P

>
> Using gcc-6.1.1 or gcc-7.0.0, everything works fine as far as I
> can tell. With some older Ubuntu binary toolchains, I get this one:
>
> In file included from <stdin>:1:0:
> /git/arm-soc/scripts/gcc-plugins/gcc-common.h:4:22: fatal error: bversion.h: No such file or directory
> compilation terminated.
> Cannot use CONFIG_GCC_PLUGINS: your gcc installation does not support plugins, perhaps the necessary headers are missing?
>
> and I can't find the packages for the headers (I still get them for
> gcc-5, but not older versions). On very old toolchains (e.g. gcc-4.3),
> I get this one:
>
> Cannot use CONFIG_GCC_PLUGINS: your gcc version does not support plugins, you should upgrade it to at least gcc 4.5
> scripts/Makefile.gcc-plugins:54: recipe for target 'gcc-plugins-check' failed

I'm starting to wonder if we need to expose the compiler version to
Kconfig so that "all*config" builds for earlier compiler will
automatically leave things like plugins off. But I have no idea what
the right approach for that might be.

I'm not a fan of silently disabling stuff (like is done, for example,
for KCOV). If you've selected a Kconfig that your compiler can't
build, it should fail to build, but that's different from the
allyesconfig etc, since that's about compile tests not a sane kernel
image.

Perhaps if COMPILE_TEST is enabled, and there is something unsupported
by the compiler, only then would it warn and continue, instead of
killing build?

-Kees

-- 
Kees Cook
Nexus Security
