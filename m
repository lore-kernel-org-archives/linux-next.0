From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Tests tree not submitted?
Date: Mon, 19 May 2008 16:39:08 +1000
Message-ID: <20080519163908.0cf00b1d.sfr@canb.auug.org.au>
References: <20080519135436.34d6d593.sfr@canb.auug.org.au>
	<20080519043822.GA3473@in.ibm.com>
	<20080518220003.5169892a.akpm@linux-foundation.org>
	<20080519153704.b0c9cb2d.sfr@canb.auug.org.au>
	<20080519063027.GA17529@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_16_39_08_+1000_GJrbjz.ES8cgPdC_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46942 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755101AbYESGjR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 02:39:17 -0400
In-Reply-To: <20080519063027.GA17529@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, ananth@in.ibm.com, linux-next@vger.kernel.org

--Signature=_Mon__19_May_2008_16_39_08_+1000_GJrbjz.ES8cgPdC_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam, Ananth,

On Mon, 19 May 2008 08:30:27 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Andrew mumbled about taking these patches via kbuild.it and in order to
> avoid that I created a new test.git tree that I then have not given any c=
are since.
>=20
> Anath - I can update test.git if you send me a new patch-set but otherwise
> I cannot do much work on it.
> Too busy with other stuff.

It might be better if it can go in as is and then fix patches applied
after that.  That gets the infrastructure in and it is certainly not
causing any problems as far as I can see.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_16_39_08_+1000_GJrbjz.ES8cgPdC_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMSCRTgG2atn1QN8RAuMmAJwOYIlrsC5zMI0DV3hBLZgjhl7KPgCfRPTG
LeDAJwrnC0KLjLPgm8ELlb0=
=R94t
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_16_39_08_+1000_GJrbjz.ES8cgPdC_--
