From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: frimware build failure
Date: Sat, 7 Jun 2008 15:11:49 +1000
Message-ID: <20080607151149.91f91477.sfr@canb.auug.org.au>
References: <20080605172512.e000ddc5.sfr@canb.auug.org.au>
	<1212652090.32207.159.camel@pmac.infradead.org>
	<20080605175941.5520add5.sfr@canb.auug.org.au>
	<319e1e066fdd3a977c0f23be13a38346@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__7_Jun_2008_15_11_49_+1000_9dVw8H1SekbMLjn4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33312 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751709AbYFGFL7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 7 Jun 2008 01:11:59 -0400
In-Reply-To: <319e1e066fdd3a977c0f23be13a38346@kernel.crashing.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Sat__7_Jun_2008_15_11_49_+1000_9dVw8H1SekbMLjn4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Segher,

On Sat, 7 Jun 2008 02:42:07 +0200 Segher Boessenkool <segher@kernel.crashin=
g.org> wrote:
>
> The GAS code shows the same: only ARM is affected currently.
>=20
> Incidentally, all GAS targets accept both "@" and "%" as the
> character before progbits etc. -- but please don't use "%"
> universally, since it could be a comment character on some archs
> as well [1] (or break in some other way).

Thanks for the confirmation and warning.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__7_Jun_2008_15_11_49_+1000_9dVw8H1SekbMLjn4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhKGJUACgkQTgG2atn1QN9oDACfZ24whfWzWbc8QazdRwSB5ssV
c4cAnRwaQWncVDwQkS7xv+d2MZ10ukja
=K2Mw
-----END PGP SIGNATURE-----

--Signature=_Sat__7_Jun_2008_15_11_49_+1000_9dVw8H1SekbMLjn4--
