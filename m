From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rcu and locking trees unfetchable
Date: Tue, 27 May 2008 10:50:00 +1000
Message-ID: <20080527105000.fba52913.sfr@canb.auug.org.au>
References: <20080526135444.f7cb038d.sfr@canb.auug.org.au>
	<20080526083833.GA24419@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_May_2008_10_50_00_+1000_HhEjRk7MHZ7sG7.i"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52919 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753604AbYE0AuW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 May 2008 20:50:22 -0400
In-Reply-To: <20080526083833.GA24419@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Tue__27_May_2008_10_50_00_+1000_HhEjRk7MHZ7sG7.i
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 26 May 2008 10:38:33 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> -tip tree is undergoing restructuring, the new branch structure is:
>=20
>   auto-ftrace-next            [ relative to auto-ftrace-next-base ]
>   auto-sched-next             [ relative to auto-sched-next-base  ]
>   auto-x86-next               [ relative to auto-x86-next-base    ]
>=20
> rcu got renamed to "core/rcu" - that will likely grow a -next postfix as=
=20
> well. Locking got renamed to "core/locking" - that too will likely get a=
=20
> -next topic branch as well. (but please use core/rcu and core/locking in=
=20
> the meantime)

OK, set up for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_May_2008_10_50_00_+1000_HhEjRk7MHZ7sG7.i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIO1q9TgG2atn1QN8RAm/fAKCQGZU2A9pZwkFXbGEB61RyJLby3ACfUlxD
lmbPDmvSmHpUz/kYrWMh1D4=
=MH2g
-----END PGP SIGNATURE-----

--Signature=_Tue__27_May_2008_10_50_00_+1000_HhEjRk7MHZ7sG7.i--
