From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc build failure
Date: Mon, 12 May 2008 17:43:03 +1000
Message-ID: <20080512174303.47d21183.sfr@canb.auug.org.au>
References: <20080512173658.01dc993f.sfr@canb.auug.org.au>
	<20080512.004031.205637810.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_May_2008_17_43_03_+1000_DRUSTuA3xutru8v2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37704 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756046AbYELHnO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 03:43:14 -0400
In-Reply-To: <20080512.004031.205637810.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__12_May_2008_17_43_03_+1000_DRUSTuA3xutru8v2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 12 May 2008 00:40:31 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 12 May 2008 17:36:58 +1000
>=20
> > Seems to have been introduced by commit
> > 28e6103665301ce60634e8a77f0b657c6cc099de ("sparc: Fix debugger syscall
> > restart interactions") which went into Linus' tree recently ("bool" see=
ms
> > to be missing a definition).
>=20
> Fixed in current sparc-2.6.git

OK, thanks ... tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_May_2008_17_43_03_+1000_DRUSTuA3xutru8v2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIJ/UPTgG2atn1QN8RAmlmAKCZBzt/qMs7JESbOk/j9D/q6EGtGACfVOw6
IFS9ZjjrBnPNx5PbuyWTDeo=
=NWYK
-----END PGP SIGNATURE-----

--Signature=_Mon__12_May_2008_17_43_03_+1000_DRUSTuA3xutru8v2--
