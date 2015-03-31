From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 01 Apr 2015 10:24:41 +1100
Message-ID: <1427844281.4256.3.camel@ellerman.id.au>
References: <20150401000221.21961ecd@canb.auug.org.au>
	 <20150331161640.GA16540@roeck-us.net> <20150331230749.GA6564@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55251 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751595AbbCaXYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 19:24:43 -0400
In-Reply-To: <20150331230749.GA6564@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>

On Wed, 2015-04-01 at 01:07 +0200, Greg Kroah-Hartman wrote:
> On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
> > alpha:allmodconfig
> > mips:allmodconfig
> >=20
> > samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
> > samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_cr=
eate=E2=80=99 undeclared
> > (first use in this function)
> >   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
> >=20
> > Looks like the kdbus example never worked for the affected architec=
tures.
> > I don't build allmodconfig for all architectures, so other architec=
tures
> > may be affected as well.
>=20
> You need 3.17 kernel headers to have memfd_create, not much the kdbus
> test code can do about that.  You might want to update the kernel
> headers for these build boxes.

Or just 'make headers_install' before building the samples should do it=
=2E

cheers
