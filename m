From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: x86 tree build failure
Date: Sat, 19 Jul 2008 22:11:46 +1000
Message-ID: <20080719221146.df78ddca.sfr@canb.auug.org.au>
References: <20080717120754.66b6c14c.sfr@canb.auug.org.au>
	<19f34abd0807170223t7a81dbcfyb860b5e3fc32251c@mail.gmail.com>
	<20080718201040.GC27176@elte.hu>
	<20080718201206.GA16377@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__19_Jul_2008_22_11_46_+1000_vD5Ln64XDyOIl_wy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34806 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753113AbYGSML4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 19 Jul 2008 08:11:56 -0400
In-Reply-To: <20080718201206.GA16377@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Sat__19_Jul_2008_22_11_46_+1000_vD5Ln64XDyOIl_wy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 18 Jul 2008 22:12:06 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Ingo Molnar <mingo@elte.hu> wrote:
>=20
> > > The basic problem is that I completely overlooked the fact that some=
=20
> > > headers use the guards of _other_ headers in #if-checks. I think we=20
> > > should drop the consolidations completely until I have fixed the=20
> > > script to replace the header guard names which are used in other=20
> > > files as well. I'm sorry :-/
> >=20
> > ok, dropped them from the -next integration rules. Stephen, can you=20
> > use the previous version of the x86 branch, or should i reintegrate it=
=20
> > now?
>=20
> ok, i fixed it up in tip/auto-x86-next and pushed it out.

Just for future reference:  I rarely do linux-next builds on weekends (my
time) ...

Thanks for fixing this up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__19_Jul_2008_22_11_46_+1000_vD5Ln64XDyOIl_wy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiB2gIACgkQjjKRsyhoI8yBugCgnUUPG8lDWP9egwSIyRus+qvc
xXMAnizBrHhPeL3BZTys34lpJ8cJF50H
=Hv3f
-----END PGP SIGNATURE-----

--Signature=_Sat__19_Jul_2008_22_11_46_+1000_vD5Ln64XDyOIl_wy--
