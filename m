From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20151015 build: 3 failures 46 warnings (next-20151015)
Date: Thu, 15 Oct 2015 12:59:33 +0100
Message-ID: <20151015115933.GD14956@sirena.org.uk>
References: <E1Zmgkk-0005iq-39@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k040vn1t/h12DMPO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59720 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbbJOL75 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 07:59:57 -0400
Content-Disposition: inline
In-Reply-To: <E1Zmgkk-0005iq-39@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Darren Hart <dvhart@linux.intel.com>, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, huangdaode <huangdaode@hisilicon.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--k040vn1t/h12DMPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2015 at 12:31:22PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build both arm and arm64 allmodconfig with:

> 	arm64-allmodconfig
> ../drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c:10:47: fatal error: asm-generic/io-64-nonatomic-hi-lo.h: No such file or directory

> 	arm-allmodconfig
> ../drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c:10:47: fatal error: asm-generic/io-64-nonatomic-hi-lo.h: No such file or directory

This was triggered by f626fe17485b6dc (move io-64-nonatomic*.h out of
asm-generic) which moved these helpers out of asm-generic (which should
never be directly referenced outside of arch code anyway so arches can
provide their own implementations as needed) and into linux/.  Since the
HiSilicon driver has been added in -next it wasn't updated as part of
the same commit.

--k040vn1t/h12DMPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWH5UkAAoJECTWi3JdVIfQSIsH/3GHpwSDmc1e2RnjvQ1453+V
ghPWHCogJoWsUdMSoq2k1AXYA83Dc/Ob/5Zyoep7miEbwftwaTq/kDTIF92tauJb
IRXps7Mj80yrOZzpyW7D9D8jusARZK86zxDWzjS+A3EcFDaREhPJsPh9/2AU7iss
D6AzeG56k8DoCqOuWD0klhT3CcsgM8WW8fJbeI3vZLp6fNT8b66yRh4Sqo7qmSd0
mGsg4A49RvBccriBUtAt2Ht5VBkzFM9fGI+tLjaTmDlUT2QN6q1SZ4lW4VyKOLH/
4H9tX7Lmppc9W5d6W67+J8PSn5M3i74oS6QZNueVLa6gHC6SKlK+sQ5bYyczxgE=
=MDD+
-----END PGP SIGNATURE-----

--k040vn1t/h12DMPO--
