From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150807 build: 2 failures 51 warnings (next-20150807)
Date: Fri, 7 Aug 2015 13:23:44 +0100
Message-ID: <20150807122344.GT20873@sirena.org.uk>
References: <E1ZNgYS-0000SE-QL@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+rFsOjK2Tamn30Dk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:32839 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753181AbbHGMX6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2015 08:23:58 -0400
Content-Disposition: inline
In-Reply-To: <E1ZNgYS-0000SE-QL@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Lina Iyer <lina.iyer@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org


--+rFsOjK2Tamn30Dk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2015 at 01:15:20PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an arm64 allmodconfig with:

> 	arm64-allmodconfig
> ../drivers/firmware/qcom_scm-32.c:27:28: fatal error: asm/outercache.h: No such file or directory

This header file only exists on ARM, either the driver shouldn't be
built for ARMv8, we need a dummy header for ARMv8 or we need to use the
header conditionally in the driver.

--+rFsOjK2Tamn30Dk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVxKNPAAoJECTWi3JdVIfQhrcH/2BKrYX4ymKMAFU9TdRqCa2X
XHbQhlRj6xXBAH/js58BsxMRE4PduHxOk5/Ef7rWNeafm74AL2ZPB/ZaS3LMmHxh
b7Gr4roYeRdIfUoWmig9GsUejnGGti5Oy/NrgAPHlQtGjPpi7Zk0DKTN/V5EJ2wp
IV+kZEHJo12TZxGer3p8EIoYgiWNy9/GjdhnEjNFICLGTtWBGdlUlS7/BvYrX7cw
i9tmuvqwx5TDwpGijaDx9kMNZ8wsD/+CebYB+sg5JmosQGztNzCZ9vr0vpDj6Mrv
CEhKm610UcQmZEW6PyOT0OqERlETvyjchsPSo46M4h25/JuY9qdtp3EByxc21fI=
=h6rY
-----END PGP SIGNATURE-----

--+rFsOjK2Tamn30Dk--
