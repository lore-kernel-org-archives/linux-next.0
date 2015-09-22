From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150922 build: 1 failures 346 warnings (next-20150922)
Date: Tue, 22 Sep 2015 09:24:17 -0700
Message-ID: <20150922162417.GI30445@sirena.org.uk>
References: <E1ZeORj-0001FG-G8@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BkEY3RoTgCMsaH6y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46203 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933180AbbIVQ03 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2015 12:26:29 -0400
Content-Disposition: inline
In-Reply-To: <E1ZeORj-0001FG-G8@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: huangdaode <huangdaode@hisilicon.com>, Yisen Zhuang <Yisen.Zhuang@huawei.com>, Kenneth Lee <liguozhu@huawei.com>, "David S. Miller" <davem@davemloft.net>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--BkEY3RoTgCMsaH6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2015 at 03:21:29PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c:315:3: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]

due to 511e6bc071db148 (net: add Hisilicon Network Subsystem DSAF
support) in the networking tree.

--BkEY3RoTgCMsaH6y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWAYCwAAoJECTWi3JdVIfQOZMH/1kb2f76rAv4env2D0vrzUHk
/odh2dJpPUBZyG0sLm+xfyt1AEEDMeAkRGE4Kuab4QkdgvhfTX41QU0tfPxM3SDB
VfCO7h/SCLWjHRchH+avP+gI2SK8mjpedYGVTJ5p6CQDI2/PmEy+7shyNAS6kqWB
o5gsAv9mo/Y80kkKYRP2NyY9tdtIada8YtkZziHjCw3RrtHtdOhDQ0Kl7/ToLnwL
VrPuufxnnrrmWZPhUXfZsGBcqRAs0bjuCncjJNRA+wFpHzq8yVYYchhrZrIW+uG/
3NuSLTN+QO0lLZeir2u8fnkZGB5dRzZZE6PVoY6ZtlrjRpItWgzgq/eRzZTZtOU=
=DuRs
-----END PGP SIGNATURE-----

--BkEY3RoTgCMsaH6y--
