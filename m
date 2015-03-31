From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 1 Apr 2015 01:07:49 +0200
Message-ID: <20150331230749.GA6564@kroah.com>
References: <20150401000221.21961ecd@canb.auug.org.au>
 <20150331161640.GA16540@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150331161640.GA16540@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
> On Wed, Apr 01, 2015 at 12:02:21AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20150330:
> >=20
> > The arm64 tree gained a conflict against the arm-soc tree.
> >=20
> > The idle tree gained a build failure so I used the version from
> > next-20150327.
> >=20
> > The tip tree gained conflicts against the pm tree.
> >=20
> > The akpm tree gained a conflict against the mips tree.
> >=20
> > Non-merge commits (relative to Linus' tree): 7277
> >  6623 files changed, 304342 insertions(+), 138111 deletions(-)
> >=20
> > -------------------------------------------------------------------=
---------
> >=20
>=20
> Build results:
> 	total: 121 pass: 94 fail: 27
> Failed builds:
> 	alpha:allmodconfig
> 	arm:rpc_defconfig
> 	arm64:defconfig
> 	cris:defconfig
> 	cris:etrax-100lx_defconfig
> 	cris:allnoconfig
> 	frv:defconfig
> 	i386:allyesconfig
> 	i386:allmodconfig
> 	ia64:defconfig
> 	m32r:defconfig
> 	m68k:defconfig
> 	m68k:allmodconfig
> 	m68k:sun3_defconfig
> 	m68k:m5272c3_defconfig
> 	m68k:m5307c3_defconfig
> 	m68k:m5249evb_defconfig
> 	m68k:m5407c3_defconfig
> 	m68k:m5475evb_defconfig
> 	mips:allmodconfig
> 	parisc:defconfig
> 	parisc:generic-32bit_defconfig
> 	parisc:a500_defconfig
> 	parisc:generic-64bit_defconfig
> 	x86_64:allyesconfig
> 	xtensa:defconfig
> 	xtensa:allmodconfig
>=20
> ---
> alpha:allmodconfig
> mips:allmodconfig
>=20
> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99=
:
> samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_crea=
te=E2=80=99 undeclared
> (first use in this function)
>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>=20
> Looks like the kdbus example never worked for the affected architectu=
res.
> I don't build allmodconfig for all architectures, so other architectu=
res
> may be affected as well.

You need 3.17 kernel headers to have memfd_create, not much the kdbus
test code can do about that.  You might want to update the kernel
headers for these build boxes.

Or have we not hooked up memfd for alpha and mips?

thanks,

greg k-h
