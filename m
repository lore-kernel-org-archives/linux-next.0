From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kmemcheck tree
Date: Mon, 1 Jun 2009 17:55:44 +1000
Message-ID: <20090601175544.880ae0b4.sfr@canb.auug.org.au>
References: <19f34abd0905300902g3e962867sa4fc9dbc40f4c2a2@mail.gmail.com>
	<20090531151924.e5b02b93.sfr@canb.auug.org.au>
	<19f34abd0905311521s66174002n7736e4b058415d3c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Jun_2009_17_55_44_+1000_Ge9eOPQ_1xyq0r1S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43775 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755504AbZFAILS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 04:11:18 -0400
In-Reply-To: <19f34abd0905311521s66174002n7736e4b058415d3c@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org

--Signature=_Mon__1_Jun_2009_17_55_44_+1000_Ge9eOPQ_1xyq0r1S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vegard,

On Mon, 1 Jun 2009 00:21:58 +0200 Vegard Nossum <vegard.nossum@gmail.com> w=
rote:
>
> The one we used before -- auto-kmemcheck-next. And so sorry, I didn't
> realize this hadn't been updated yet. Ingo?
>=20
> You can probably wait, then, I think.

I used the kmemcheck branch for today - I think it needs exposure as
early as possible.

> Yes, I tried it myself too. Nothing very tricky, I guess, for you.
> Just in case, here's what my version ended up looking like:
>=20
> http://folk.uio.no/vegardno/kmemcheck-next-merge.txt

I did some of the fixups a bit differently - see my other emails.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Jun_2009_17_55_44_+1000_Ge9eOPQ_1xyq0r1S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkojiYAACgkQjjKRsyhoI8xFkACgiYzTZloZ+ngtvuJ3gFT3Rkdx
x48An0Je5KgcPVN6q61g8iuLiYNJeuBG
=B00v
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Jun_2009_17_55_44_+1000_Ge9eOPQ_1xyq0r1S--
