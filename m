From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for November 23
Date: Tue, 24 Nov 2009 10:36:41 +1100
Message-ID: <20091124103641.abd7bd6b.sfr@canb.auug.org.au>
References: <20091123185232.1423c56b.sfr@canb.auug.org.au>
	<20091123111510.9b0c0714.randy.dunlap@oracle.com>
	<200911240924.54675.rusty@rustcorp.com.au>
	<4B0B1507.4060202@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Nov_2009_10_36_41_+1100_osLQJYXzLdPmCazz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42053 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757328AbZKWXgk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 18:36:40 -0500
In-Reply-To: <4B0B1507.4060202@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Tue__24_Nov_2009_10_36_41_+1100_osLQJYXzLdPmCazz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 23 Nov 2009 15:04:39 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> I decided to check on linux-next (only checked x86_64 allmodconfig),
> and viola:
>=20
> CONFIG_STAGING=3Dy
> CONFIG_STAGING_EXCLUDE_BUILD=3Dy
>=20
> That is just too helpful.  :(

The Kconfig was deliberately done so that the all{no,yes,mod}config
builds don't build the staging stuff.  You need to explictly ask for it.
Otherwise I would spend all my time reporting/fixing errors and warnings
in linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Nov_2009_10_36_41_+1100_osLQJYXzLdPmCazz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksLHIkACgkQjjKRsyhoI8yD1QCfdJDz8ggbvVrqqCQDdVWQ879g
o+sAn2InPfaA8/hvvGS/rgMgOIFCKkay
=lEvm
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Nov_2009_10_36_41_+1100_osLQJYXzLdPmCazz--
