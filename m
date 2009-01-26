From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Mon, 26 Jan 2009 16:15:23 +1100
Message-ID: <20090126161523.3be36393.sfr@canb.auug.org.au>
References: <20090126135307.e4630fc7.sfr@canb.auug.org.au>
	<20090125.204623.137022547.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jan_2009_16_15_23_+1100_Th=2/1Sik3OnNr20"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49257 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750714AbZAZFPb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jan 2009 00:15:31 -0500
In-Reply-To: <20090125.204623.137022547.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

--Signature=_Mon__26_Jan_2009_16_15_23_+1100_Th=2/1Sik3OnNr20
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 25 Jan 2009 20:46:23 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 26 Jan 2009 13:53:07 +1100
>=20
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >=20
> > ERROR: "com20020_netdev_ops" [drivers/net/arcnet/com20020-pci.ko] undef=
ined!
> >=20
> > We are not winning with this one :-(
>=20
> I don't understand this.  If I mark it extern, as I did, it
> should only be defined in one object file.

It needs an EXPORT_SYMBOL() where it is defined (in com20020.c).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jan_2009_16_15_23_+1100_Th=2/1Sik3OnNr20
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl9RusACgkQjjKRsyhoI8zZQACgvk6qgb/t1ifb6R3SndaCmVCI
1iwAoJP1S8sXv1IF/pvbxqRMc1UL59CO
=s5iV
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jan_2009_16_15_23_+1100_Th=2/1Sik3OnNr20--
