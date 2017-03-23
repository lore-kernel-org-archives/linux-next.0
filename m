From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170323 build: 2 failures 4 warnings (next-20170323)
Date: Thu, 23 Mar 2017 11:02:49 +0000
Message-ID: <20170323110249.3tf3tjo6c2y5qbkh@sirena.org.uk>
References: <E1cqxc1-0004Cs-Lx@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="odiiwfiwymmb37rl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38140 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751170AbdCWLDE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2017 07:03:04 -0400
Content-Disposition: inline
In-Reply-To: <E1cqxc1-0004Cs-Lx@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--odiiwfiwymmb37rl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2017 at 07:56:49AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig and defconfig due to:

> 	arm64-allmodconfig
> 	arm64-defconfig
> ERROR (phandle_references): Reference to non-existent node or label "pwm_f_clk_pins"
> ERROR (phandle_references): Reference to non-existent node or label "pwm_ao_a_3_pins"
> ERROR: Input tree has errors, aborting (use -f to force output)

The offending references are in 3224eaca966088b4cf4f1ca3 (ARM64: dts:
meson-gxl: add support for the Khadas VIM board), there doesn't seem to
be anything providing those phandles in either mainline or -next.

--odiiwfiwymmb37rl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljTq1UACgkQJNaLcl1U
h9CYrQf/Wph5pa4nnyVyE4EPtHeTiyCVB5Yux/XsOdUtIKizAv7kxWfYgMEyX3T2
SCTD7XbZy9IU0PaHMWr6M75VKQ6mNFiEQlBMw2BIW9sYsBzvXz+HhbfegLW6ZvRO
hHTB98uDUSW7aKzw1w7ZAKqdvFmXDR2mUnaDmoVaae7OtvBxjndpbERI3jPmThB+
KJLMvCYmaTlG3p7YlM0f9SC2CIauhVxz6f4/MmlatEmRjxsxQ3raUbJDDPtACmEk
aynP/0uFMHPcoITA7Dzamf5wjmi+19SW6SbEz/ELcmbzz8i1B42KgD6/9R4hV8wz
NNii3BbyfeyjFNsJ2sadyZLf6NSdBg==
=78MC
-----END PGP SIGNATURE-----

--odiiwfiwymmb37rl--
