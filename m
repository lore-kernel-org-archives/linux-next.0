From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: acpi/cpus4096 merge conflict
Date: Fri, 13 Jun 2008 17:42:23 +1000
Message-ID: <20080613174223.66174672.sfr@canb.auug.org.au>
References: <20080612135032.b5d0c684.sfr@canb.auug.org.au>
	<alpine.LFD.1.10.0806120045320.12191@localhost.localdomain>
	<20080612121824.GA26504@elte.hu>
	<20080613012544.b06605b7.sfr@canb.auug.org.au>
	<48516B74.4070902@sgi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_17_42_23_+1000_0OOwqxxKd3ohiZPG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43551 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753562AbYFMHmb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 03:42:31 -0400
In-Reply-To: <48516B74.4070902@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Ingo Molnar <mingo@elte.hu>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__13_Jun_2008_17_42_23_+1000_0OOwqxxKd3ohiZPG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 12 Jun 2008 11:31:16 -0700 Mike Travis <travis@sgi.com> wrote:
>=20
> Sounds like a good idea ... I'll try to restructure future patches so the
> common code can be pushed separately and has minimal effect on the base c=
ode.
> Are there any git options to add a "dependency check" to insure that pare=
nt
> patches are in place?

None that I know of.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_17_42_23_+1000_0OOwqxxKd3ohiZPG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhSJN8ACgkQTgG2atn1QN9dlwCgmxyJ9jPlWW1ijj7WTV80dBIa
tuYAni8GbtialdN5gNQBSoi5mu6fIzIy
=D4GS
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_17_42_23_+1000_0OOwqxxKd3ohiZPG--
