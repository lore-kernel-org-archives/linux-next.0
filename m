From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 21:07:32 +0100
Message-ID: <20150831200732.GT5313@sirena.org.uk>
References: <20150831195420.371e8849@canb.auug.org.au>
 <20150831141736.GA19616@roeck-us.net>
 <20150831163103.2e13b301@arm.com>
 <55E476FB.2040208@roeck-us.net>
 <20150831171807.27d78ff0@arm.com>
 <55E4838B.5000500@roeck-us.net>
 <20150831180922.4392875e@arm.com>
 <20150831192657.557e45cc@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eEYjL7b2m+/uQ8dh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46065 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbbHaUHu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 16:07:50 -0400
Content-Disposition: inline
In-Reply-To: <20150831192657.557e45cc@why.wild-wind.fr.eu.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>, Markus Pargmann <mpa@pengutronix.de>


--eEYjL7b2m+/uQ8dh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 07:26:57PM +0100, Marc Zyngier wrote:

> which never considers bus to be NULL in __regmap_init. With the
> following patch applied, I can boot to a prompt:
>=20
> From 031eae5a1b34f952ba3dcaecb4eb4ec9d3bda352 Mon Sep 17 00:00:00 2001

> From: Marc Zyngier <marc.zyngier@arm.com>
> Date: Mon, 31 Aug 2015 19:16:16 +0100
> Subject: [PATCH] regmap: Fix max_raw_read/write handling when bus is NULL

Please submit patches using the process documented in SubmittingPatches,
don't bury them in the middle of a reply to some random other thread
where they can't be applied without handholding :(

> -	map->max_raw_read =3D bus->max_raw_read;
> -	map->max_raw_write =3D bus->max_raw_write;
> +	map->max_raw_read =3D bus ? bus->max_raw_read : 0;
> +	map->max_raw_write =3D bus ? bus->max_raw_write : 0;

A more legible version of this patch was already applied.

--eEYjL7b2m+/uQ8dh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV5LQAAAoJECTWi3JdVIfQvTAH+wdjePMkOln9pn2r+IhERHwc
qVseOyH1w5wTnl+lwIz99BcRN5lsMXL/0TYnML7dwwsIZ+WQSS9ztRqQN4K5GFKJ
h2iiKnenYlKMnNJEZqrjW3FeJZinfwJe5oDK3dEXD025hFAKllSAJkgxuGiSPE7N
oxuLIxRm08XkhQbAVxgkJJJR8cmPwVHJpRpd2RWCy+oo7i6Ncd4nGTT+AHkoNXHc
rLy3VU4cfHJVMfcjv82XgFmry88OlPYcM57zfN035ocx07FysG13Lg15Y+ZYl+e5
ubM8tljWSMAERJwUTwZF4pjQM7o1/zCU9jc0YDJH7QmAHo8K08FZ+bKVV/u8VAE=
=kRGC
-----END PGP SIGNATURE-----

--eEYjL7b2m+/uQ8dh--
