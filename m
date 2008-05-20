From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bkl-removal build failure
Date: Tue, 20 May 2008 13:26:20 +1000
Message-ID: <20080520132620.558e54c8.sfr@canb.auug.org.au>
References: <20080519163203.89a54b82.sfr@canb.auug.org.au>
	<4642.1211217165@vena.lwn.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_May_2008_13_26_20_+1000_C0XVaETIz.tKpqVO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756870AbYETD02 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 23:26:28 -0400
In-Reply-To: <4642.1211217165@vena.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__20_May_2008_13_26_20_+1000_C0XVaETIz.tKpqVO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Mon, 19 May 2008 11:12:45 -0600 corbet@lwn.net (Jonathan Corbet) wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >=20
> > drivers/char/viotape.c: In function 'viotap_open':
> > /scratch/sfr/next/drivers/char/viotape.c:692: error: expected ';' befor=
e 'get_dev_info'
>=20
> Well, that's embarrassing.  There are limits to what can be done with
> "make allyesconfig" when you only have one architecture at hand...:)

Welcome to life with the big boys :-)

> I've put your fix into my tree, thanks and sorry for the trouble.

OK, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_May_2008_13_26_20_+1000_C0XVaETIz.tKpqVO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMkTgTgG2atn1QN8RAh6mAKCP6fhiTQQUZOOmksB2A95/bPSFlgCfcBuM
1iJ6h8VjQuk1l9tYs2EV0RI=
=6Viu
-----END PGP SIGNATURE-----

--Signature=_Tue__20_May_2008_13_26_20_+1000_C0XVaETIz.tKpqVO--
