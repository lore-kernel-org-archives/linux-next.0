From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: arm build failure
Date: Mon, 16 Jun 2008 17:37:57 +1000
Message-ID: <20080616173757.4d8ba97a.sfr@canb.auug.org.au>
References: <20080616160747.27909f11.sfr@canb.auug.org.au>
	<20080616072915.GA17191@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_17_37_57_+1000_2QONnGrijW6SnYEh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50352 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752132AbYFPHiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 03:38:04 -0400
In-Reply-To: <20080616072915.GA17191@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Mon__16_Jun_2008_17_37_57_+1000_2QONnGrijW6SnYEh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jun 2008 08:29:16 +0100 Russell King <rmk@arm.linux.org.uk> wrot=
e:
>
> On Mon, Jun 16, 2008 at 04:07:47PM +1000, Stephen Rothwell wrote:
> > Hi Russell,
> >=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> Well, it's going to stay broken for the coming week.  I'm away from
> today.

That's OK, I can keep reverting it (or I may try to figure out what
dependencies it needs).

Thanks for letting me know.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_17_37_57_+1000_2QONnGrijW6SnYEh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhWGFUACgkQTgG2atn1QN9s7wCfY67oN7/LeOpkdr3yxFxyfD7H
PVUAniO+cmTwQ2KV3pkririlWN4lEuiU
=wYtF
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_17_37_57_+1000_2QONnGrijW6SnYEh--
