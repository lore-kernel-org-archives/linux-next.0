From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160217 build: 3 failures 14 warnings (next-20160217)
Date: Wed, 17 Feb 2016 11:22:25 +0000
Message-ID: <20160217112225.GM7544@sirena.org.uk>
References: <E1aVxTQ-0000zq-U4@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DXIF1lRUlMsbZ3S1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41718 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161157AbcBQLWi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2016 06:22:38 -0500
Content-Disposition: inline
In-Reply-To: <E1aVxTQ-0000zq-U4@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--DXIF1lRUlMsbZ3S1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 17, 2016 at 08:28:37AM +0000, Build bot for Mark Brown wrote:

> 	arm64-allmodconfig
> ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!

The fsl-mc code is still breaking the build in -next, can we please drop
the code or mark the driver as built in only until the MSI symbol
exports are available?  This is making it difficult to spot other
errors.

--DXIF1lRUlMsbZ3S1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWxFfwAAoJECTWi3JdVIfQI1cH/iCNOteHNaJLlhQ8DhCeiNz2
gZmJePN5jqq0+O7CH0L7uMmU2I5WV9BfJShlds/cNwkF2gS9K5YF3WHC/zcNZ4PD
QhYaeg3ZKMm3z3edQ8c9b+NDFRVI3pZ5F3bK8oLnBXv8pK4xpVbf3BxbwXvecEo4
mrCO0mlgvuVtUOWt66dvbaygP/DSsLpsdByPed37f5N/GrQ8N3phF7fAOAKz71Cd
m5c10x17VmQ5CNaF77aawtbhzWNaxl1IkZxxH8GIs3sTUTMCpguRyDHs7DeQNfwO
+jBu7eWKnGebgOkPbjAsS5Ejbnf2bT+vPsYIL6kijWcwpsIYO8xWjo3opPSGimw=
=kWwH
-----END PGP SIGNATURE-----

--DXIF1lRUlMsbZ3S1--
