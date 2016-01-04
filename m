From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160104 build: 3 failures 15 warnings (next-20160104)
Date: Mon, 4 Jan 2016 15:35:02 +0000
Message-ID: <20160104153502.GK16023@sirena.org.uk>
References: <E1aG3zo-0000gt-2t@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ef8eQmdvO1j1gFMO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35582 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344AbcADPfR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2016 10:35:17 -0500
Content-Disposition: inline
In-Reply-To: <E1aG3zo-0000gt-2t@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pi-Cheng Chen <pi-cheng.chen@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--ef8eQmdvO1j1gFMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 04, 2016 at 12:12:20PM +0000, Build bot for Mark Brown wrote:

Today's linux-next fails to build for arm64 due to 44d3d051253 (ARM64:
dts: mt8173: Add CPU OPP, clock and regulator supply properties) in one
of Raphael's trees:

> 	arm64-allmodconfig
> Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error
> Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

> 	arm64-defconfig
> Error: ../arch/arm64/boot/dts/mediatek/mt8173.dtsi:132.24-25 syntax error

which is failing because at least CLK_INFRA_CA53SEL is used but never
defined, presumably there is some dependency which wasn't integrated.
Normally we merge DT changes via the architecture to help avoid these
issues.

--ef8eQmdvO1j1gFMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWipEmAAoJECTWi3JdVIfQM3AH/0Gu8yA8KnwEztZ6S4PPJJdL
xd4En/eve63e8ptz3wt5yUSWLGTYPTOJx/y4b3NG4T5NkELt33MhLJMekesy9AxI
gRctntKxnA01cZxwxv0SVbCo1suiYrQPqFbtJz1WO+dPD7Dr2b7rcs0sBvHQF6k/
0hpuKtzAaH0GzeZylyqb5+24B5rWHIHH1tvyLAPh+0ZIyy443yA92ILamUwtMv3f
Nx3GcOKu/OkmeaMX4KdnjKy0ZVWjpeG6c6YdgOEpKAWZsgQ3BR0I68TVQfZj9k8N
DWytsewJoMrK3DRBeNXZTen2da0pQs9HHjLkmRJ85CIV0hBmN8alo6/nbrxwYNs=
=t7nZ
-----END PGP SIGNATURE-----

--ef8eQmdvO1j1gFMO--
