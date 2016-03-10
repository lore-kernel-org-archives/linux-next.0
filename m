From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160309 build: 1 failures 12 warnings (next-20160309)
Date: Thu, 10 Mar 2016 15:36:00 +0700
Message-ID: <20160310083600.GO3898@sirena.org.uk>
References: <E1adZjx-00089R-1L@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMHqbYJb993HXwLR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49344 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902AbcCJIgK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2016 03:36:10 -0500
Content-Disposition: inline
In-Reply-To: <E1adZjx-00089R-1L@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Y Vo <yvo@apm.com>, Quan Nguyen <qnguyen@apm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--XMHqbYJb993HXwLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2016 at 08:45:09AM +0000, Build bot for Mark Brown wrote:

Yesterday's -next fails to build on an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ERROR: "irq_chip_eoi_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_chip_unmask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_chip_mask_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_create_hierarchy" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_chip_set_type_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_alloc_irqs_parent" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_set_hwirq_and_chip" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "irq_domain_reset_irq_data" [drivers/gpio/gpio-xgene-sb.ko] undefined!

I can't immediately see when this went wrong, if it was a recent
addition to the driver or a change in the IRQ subsystem (these functions
just aren't exported).  The driver doesn't immediately seem to have been
changed to support modular builds, it could be a dependency.

--XMHqbYJb993HXwLR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW4THaAAoJECTWi3JdVIfQ/SQH+gN8hz0DbhlBeMzIM0Mk6qpm
Ftmd5Ezxu0x5ElKP3QWkimzKNzYLrmNoclI3PO/dgwDQl85VwPpTtUkgZ3W8W6xW
IKrHPs7vK5ikZ+YAI+m9TOLclUhwynEIx/Qjpc9QW5aeuyJdB1NGFUp7lZwseoA/
qP5LPwAI8k4Bnj2T3zOcj8wwa37xCog6kNO+6RwTvN7dWOgEfv9xYknPXqnwhydv
WY/xE6rakaR/Nwsa8Y9n7l5y+hcQB3qsLQmor+WxIeAR2OmhxGXKnHvFxoT4sBIG
BEJpXtZd5yI0zmXFdzmxDiBGlzpd2egInXNiiCcwreu5NZw8mUPEDHNe14GaXiQ=
=n8LV
-----END PGP SIGNATURE-----

--XMHqbYJb993HXwLR--
