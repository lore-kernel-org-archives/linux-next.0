From: Kees Cook <keescook@google.com>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Thu, 8 Dec 2016 20:15:05 -0800
Message-ID: <CAGXu5jLuuoCpaQ82nK=pFWEeRrm86=vozyS=3nPN=Lw+2uUHQg@mail.gmail.com>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
 <CAP=VYLrOu8Yjzds2cHcii=kX5-i5xV3GUkLR9yhxBdJBw31F0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLrOu8Yjzds2cHcii=kX5-i5xV3GUkLR9yhxBdJBw31F0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Tony Breeds <tony@bakeyournoodle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 8, 2016 at 5:52 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On Thu, Dec 8, 2016 at 2:00 PM, Kees Cook <keescook@google.com> wrote:
>> Hi,
>>
>> I'd like to get the GCC plugins building under
>> allyesconfig/allmodconfig for -next soon (with the intention of
>> landing the change in v4.11). Specifically, I intend to revert
>> a519167e753e ("gcc-plugins: disable under COMPILE_TEST").
>
> If I recall correctly, I noted that the plugins broke the kernel.org
> cross compiler toolchains which led to the above disable.

Do you mean these?
https://www.kernel.org/pub/tools/crosstool/

> Has that changed?    People who have been doing tree wide changes
> and have been compiling across a bunch of different arch to ensure
> their changes don't cause breakage should not be left out in the cold.

Totally agreed! :) That's why I want to get the ball rolling now, so
there's plenty of time.

> If there are newer toolchains that I can download and use in "toaster"
> mode, then great.   But I (and many others) don't want to waste a day
> trying to make the latest gcc build some obsolete pa-risc architecture
> just to support a Kconfig default setting change.

The good news is, pa-risc doesn't support the plugins yet. It's only
x86, arm, arm64, and soon powerpc. The point being, the less common
architectures won't be hit by this anyway.

Regardless, it would be nice to get a newer set of toolchains up on
kernel.org...

> Can you elaborate on the motivation for this change?  At the moment
> I see more downsides than advantages.

Since the plugins run during every object build, getting them running
in the widest possible coverage means we'll shake out bugs more
rapidly.

-Kees

>
> Thanks,
> Paul.
> --
>
>>
>> Right now the plugins are only supported on x86, arm, and arm64,
>> though powerpc may happen in either v4.10 or v4.11 as well. This means
>> that the autobuilders for these architectures need to have the "gcc
>> plugin development" package installed which contains the GCC headers
>> needed for the plugins. For Debian/Ubuntu, this is gcc-$N-plugin-dev
>> (and for cross compilers: gcc-$N-plugin-dev-$arch-linux-$abi). For
>> Fedora, it is gcc-plugin-devel (though I'm not sure the naming for
>> cross compilers). Manual builds of compilers should already have these
>> headers installed.
>>
>> The "noisy" plugin, cyc_complexity, is just an example, and I have
>> disabled it (which is pending[1] for v4.10). The remaining ones
>> (sancov and latent_entropy) are what I'm hoping to see tested
>> tree-wide (with the expectation that more are coming down the road:
>> initify, randstruct, structleak, constify, ...)
>>
>> IIUC, the 0day builder already has the headers installed. I tried to
>> look through linux-next to find all the other folks that do
>> autobuilding on these architectures; apologies if I've missed anyone.
>>
>> If you have a moment, applying 215e2aa6c024[1] and reverting
>> a519167e753e for an allyesconfig/allmodconfig build should let you
>> know if things are working correctly with headers installed. If anyone
>> sees any problems, please let me know and I can queue up fixes.
>>
>> Thanks!
>>
>> -Kees
>>
>> [1] http://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/commit/?h=for-next/gcc-plugins&id=215e2aa6c024d27cdbe88e2ea88cb59dcab588eb
>>
>> --
>> Kees Cook
>> Nexus Security
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-next" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Kees Cook
Nexus Security
