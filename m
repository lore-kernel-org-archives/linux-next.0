From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Fix compiler warnings and remove debug messages
Date: Tue, 11 Aug 2009 18:31:09 +1000
Message-ID: <20090811183109.74142cd8.sfr@canb.auug.org.au>
References: <20090810193653.f228cf06.sfr@canb.auug.org.au>
	<1249921736508-git-send-email-LW@KARO-electronics.de>
	<20090811000112.GB13314@kroah.com>
	<8bd0f97a0908110059y344071adn3656eaea3d7edddf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__11_Aug_2009_18_31_09_+1000_1hhcphKROSSTfrDw"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753825AbZHKMXh@vger.kernel.org>
In-Reply-To: <8bd0f97a0908110059y344071adn3656eaea3d7edddf@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Greg KH <greg@kroah.com>, Lothar Wassmann <LW@karo-electronics.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Bryan Wu <cooloney@kernel.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__11_Aug_2009_18_31_09_+1000_1hhcphKROSSTfrDw
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, 11 Aug 2009 03:59:43 -0400 Mike Frysinger <vapier.adi@gmail.com> wr=
ote:
>
> On Mon, Aug 10, 2009 at 20:01, Greg KH wrote:
> > On Mon, Aug 10, 2009 at 06:28:56PM +0200, Lothar Wassmann wrote:
> >> This patch fixes the reported compiler warnings and removes excessive =
debug messages.
> >> Compile tested only!
> >
> > I'd prefer the correct fixes for this driver. =C2=A0Mike, any thoughts =
on
> > some fixes for this?
>=20
> if it's simply fixing printf modifiers, then i can send out a patch for t=
hat.
>=20
> the changelog simply states "the reported compiler warnings" ... what
> exactly must i do to reproduce these ?

The original report was from an x86_64 allmodconfig build using gcc
v4.4.0.  You should only need to attempt to build
drivers/usb/host/isp1362-hcd.c to see the warnings.  It needs to be a 64
bit build.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__11_Aug_2009_18_31_09_+1000_1hhcphKROSSTfrDw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqBLE0ACgkQjjKRsyhoI8ycMwCeNcCx4s6/xDvqeF8AzGfuzb20
Pw8AoI1VdASHqdi7JvXJmWbZNbhhKGvV
=/Lz5
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Aug_2009_18_31_09_+1000_1hhcphKROSSTfrDw--
