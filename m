From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Wed, 5 May 2010 12:37:54 +1000
Message-ID: <20100505123754.16228b09.sfr@canb.auug.org.au>
References: <20100427141224.834a102a.sfr@canb.auug.org.au>
	<20100427151305.GA7653@kroah.com>
	<20100428161425.eff4c40a.sfr@canb.auug.org.au>
	<20100428152809.GF4483@kroah.com>
	<20100503161721.GW9489@distanz.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_May_2010_12_37_54_+1000_cfE+PyVs=l420vaY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53235 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757639Ab0EECiB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 May 2010 22:38:01 -0400
In-Reply-To: <20100503161721.GW9489@distanz.ch>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__5_May_2010_12_37_54_+1000_cfE+PyVs=l420vaY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tobias,

On Mon, 3 May 2010 18:17:21 +0200 Tobias Klauser <tklauser@distanz.ch> wrot=
e:
>
> I just built the current linux-next (20100503) with the patches applied
> (including Greg's Kconfig change) on x86_64 with allmodconfig and wasn't
> able to reproduce the build failure.
>=20
> Any pointers on how to reproduce and/or fix this would be appreciated.

Of course, if you force this driver to be built in (as Greg's Kconfig
change presumably did), then you won't get these errors.

The real solution is that SERIAL_ALTERA_JTAGUART_CONSOLE needs to depend
on SERIAL_ALTERA_JTAGUART=3Dy (instead of just SERIAL_ALTERA_JTAGUART) and
similarly for the other.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_May_2010_12_37_54_+1000_cfE+PyVs=l420vaY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvg2gIACgkQjjKRsyhoI8xuZACggL0kNbcfTjM6xq05vd8WftRZ
53EAn1IZhqnqnGOeAhT4PFc3P1M+y5wn
=zB5Z
-----END PGP SIGNATURE-----

--Signature=_Wed__5_May_2010_12_37_54_+1000_cfE+PyVs=l420vaY--
