From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150722 build: 2 failures 75 warnings (next-20150722)
Date: Wed, 22 Jul 2015 19:40:15 +0100
Message-ID: <20150722184015.GA11162@sirena.org.uk>
References: <E1ZHv2t-0004JI-0H@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Iu0Tl93s8YP0EGMr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35083 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154AbbGVSkX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2015 14:40:23 -0400
Content-Disposition: inline
In-Reply-To: <E1ZHv2t-0004JI-0H@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--Iu0Tl93s8YP0EGMr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2015 at 03:30:56PM +0100, Build bot for Mark Brown wrote:

For the past couple of days linux-next has failed to build an ARM
allmodconfig due to:

> ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-mpp.ko] undefined!
> ERROR: "irq_get_irqchip_state" [drivers/pinctrl/qcom/pinctrl-ssbi-gpio.ko] undefined!

This is due to b4c45fe974bc5f (pinctrl: qcom: ssbi: Family A gpio & mpp
drivers) and b4c45fe974bc (pinctrl: qcom: ssbi: Family A gpio & mpp
drivers).  That function isn't exported so can't be used from modules, I
expect the fix is to add the apprpriate exports.

--Iu0Tl93s8YP0EGMr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVr+OOAAoJECTWi3JdVIfQgRsH/ArlS6NCArc/+2BzJcNrtIP1
8lmJwHrw3sBz2IMJOFLATec95e9ZrCsgdJvstSBfaaAXc32VK4nOEWzBwxLpJhrl
m2FR/VeVD9euihNBo8GjBnG1mhSPfRDIZWbSttIUn6mOsmzF2JotcsMy+wg1zPFy
jdC0dcN/3DR9Pffsvzvsg9JDsRFUNf2teIyiXwQOXnqSDW8MKLqBghI/Nmzh9+hC
fkAqoteL4n9Ey3L23fxH+I6TJAnB9cNTaEyhvpWPHjioYkYTaiFqlmSMC0jz+ocD
3FqlL7zmQcLOMssUlpYxbm2Aw5wJBNedzdxI49WdPwtp7t5zXo7TnHryqKzCVu0=
=Zq1j
-----END PGP SIGNATURE-----

--Iu0Tl93s8YP0EGMr--
