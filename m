From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] genirq: Export irq_{get,set}_irqchip_state()
Date: Fri, 24 Jul 2015 11:53:14 +0100
Message-ID: <20150724105314.GJ11162@sirena.org.uk>
References: <20150722184015.GA11162@sirena.org.uk>
 <1437594184-22966-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oEsFAYDPGdiJLi6v"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37685 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752076AbbGXKx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2015 06:53:26 -0400
Content-Disposition: inline
In-Reply-To: <1437594184-22966-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Linus Walleij <linus.walleij@linaro.org>


--oEsFAYDPGdiJLi6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2015 at 12:43:04PM -0700, Bjorn Andersson wrote:
> Export these functions to be able to build the Qualcomm family A PMIC
> gpio and mpp drivers as modules.

Reviwed-by: Mark Brown <broonie@kernel.org>

This is breaking the allmodconfig build on at least ARM platforms in
-next, it'd be really good to get it applied.

--oEsFAYDPGdiJLi6v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVshkZAAoJECTWi3JdVIfQg0oH/1UpjppnWSLTfo1cNAZwACMg
YlutZQToxTjPFLRAkZrBNVzTA9RUs1Rd7gdTQyXxsb6e1sNgJ5UO91iou14h+ysQ
1CHKcDklm91GFYFzv817lqTLYqYED24CTzyzAA7TxEYyA/CCOcDUNPDMTzBGKkJu
hG0kgR63LXsnYGCoW7oL2E+NUxLpHaaBYiAkiE1FjHIvIoD4C2LVgACWPHUMTgF1
FscUruGFhRPiIl7eP+h6v2VaRF7j3HStA8rLVbN3ARSc70tAVr6FqhCF/mYQtGl4
PLfjpQwbmDQy0wsLUsry82YdNER25+kn/zBrEvlCVBFy6/oURwRVeoj9834pDcE=
=82Zw
-----END PGP SIGNATURE-----

--oEsFAYDPGdiJLi6v--
