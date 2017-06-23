From: Tony Breeds <tony@bakeyournoodle.com>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Sat, 24 Jun 2017 07:16:03 +1000
Message-ID: <20170623211603.GD28216@thor.bakeyournoodle.com>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
 <CAP=VYLrOu8Yjzds2cHcii=kX5-i5xV3GUkLR9yhxBdJBw31F0Q@mail.gmail.com>
 <CAGXu5jLuuoCpaQ82nK=pFWEeRrm86=vozyS=3nPN=Lw+2uUHQg@mail.gmail.com>
 <871sqbqmw1.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44533 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753942AbdFWVQH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jun 2017 17:16:07 -0400
Content-Disposition: inline
In-Reply-To: <871sqbqmw1.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kees Cook <keescook@google.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 03:43:58PM +1000, Michael Ellerman wrote:
> [Old thread just popped up in my inbox]
>=20
> Kees Cook <keescook@google.com> writes:
> > On Thu, Dec 8, 2016 at 5:52 PM, Paul Gortmaker
> > <paul.gortmaker@windriver.com> wrote:
> >> On Thu, Dec 8, 2016 at 2:00 PM, Kees Cook <keescook@google.com> wrote:
> >>> Hi,
> >>>
> >>> I'd like to get the GCC plugins building under
> >>> allyesconfig/allmodconfig for -next soon (with the intention of
> >>> landing the change in v4.11). Specifically, I intend to revert
> >>> a519167e753e ("gcc-plugins: disable under COMPILE_TEST").
> >>
> >> If I recall correctly, I noted that the plugins broke the kernel.org
> >> cross compiler toolchains which led to the above disable.
> >
> > Do you mean these?
> > https://www.kernel.org/pub/tools/crosstool/
>=20
> I think those are the ones Paul is talking about.
>=20
> Those were mostly built by Tony, who is know, sadly, an Openstack
> developer and for some reason doesn't seem to have time to build
> toolchains for kernel hackers :P

Yeah sad but true.  Building a full suit took a couple of days and I'm
just not going to find that anytime soon.

I don't really want to build them one at a time but I could I suppose,
I'd play favotites x64_86, ppc64le and then the others if and when time
becomes an option.  My problem with that is it kinda defeats the aim on
why I put th etoolchains up there.  to enable testing accross the range
of architectures in a consistent way.

Another option would clearly be to find someone that is closer to the
kernel to do this thing.

Ho hum thoughts?

> As folks may have seen on LWN, there are now pre-built toolchains for
> many architectures available from the Free Electrons guys, so that may
> help to unblock this situation somewhat:
>=20
> http://toolchains.free-electrons.com/

So ubuntu and Fedora each have cross toolschains in the distro and we
that those ^^.  Perhaps this no longer needs to be provided by the
kernel community?

Yours Tony.

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEfFRspaiB3UeSCwy1uw4mk74dfEkFAllNhQwACgkQuw4mk74d
fEldWgf/ckOLt0eSahOyV01sNRMAg8XzzJljSoyI9meGx86GtxDNEIGetvk/L1CW
VdAVnB9WNJGQrI6MeZ63UdL/2G9vHKj+EY7n/5+dWAujx9vd5xeiC4pLxYdR5ITY
8Dj3Nn06C6aXZGOgVVPfZBdN1zt93CDjeL69MGrtE1cTvCGfEMG11ywGqFKuYsIf
NsqyDnBN9HBTJ1hj6Tey2M3l6MhkoUYDV3M2y/QKJdLC010JUzYKBdzTES8THWA1
y8SnZQDu9wwpqQ2y/WpAs9knvQEk2H/YKWpIS98NmeOY/Eqpv0ogEnccl4STHOIq
Vf032GJHBiCOq7GqUuy6WLlxVSXMjg==
=/tey
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
