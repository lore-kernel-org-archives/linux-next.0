From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Fri, 31 Jul 2015 17:01:01 +1000
Message-ID: <1438326061.29353.9.camel@ellerman.id.au>
References: <20150729161912.GF18685@windriver.com>
	 <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
	 <55BA2B91.5070107@windriver.com>
	 <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45278 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750865AbbGaHBC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Jul 2015 03:01:02 -0400
In-Reply-To: <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2015-07-30 at 16:23 +0200, David Herrmann wrote:
> Hi
>=20
> On Thu, Jul 30, 2015 at 3:50 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> > On 2015-07-29 12:31 PM, David Herrmann wrote:
> >> Hi
> >>
> >> On Wed, Jul 29, 2015 at 6:19 PM, Paul Gortmaker
> >> <paul.gortmaker@windriver.com> wrote:
> >>> Hi David,
> >>>
> >>> Does it make sense to build this sample when cross compiling?
> >>>
> >>> The reason I ask is that it has been breaking the linux-next buil=
d of
> >>> allmodconfig for a while now, with:
> >>>
> >>>   HOSTCC  samples/kdbus/kdbus-workers
> >>> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=
=99:
> >>> samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_=
create=E2=80=99 undeclared (first use in this function)
> >>>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC)=
;
> >>>                   ^
> >>> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared ident=
ifier is reported only once for each function it appears in
> >>> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-=
workers' failed
> >>> make[2]: *** [samples/kdbus/kdbus-workers] Error 1
> >>
> >> mips does have this syscall, so I assume the problem is out-of-dat=
e
> >> kernel headers. You can fix this by running:
> >>
> >>     $ make headers_install
> >
> > No, let me try and clarify. Please note the emphasis on cross compi=
ling
> > and automated build coverage, i.e. there is no place for manual ste=
ps.
>=20
> User-space samples in ./samples/ are compiled with HOSTCC, which is
> the compiler for the _local_ machine. Regardless of cross-compiling
> the same local compiler is used. So I cannot understand why this is
> even remotely related to cross compiling. Please elaborate.
> Please note that this is HOSTCC running, so it does *NOT* require the
> toolchain for your cross-compiled architecture.

Right. Our cross toolchain wouldn't build it anyway, as it has no libc.

> Also, please tell me why your system has "linux/memfd.h" available,
> but __NR_memfd_create is undefined?

Because it's building with the HOSTCC (x86_64), against the MIPS kernel
headers. And the MIPS kernel headers are structured in such a way that =
on a
non-mips build they don't define the syscall numbers.

The reason we have the MIPS headers installed is because CONFIG_HEADERS=
_CHECK
is turned on (because allmodconfig).

So that just basically makes no sense to me.

It's obviously possible that some samples build with that configuration=
, but
building against another arch'es kernel headers just seems like it's as=
king for
trouble. Even if we can build the samples, they will never run correctl=
y.

So I suggest we should just disable SAMPLES if we're cross compiling, f=
ull stop.

cheers
