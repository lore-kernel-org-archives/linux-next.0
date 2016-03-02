From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Wed, 2 Mar 2016 13:00:00 +0900
Message-ID: <20160302040000.GX18327@sirena.org.uk>
References: <20160229145122.71636c6b@canb.auug.org.au>
 <87a8mjj8wc.wl%kuninori.morimoto.gx@renesas.com>
 <878u23j85t.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ImlueIRSpq8lZ71A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51222 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbcCBEAH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 23:00:07 -0500
Content-Disposition: inline
In-Reply-To: <878u23j85t.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--ImlueIRSpq8lZ71A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2016 at 01:35:58AM +0000, Kuninori Morimoto wrote:

> I noticed that you reborned regmap_write_bits() on your latest tree.
> I think using/adding regmap_force_update_bits() is good idea IMO.
> Can I create such patch ?

It might make more sense to rename _force_update_bits() to
_write_bits().

--ImlueIRSpq8lZ71A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1mUyAAoJECTWi3JdVIfQ4M8H/3NTJxEkUawVnLq1BL+DJHQQ
Z5NZH8EhpDLpx210gWL+lsMMgxUy3PJze01i+q7iXTL4jort4mzNbh9YjsMPNdq2
Xza0mk8gBiPajNqy19C1FJc+WXpePmNzF0I7iVy5I9L4tsPmCJ7SDhOU4LmfOZir
PLBwH6ILaxPZxEKQl1ZuCoVlt51g0VlwuzrdnCKkKrDpMM+rN0KlV9TylY5nmcZ5
OLFJl4vXJUzH1DNFU3Meyph86Ub/4/rg7PX1rnTVCmT2883XfDtZm0n3UJKK+uYc
SGgK65iUXUlSKx5HtNUkIX2kumbG2ZnTSbZZPxUXGE1+YWdINlNFDOIXs3uGRGk=
=rrfF
-----END PGP SIGNATURE-----

--ImlueIRSpq8lZ71A--
