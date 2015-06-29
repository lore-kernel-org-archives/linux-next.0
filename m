From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150629 build: 1 failures 74 warnings (next-20150629)
Date: Mon, 29 Jun 2015 18:02:45 +0100
Message-ID: <20150629170245.GI11162@sirena.org.uk>
References: <E1Z9WQC-000356-Bd@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60815 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949AbbF2RDI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2015 13:03:08 -0400
Content-Disposition: inline
In-Reply-To: <E1Z9WQC-000356-Bd@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Andrew Morton <akpm@linux-foundation.org>, Alan Tull <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Kevin Hilman <khilman@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2015 at 11:36:17AM +0100, Build bot for Mark Brown wrote:

> 	arm-allmodconfig
> ../arch/arm/mach-socfpga/pm.c:59:2: error: implicit declaration of function 'dev_get_gen_pool' [-Werror=implicit-function-declaration]

For a short while now -next has been failing to build an ARM
allmodconfig due to a collision between "genalloc: rename
dev_get_gen_pool() to gen_pool_get()" in the akpm tree and "ARM:
socfpga: support suspend to ram" which as been added via the arm-soc
tree and introduces a new use.

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVkXo0AAoJECTWi3JdVIfQyK4H/jz7OtiQXs+74sJgyWHQl8Rh
b02hliF8AnF1zRbSP7a0HZGEfXqncsOI+Aepzy/miY6mHwFECK2rIZ9wmt7tuEiU
tEarLACjC2yzF+Vpud4C4+cZYSTJwKyxlIexlfICQ/jl7bXG7cRWOfe836R39U5Z
EFMB+45ov5av0ZHr4m+jQnNg7ZafGWd5gUyzk6E+yOOOAntmN8adVLqagohv/Taq
buL8x3oehQZHdtosgxwVenvB8KYt/XJ+mUvyjkbj94Rs+UvlTLhyCW+Ykg58hRAt
WmEo37rCgx+dfFM8jxbZOY/Su/nPk052LnEnDxqX3B0Sv0ttP9QqOn3afPe1Vqo=
=/uIi
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--
