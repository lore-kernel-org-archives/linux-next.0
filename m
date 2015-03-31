From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Tue, 31 Mar 2015 09:16:40 -0700
Message-ID: <20150331161640.GA16540@roeck-us.net>
References: <20150401000221.21961ecd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150401000221.21961ecd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 01, 2015 at 12:02:21AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20150330:
>=20
> The arm64 tree gained a conflict against the arm-soc tree.
>=20
> The idle tree gained a build failure so I used the version from
> next-20150327.
>=20
> The tip tree gained conflicts against the pm tree.
>=20
> The akpm tree gained a conflict against the mips tree.
>=20
> Non-merge commits (relative to Linus' tree): 7277
>  6623 files changed, 304342 insertions(+), 138111 deletions(-)
>=20
> ---------------------------------------------------------------------=
-------
>=20

Build results:
	total: 121 pass: 94 fail: 27
=46ailed builds:
	alpha:allmodconfig
	arm:rpc_defconfig
	arm64:defconfig
	cris:defconfig
	cris:etrax-100lx_defconfig
	cris:allnoconfig
	frv:defconfig
	i386:allyesconfig
	i386:allmodconfig
	ia64:defconfig
	m32r:defconfig
	m68k:defconfig
	m68k:allmodconfig
	m68k:sun3_defconfig
	m68k:m5272c3_defconfig
	m68k:m5307c3_defconfig
	m68k:m5249evb_defconfig
	m68k:m5407c3_defconfig
	m68k:m5475evb_defconfig
	mips:allmodconfig
	parisc:defconfig
	parisc:generic-32bit_defconfig
	parisc:a500_defconfig
	parisc:generic-64bit_defconfig
	x86_64:allyesconfig
	xtensa:defconfig
	xtensa:allmodconfig

---
alpha:allmodconfig
mips:allmodconfig

samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99:
samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_create=
=E2=80=99 undeclared
(first use in this function)
  p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);

Looks like the kdbus example never worked for the affected architecture=
s.
I don't build allmodconfig for all architectures, so other architecture=
s
may be affected as well.

---
arm64:defconfig

drivers/built-in.o: In function `tegra124_132_clock_init_post':
drivers/clk/tegra/clk-tegra124.c:1496: undefined reference to `tegra_em=
c_init'

Introduced by commit 32477681f48a ("Merge remote-tracking branch
'arm64/for-next/core'"). Maybe some conflict resolution problem ?
CONFIG_ARCH_TEGRA_132_SOC only builds clk-tegra124.o, but clk-tegra124.=
o
needs clk-emc.o for tegra_emc_init. clk-emc.c was introduced with commi=
t
4ec9e9975d8c ("clk: tegra: Add EMC clock driver"), but it only adds
clk-emc.o to the CONFIG_ARCH_TEGRA_124_SOC build, not to
CONFIG_ARCH_TEGRA_132_SOC.

On a side note, tegra_emc_init is declared twice, once as static variab=
le
and once as global variable, in different files.

---
cris:defconfig
cris:etrax-100lx_defconfig
cris:allnoconfig
frv:defconfig
ia64:defconfig
m32r:defconfig
m68k (all builds)
parisc (all builds)
arm:rpc_defconfig

In file included from kernel/time/hrtimer.c:57:0:
kernel/time/tick-internal.h: In function 'tick_set_periodic_handler':
kernel/time/tick-internal.h:114:5: error: dereferencing pointer to inco=
mplete type
kernel/time/tick-internal.h:114:23: error: 'tick_handle_periodic' undec=
lared

tick_handle_periodic is declared inside CONFIG_GENERIC_CLOCKEVENTS but =
used
outside.

Introduced by commit 01b9fdf7e540 ("tick: Move core only declarations a=
nd
functions to core") according to bisect. There may be other problems ob=
scuring
the bisect results, though, since the build failure pattern changes dur=
ing
bisect.

---
i386:allyesconfig
i386:allmodconfig

drivers/usb/musb/musb_dsps.c: In function 'dsps_read_fifo32':
drivers/usb/musb/musb_dsps.c:624:3: error: implicit declaration of func=
tion 'readsl'

Introduced by commit 3e457371f436 ("usb: musb: Fix fifo reads for dm816=
x with
musb_dsps").

---
x86_64:allyesconfig

drivers/built-in.o: In function `sl811_cs_probe':
sl811_cs.c:(.text+0x1d432f6): undefined reference to `sl811h_driver'

Introduced by commit 1dc6120ef7f0 ("usb: host/sl811-hcd: fix sparse war=
ning"),
a botched cleanup attempt.

---
xtensa

Lots of 'dangerous relocation: l32r: literal placed after use' all over=
 the
place, causing all xtensa builds to fail.

Introduced by commit 779c88c94c34 ("ARM: 8321/1: asm-generic: introduce
=2Etext.fixup input section").
