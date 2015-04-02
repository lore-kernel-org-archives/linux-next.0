From: Mark Brown <broonie@kernel.org>
Subject: ARM allmodconfig build failures in -next
Date: Thu, 2 Apr 2015 11:48:21 +0100
Message-ID: <20150402104821.GO6023@sirena.org.uk>
References: <E1YdaYh-0000LL-D5@debutante>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aTCJOP0qgkSGqHWA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49580 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210AbbDBKsp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2015 06:48:45 -0400
Content-Disposition: inline
In-Reply-To: <E1YdaYh-0000LL-D5@debutante>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tsahee Zidenberg <tsahee@annapurnalabs.com>, Barak Wasserstrom <barak@annapurnalabs.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--aTCJOP0qgkSGqHWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 09:33:03AM +0100, Build bot for Mark Brown wrote:

> Failed defconfigs:
> 	arm-allmodconfig

For the past few days ARM allmodconfig has been failing to build in
-next due to 841990b6b3e2cfc0b (ARM: dts: Alpine platform devicetree)
=66rom the arm-soc tree.  This adds a Makefile fragment building
alpine_db.dtb but adds the DTS file as alpine-db.dts instead.

--aTCJOP0qgkSGqHWA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVHR51AAoJECTWi3JdVIfQXn4H/0gaxi0vCPrATkB3WSY37Vi7
ec1IgeYwRcYGz64me7QFDzIjfaxamttTZtBzAe2vIjRVmY7r+fxghbQ64igyqp/i
LJ8CK1JyYOpqjTZHUhbZCBRmD6LT1OLe4/BWC8K3dx0z+s3ZJlSXGzsb9cpb746D
ry2bm7JidPobYM6YnpxWuxg6FhUg6Pxv+WaTyuGqMG45tnfRCEVPrsEwVB+10kva
/sbgeFFx2/ssRAjX4fk2JlDOKtPwQ2EIp+tqgYTRzJP5U+7RThAqyIrRVGoGCzhL
VrRThT3vCiD1eaCOAY4rvkPGqm7KcRk60YWtfiJ8lVt0ouANUa6xHogKhlTR4L8=
=35qr
-----END PGP SIGNATURE-----

--aTCJOP0qgkSGqHWA--
