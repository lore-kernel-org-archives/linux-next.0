From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 24 Nov 2008 15:49:38 +1100
Message-ID: <20081124154938.bac22cd5.sfr@canb.auug.org.au>
References: <20081124134301.8aebd20f.sfr@canb.auug.org.au>
	<20081123.195602.16120267.davem@davemloft.net>
	<20081124152550.6a06efa4.sfr@canb.auug.org.au>
	<20081123.202847.85900696.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_15_49_38_+1100_o+.r+IChbBN95GWY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37198 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750870AbYKXEtx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 23:49:53 -0500
In-Reply-To: <20081123.202847.85900696.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com

--Signature=_Mon__24_Nov_2008_15_49_38_+1100_o+.r+IChbBN95GWY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 23 Nov 2008 20:28:47 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 24 Nov 2008 15:25:50 +1100
>=20
> > Sorry, no.  If the build failure is caused by an interaction between two
> > trees in linux-next, then I will spend some time trying to fix it up.
> > However, a simple allmodconfig (even on sparc64, I think) build would
> > have shown you the failure *before* publishing your tree.
>=20
> Would not, I do an allmodconfig build on sparc64 before every
> push of the net-next-2.6 tree.

So I wonder what prevents CONFIG_PCMCIA being set on a sparc64
allmodconfig?  Just looking at the Kconfig files, I thought it would, but
obviously not.

It means, of course, that that build doesn't test any of the possible
effects of network changes on the PCMCIA device drivers.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_15_49_38_+1100_o+.r+IChbBN95GWY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqMmIACgkQjjKRsyhoI8yKKgCcDSeVuOy609Xr3wYRNTcMwuCv
3KMAn0FzsN4stFMrcDvVt95lIKQJOPBx
=GvaS
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_15_49_38_+1100_o+.r+IChbBN95GWY--
