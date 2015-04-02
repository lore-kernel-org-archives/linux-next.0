From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150402 build: 3 failures 18 warnings (next-20150402)
Date: Thu, 2 Apr 2015 12:22:31 +0100
Message-ID: <20150402112231.GQ6023@sirena.org.uk>
References: <E1YdaYh-0000LL-D5@debutante>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0pkK7MCEo5hACTvx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49756 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751772AbbDBLWs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2015 07:22:48 -0400
Content-Disposition: inline
In-Reply-To: <E1YdaYh-0000LL-D5@debutante>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <treding@nvidia.com>, Paul Walmsley <paul@pwsan.com>, Mike Turquette <mturquette@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--0pkK7MCEo5hACTvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2015 at 09:33:03AM +0100, Build bot for Mark Brown wrote:

> Failed defconfigs:
> 	arm64-allmodconfig

For the past few days -next has been failing to build an arm64
allmodconfig due to:

| drivers/built-in.o: In function `tegra124_132_clock_init_post':
| :(.init.text+0x285d8): undefined reference to `tegra_emc_init'

This is triggered by d035fdfa27ac124bc8 (arm64: Add Tegra132 support)
which enables ARCH_TEGRA and ARCH_TEGRA_132_SOC for arm64 which in turn
causes clk-tegra124 to be built on arm64.  That driver relies on
TEGRA124_EMC but that depends on ARCH_TEGRA_124_SOC which is 32 bit
only.

We either need the EMC driver for Tegra132, a stub or some ifdefs.

It also looks like there's an issue if the memory controller driver is
not enabled (which looks to be something that can be controlled by the
user) but I've not checked properly.

--0pkK7MCEo5hACTvx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVHSZ3AAoJECTWi3JdVIfQw3MH/29js0up8nDYbee4lrvAm8J6
j8Djl6NAtectM4qsmaQk2iEzHAe7DIFG/4UX7flGlp1Jdh6E+qQUflgGb1FqAzUX
OQmxyXWI/gbQyZXH+Z01lPd/LocKj8zraesvLwo4Bql+r20EsxBVKhZE//aiH+jy
V9WoA4+WiUK18uKaZCxgDQmgzQnHzjDplJbPiJWfA/nSyTbtUSJallOJbV8KJ6WU
KEvxqYxGX4jHeHE+VLNzCi8u7hcc6UdSFW8ejJ3rmd8HMrNCerLdswb6mN0+m7tX
A9bB0SMwLDyYgNxmWZhQChxcbbNZwshFYt78g1IGGCXjuMKhEEeUD/bFc3jz7ec=
=o3+L
-----END PGP SIGNATURE-----

--0pkK7MCEo5hACTvx--
