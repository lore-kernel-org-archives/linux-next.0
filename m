From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Mar 31 (build failures and culprits)
Date: Wed, 1 Apr 2015 10:42:33 +1100
Message-ID: <20150401104233.563d0022@canb.auug.org.au>
References: <20150401000221.21961ecd@canb.auug.org.au>
	<20150331161640.GA16540@roeck-us.net>
	<20150331230749.GA6564@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CLmRbAF7.6P.SC_Hk1ESAlX"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49040 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751541AbbCaXml (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 19:42:41 -0400
In-Reply-To: <20150331230749.GA6564@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Felipe Balbi <balbi@ti.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Lad@roeck-us.net, Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Mack <daniel@zonque.org>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <treding@nvidia.com>

--Sig_/CLmRbAF7.6P.SC_Hk1ESAlX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 1 Apr 2015 01:07:49 +0200 Greg Kroah-Hartman <gregkh@linuxfoundatio=
n.org> wrote:
>
> On Tue, Mar 31, 2015 at 09:16:40AM -0700, Guenter Roeck wrote:
> >
> > alpha:allmodconfig
> > mips:allmodconfig
> >=20
> > samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99:
> > samples/kdbus/kdbus-workers.c:930:18: error: =E2=80=98__NR_memfd_create=
=E2=80=99 undeclared
> > (first use in this function)
> >   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
> >=20
> > Looks like the kdbus example never worked for the affected architecture=
s.
> > I don't build allmodconfig for all architectures, so other architectures
> > may be affected as well.
>=20
> You need 3.17 kernel headers to have memfd_create, not much the kdbus
> test code can do about that.  You might want to update the kernel
> headers for these build boxes.
>=20
> Or have we not hooked up memfd for alpha and mips?

alpha has no definition for __NR_memfd_create and doesn't use
asm-generic/unistd.h.

mips has a definition for __NR_memfd_create if _MIPS_SIM =3D=3D
_MIPS_SIM_ABI32, _MIPS_SIM_ABI64 or _MIPS_SIM_NABI32 (is there any
other alternative?).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/CLmRbAF7.6P.SC_Hk1ESAlX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGzDuAAoJEMDTa8Ir7ZwVmrgP/1LNS0smYXefjPQxyW4ZNuNh
tyZ6gqoCb2hfga980ZPnB0PBJ+izwJQmklAdBUABvU981VHaKPWY0e7UHOyc8vgf
s4nun1jyh2astrMk9/qy6U2QvSuGTeWEFTiVJ8Ucu5NlMmh/SxUvE8xB2YKBaLRa
xIHyoWsf3gOFdtIIlGMX/uZW/YYWzXC3uWyYnK7bc53zFOrP4yUdfD6KFtoShpXB
eIZja8YRfq7RUE0LNo8ka2gyAt795OMj0XOcJD09w8BRKfhRH/+mC6+R8UqE5RR8
XLTcx89IM9DmZkGvY5bB4gBDIEe0w+0er2HoWOSJudvnrm33QRW9ZMOVji8j29ag
xhN+5iEqLJWY+mydGU1vKYRkwZ7nrkduvoGEtQroOmK9VLNcdqEo4shA80Ikt/Ih
agC0kIuZZCj8+EOxeK7c1XvR5JLkkBhXsmYQcNFSOp6EfiVysAC6udHZpa0ekgJv
ZyLl65T819jmFxNC/OFziCsQbSOsi/EjZoIx9cVPXepk+PSBjjkG6/rrH3MEhfP0
QDha23sddgjEh/TYwd93j8YHv5CPTYRV56OFo7ZKOQOFXNHNRhmd/ddFFuqiI7VJ
NtuBQYjHqaB+rrcetvEGuB9tHOmxIytuB2Vqv2ewPkqcbiJZdDS9tEYKwQbycmkN
aQFQMeB9tkewL+QIGe1v
=+oN9
-----END PGP SIGNATURE-----

--Sig_/CLmRbAF7.6P.SC_Hk1ESAlX--
