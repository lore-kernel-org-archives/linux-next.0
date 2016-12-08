From: Kees Cook <keescook@google.com>
Subject: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Thu, 8 Dec 2016 11:00:42 -0800
Message-ID: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

I'd like to get the GCC plugins building under
allyesconfig/allmodconfig for -next soon (with the intention of
landing the change in v4.11). Specifically, I intend to revert
a519167e753e ("gcc-plugins: disable under COMPILE_TEST").

Right now the plugins are only supported on x86, arm, and arm64,
though powerpc may happen in either v4.10 or v4.11 as well. This means
that the autobuilders for these architectures need to have the "gcc
plugin development" package installed which contains the GCC headers
needed for the plugins. For Debian/Ubuntu, this is gcc-$N-plugin-dev
(and for cross compilers: gcc-$N-plugin-dev-$arch-linux-$abi). For
Fedora, it is gcc-plugin-devel (though I'm not sure the naming for
cross compilers). Manual builds of compilers should already have these
headers installed.

The "noisy" plugin, cyc_complexity, is just an example, and I have
disabled it (which is pending[1] for v4.10). The remaining ones
(sancov and latent_entropy) are what I'm hoping to see tested
tree-wide (with the expectation that more are coming down the road:
initify, randstruct, structleak, constify, ...)

IIUC, the 0day builder already has the headers installed. I tried to
look through linux-next to find all the other folks that do
autobuilding on these architectures; apologies if I've missed anyone.

If you have a moment, applying 215e2aa6c024[1] and reverting
a519167e753e for an allyesconfig/allmodconfig build should let you
know if things are working correctly with headers installed. If anyone
sees any problems, please let me know and I can queue up fixes.

Thanks!

-Kees

[1] http://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/commit/?h=for-next/gcc-plugins&id=215e2aa6c024d27cdbe88e2ea88cb59dcab588eb

-- 
Kees Cook
Nexus Security
