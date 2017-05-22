From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170522 build: 2 failures 7 warnings (next-20170522)
Date: Mon, 22 May 2017 16:06:00 +0100
Message-ID: <20170522150600.ewzu55g4ootbt7tm@sirena.org.uk>
References: <E1dCmcB-0007CC-3W@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ipbdkvjrhejocudr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37406 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934539AbdEVPGT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2017 11:06:19 -0400
Content-Disposition: inline
In-Reply-To: <E1dCmcB-0007CC-3W@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Horman <horms+renesas@verge.net.au>, Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infreadead.org


--ipbdkvjrhejocudr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 22, 2017 at 01:39:11PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build both arm and arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
> ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

> 	arm-allmodconfig
> ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
> ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!

caused by the recent refactoring which created renesas_sdhi_core.c -
those symbols aren't exported.

--ipbdkvjrhejocudr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlki/lcACgkQJNaLcl1U
h9Bsowf9E3D/8NrsWiAzHeBc+PahoeEvLNAslmc9JKz45Pfm3bhmgfaUoxhrzRfP
Ej08sMYNRjzhbvqaHLHoNJql43lxAf2rhmbQGTO2HB8ttsbODCUcs2EpgSS8ib1u
Afqp4Y0miyv38e3cWvVXTuGqSKDDlLw+sC/9f/Mr4nncbA1KhCHo50FAeQwQCh6Q
wDaT1HBvzsbLlLMYg9CmJ22lyS9ZRyxsNnd4pp0dH+YBVz5d9EpfPd5mlDkN37jy
4hZ2ch4TicaifYiLfo+BtQFj/ai+8uCULPCo9gdrqaRh5KGIrTV5xKGYYISJjTIY
dI7BhdD9x96/qnXAs5+0bXQcm29T/w==
=B85o
-----END PGP SIGNATURE-----

--ipbdkvjrhejocudr--
