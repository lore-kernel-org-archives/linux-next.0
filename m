From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160906 build: 2 failures 0 warnings (next-20160906)
Date: Tue, 6 Sep 2016 11:46:52 +0100
Message-ID: <20160906104652.GJ3950@sirena.org.uk>
References: <E1bhC0l-0003y3-Ls@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HJXn/kF6DSjhJ2mL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35358 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932648AbcIFKrW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2016 06:47:22 -0400
Content-Disposition: inline
In-Reply-To: <E1bhC0l-0003y3-Ls@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jisheng Zhang <jszhang@marvell.com>, Thierry Reding <thierry.reding@gmail.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--HJXn/kF6DSjhJ2mL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 06, 2016 at 09:45:43AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build arm and arm64 defconfigs due to:

> 	arm64-allmodconfig
> ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'

> 	arm-allmodconfig
> ../drivers/pwm/pwm-berlin.c:245:35: error: 'struct berlin_pwm_chip' has no member named 'chips'

due to fd47f104003c6 (pwm: berlin: Add suspend/resume support) which was
applied yesterday.

--HJXn/kF6DSjhJ2mL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCAAGBQJXzp6bAAoJECTWi3JdVIfQB34H/R2hJWOP2weYqUpfioTLM7Oh
g5Nlu4WHdfTju0O7sHq74y3D9vVpDnj9k7TexMizhYJRJW/Yry2kKhFdtBhuhi3Q
sxIX/vZKU/e6ErKct3+Yo0wsFASa3Mr2GkB2welhr29tXCFP1FiIzPbmsGpp0WTi
L+TdIW2b3KedUl76M3CeXjmPAhsAcszJUzHWmSgXb2dRXTPQXI8xrjRfLeLNwfRI
xbbKULz2OS7DxAdfHMUl/GoVZLMeBAzxJHMsadnGVJQM3ekwc3tKQRH9pfp9md7g
we963RoZ60aiuyYhVcHUlci5xf0i7lRbL+lVu34V4muBAFLrDd11ThXQORphbq8=
=etzl
-----END PGP SIGNATURE-----

--HJXn/kF6DSjhJ2mL--
