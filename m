From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Tue, 25 Nov 2008 19:42:57 +1100
Message-ID: <20081125194257.84089d9b.sfr@canb.auug.org.au>
References: <20081124154938.bac22cd5.sfr@canb.auug.org.au>
	<20081123.210452.160784844.davem@davemloft.net>
	<20081124162044.f3333fcf.sfr@canb.auug.org.au>
	<20081123.212339.131214270.davem@davemloft.net>
	<20081124163844.004469a6.sfr@canb.auug.org.au>
	<20081124210028.GA32585@uranus.ravnborg.org>
	<20081124135251.51196003@extreme>
	<20081124221232.GA945@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_19_42_57_+1100_zWqYi8qB.IJmxLOR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50634 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752023AbYKYInP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 03:43:15 -0500
In-Reply-To: <20081124221232.GA945@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Hemminger <shemminger@vyatta.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_19_42_57_+1100_zWqYi8qB.IJmxLOR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 24 Nov 2008 23:12:32 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Anyway - I can see that only "cris m68k parisc s390 sparc sparc64 um" lac=
ks

Actually parisc gets it through drivers/parisc/Kconfig.
=20
> the include of drivers/scsi/pcmcia/Kconfig.
> So I will try to add it to drivers/Kconfig in my tree and see it -next
> blows up. I will wait until next -next as I want to see my current
> pending patches there in a clean run first.

I started to do this but then decided that ordering of the includes may
need some thought.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_19_42_57_+1100_zWqYi8qB.IJmxLOR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrupEACgkQjjKRsyhoI8y8WACfc+aGpQiqH95n7uYodWGGwgjH
RIoAnR2+79De8ZdGbRzBASGM88wum04c
=aps6
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_19_42_57_+1100_zWqYi8qB.IJmxLOR--
