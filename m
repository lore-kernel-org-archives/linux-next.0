From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160503 build: 1 failures 12 warnings (next-20160503)
Date: Tue, 3 May 2016 15:17:23 +0100
Message-ID: <20160503141723.GR6292@sirena.org.uk>
References: <E1axZpG-000664-AK@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4ECF1u7dKBoUGhe3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45036 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755669AbcECORv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2016 10:17:51 -0400
Content-Disposition: inline
In-Reply-To: <E1axZpG-000664-AK@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <ray.jui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--4ECF1u7dKBoUGhe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2016 at 01:53:18PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)

caused by b5aa1006e4a93 (pinctrl: ns2: add pinmux driver support for
Broadcom NS2 SoC) - presumably just a missing dependency.

--4ECF1u7dKBoUGhe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXKLLxAAoJECTWi3JdVIfQD0wH/Atknm9kyfSjAX9o2QADQlfJ
UAXTbM79qi9uCpXB0dgGL14cnYTtqvrUZjIVVB0yH387OEdJ43bor6AfJtUjffqi
lTLWWFwB+OTl+KDKISt/G/u1ZYOt761zCYM8uWXfkVHzHFtZhY5JdCLYefGibnUJ
z2pTnHzTdQgjV9zXfF4FhuOXQkSo+IjOFWUOZBbUm/v3KsJdJGmSqptt3duWpYWW
KEQ1FAEMD38LVhBJXxAioH2/9uMhcBku75BYFh4eHLN5aOBCxashTQs8O2L8KkBo
XjpqAfi1HzxqeD2rN55EzIA4qTULihbwyNMLPiw23PKZN5wDrJXO47QLLjCQOcA=
=S1rm
-----END PGP SIGNATURE-----

--4ECF1u7dKBoUGhe3--
