From: Mark Brown <broonie@kernel.org>
Subject: Build failures in -next due to use of __hrtimer_start_range_ns
 arm-ccn.c
Date: Wed, 13 May 2015 15:51:01 +0100
Message-ID: <20150513145101.GU2761@sirena.org.uk>
References: <E1YsUw4-0002i4-Do@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4fNq9Po2wJlmxAaR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37656 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933090AbbEMOvQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2015 10:51:16 -0400
Content-Disposition: inline
In-Reply-To: <E1YsUw4-0002i4-Do@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pawel Moll <pawel.moll@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--4fNq9Po2wJlmxAaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2015 at 12:34:48PM +0100, Build bot for Mark Brown wrote:

> 	arm64-allmodconfig
> ../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '=
__hrtimer_start_range_ns' [-Werror=3Dimplicit-function-declaration]
>=20
> 	arm-allmodconfig
> ../drivers/bus/arm-ccn.c:924:3: error: implicit declaration of function '=
__hrtimer_start_range_ns' [-Werror=3Dimplicit-function-declaration]

Today's -next fails to build both arm and arm64 allmodconfig due to the
above errors, introduced in commit ffa415245b8666c44d (bus: arm-ccn:
cpumask attribute).  Judging from the name of the symbol it appears that
the code is peering into hrtimer implementation details and indeed it
was removed in commit 58f1f803f1d6ef9 (hrtimer: Get rid of
__hrtimer_start_range_ns()) which has a commit message suggsting that
this has indeed been explicitly removed and no new references should be
added.

--4fNq9Po2wJlmxAaR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVU2TUAAoJECTWi3JdVIfQQlMH/Ak9pqHUA0KT/icEmFdZwfwN
rVj0oFZCuJyDBKT5R3erYZQwAPTo+9YfjrqXTRwjBcvCoKSYTi+iJ3cIl9IwAMFo
Y1gPwOQhx/KbJLkKxAN117VD4ABPMTMXyOrGMSbG1sYj5H61wd22O6it3SMQdoJ3
uwfJd5kwnyijQZhkBCRPCN+iE9sK9E5lEt/Ct5Qe6CFWuVJ4If7nxwrSsNet/AjY
jMq25/TN2Qy3ED2m9ZyD5HaT8ouJCWt2NAAb1pxyQgSbQE7Ejwab81SvsP6xmH2u
8rhWgB3YZIKXKmvkwbYA6Hqj5SXPPO9jmWrxQLx/SmQ/wQ4UiDtgri6/5b9hJ/c=
=Z8Q5
-----END PGP SIGNATURE-----

--4fNq9Po2wJlmxAaR--
