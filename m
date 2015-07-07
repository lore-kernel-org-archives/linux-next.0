From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulators: Add missing dummy definition for
 regulator_list_voltage
Date: Tue, 7 Jul 2015 13:38:38 +0100
Message-ID: <20150707123838.GF2887@sirena.org.uk>
References: <558D2FB3.1060209@arm.com>
 <1435316810-8634-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:42735 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756834AbbGGMiz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2015 08:38:55 -0400
Content-Disposition: inline
In-Reply-To: <1435316810-8634-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, paul@pwsan.com, treding@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>


--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2015 at 12:06:50PM +0100, Suzuki K. Poulose wrote:

> +static inline int regulator_list_voltage(struct regulator *regulator, unsigned selector)
> +{
> +	return 0;
> +}

I'd expect this stub to return -EINVAL since the voltage count should be
zero for !REGULATOR (since we obviously can't count the number of
voltages).

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVm8hKAAoJECTWi3JdVIfQncwH+gJW5qeEVfbstdnu56wrbTrI
Mo3XVo8wU+u/q1NEZXSG9iPa+lBwuCwx1hWbJgv+cq92RgTHhBS30ypiZoSTjMjG
em+ez3HTpgoMu43fb6ymDCI+8lCRYolPjH/G2Mz5ZVHBBGbnzEYOztUJeByxpOl8
A+l0xDy/Hu8Ms26Z2ctUhTJFDTGOyGkaaxgiHagw/3FLFjUjXRH0uwPPNWApvUQ8
PjScFdzznjjYTgYvbWkrPylj+ghqLTRzLGElTyRRmQrYBUbYRxQ5qiPVdJFWcFOc
Q3wa8svIldOIwsHhZbWtG50yjEXsQm0n5NNUV/uGx5kYA676Jloh++34hcd9JQo=
=+/s9
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--
