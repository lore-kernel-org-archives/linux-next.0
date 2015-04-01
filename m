From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 01 Apr 2015 14:01:31 +1100
Message-ID: <1427857291.4256.8.camel@ellerman.id.au>
References: <20150401000221.21961ecd@canb.auug.org.au>
		 <20150331161640.GA16540@roeck-us.net> <20150331230749.GA6564@kroah.com>
	 <1427844281.4256.3.camel@ellerman.id.au> <551B557A.40805@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <551B557A.40805@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2015-03-31 at 19:18 -0700, Guenter Roeck wrote:
> On 03/31/2015 04:24 PM, Michael Ellerman wrote:
> > On Wed, 2015-04-01 at 01:07 +0200, Greg Kroah-Hartman wrote:
> >> On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
> >>> alpha:allmodconfig
> >>> mips:allmodconfig
> >>>
> >>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
> >>> samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_=
create=E2=80=99 undeclared
> >>> (first use in this function)
> >>>    p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC=
);
> >>>
> >>> Looks like the kdbus example never worked for the affected archit=
ectures.
> >>> I don't build allmodconfig for all architectures, so other archit=
ectures
> >>> may be affected as well.
> >>
> >> You need 3.17 kernel headers to have memfd_create, not much the kd=
bus
> >> test code can do about that.  You might want to update the kernel
> >> headers for these build boxes.
> >
> > Or just 'make headers_install' before building the samples should d=
o it.
> >
>=20
> Sure, that works so well in a cross build environment.

Well yeah it does, I do it all the time.

But what you mean is that the samples are built with HOSTCC, so having =
the
cross headers doesn't help.

The real problem here is samples, they shouldn't be built with the kern=
el, they
should be a separate thing, like the selftests.

cheers
