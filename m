From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 24 Nov 2008 16:38:44 +1100
Message-ID: <20081124163844.004469a6.sfr@canb.auug.org.au>
References: <20081124154938.bac22cd5.sfr@canb.auug.org.au>
	<20081123.210452.160784844.davem@davemloft.net>
	<20081124162044.f3333fcf.sfr@canb.auug.org.au>
	<20081123.212339.131214270.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_16_38_44_+1100_iWaae2am00z7IVG+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57199 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750719AbYKXFjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:39:08 -0500
In-Reply-To: <20081123.212339.131214270.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com, sam@ravnborg.org

--Signature=_Mon__24_Nov_2008_16_38_44_+1100_iWaae2am00z7IVG+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Nov 2008 21:23:39 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Probably it didn't build for some obscure reason a long time
> ago.  I'll try to get it turned back on, but better is to
> bring it in via drivers/Kconfig don't you think? :-)

Only if you test build all the other architectures that currently don't
include it. :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_16_38_44_+1100_iWaae2am00z7IVG+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqPeQACgkQjjKRsyhoI8zEZwCgt7vhI8ogf476qhwRNgbDZuKm
bQ8AniMAsLU8ae/8mXYuPiKQXyutwRQ8
=ezsy
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_16_38_44_+1100_iWaae2am00z7IVG+--
