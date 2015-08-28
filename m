From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 28 Aug 2015 16:45:56 +0100
Message-ID: <20150828154556.GO12027@sirena.org.uk>
References: <20150828115041.037554b4@canb.auug.org.au>
 <alpine.DEB.2.02.1508280936240.16666@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eB5okr78BIEWepnS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40226 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751505AbbH1Pqu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2015 11:46:50 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1508280936240.16666@lnxricardw1.se.axis.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--eB5okr78BIEWepnS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 09:40:41AM +0200, Ricard Wanderlof wrote:
> On Fri, 28 Aug 2015, Stephen Rothwell wrote:

> In fact the exact same construct is used by a handful of other codec=20
> drivers which apparently don't fail.

> I'm suspecting something slightly more convoluted like a missing #include=
 .

No, the issue is that you have used a different variable name when
declaring the IDs and when referencing them in the module device table.

--eB5okr78BIEWepnS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV4IIwAAoJECTWi3JdVIfQsokH/jwHART1AUtMKyOmCruEkF4y
AQioKzSFBpKhTWn+weachOnYrAFOTLvGq7bdrVVmb0D+3IW+B1WfYKN+ecDpo5T6
8O9xYfSV0SA8OaLY61NNJZyvFqtGmB6Rfs9E9YEcNyulJxenF+EEBZk594OmJalv
///Vhz9I4cKf7kJeyd0JDGT+1b0smiZo8aCpRo80MSN+344+KEJ05bV0m6L0S8cy
+hOQcWWrv9bPDC0b0YLXmCrDyDKXxgvl+0GgHJndRW5btWqWVgnbUhXhETGvOOtI
/WZ1bOSMNzhSD0rZVqwnt+IPywJ1KxoSFDfpTrf8xX0LroQlpg4Je2SEfgtAezA=
=8NRm
-----END PGP SIGNATURE-----

--eB5okr78BIEWepnS--
