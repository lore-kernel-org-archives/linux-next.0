From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160620 build: 2 failures 9 warnings (next-20160620)
Date: Mon, 20 Jun 2016 14:42:00 +0100
Message-ID: <20160620134200.GU26099@sirena.org.uk>
References: <E1bEwGe-0004DR-4p@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZjLa2K+dB9SFbrgo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53362 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753596AbcFTNm2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2016 09:42:28 -0400
Content-Disposition: inline
In-Reply-To: <E1bEwGe-0004DR-4p@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>, Joerg Roedel <jroedel@suse.de>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--ZjLa2K+dB9SFbrgo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2016 at 11:17:20AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build due to:

> 	arm64-allmodconfig
> ../drivers/iommu/mtk_iommu.c:27:32: fatal error: linux/of_component.h: No such file or directory

which is triggered by da4d6e6d3b3ef (iommu/mediatek: Convert DT
component matching to component_match_add_release()) - there is
presumably a dependency on some other patch series that is still in
review.

--ZjLa2K+dB9SFbrgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXZ/KnAAoJECTWi3JdVIfQmXIH/32yyi4l02t1USKXLostSHPi
WBXXL8wn5+iK6RhGQVTilHFaECC3A9XRMrz8dF8b5MzBF+eXZxJet41fwt6YhbBP
wD12gF6W9bJYzIuv3EFzyoIwhMwG8Mro4sbztmdNVnris3ofWsp1ja815TOVfaPx
dDdqGPoj56ixKCDzbEkYaHLaDlnZ4i+PDvCUz/J3SQQgiWU1VVoh+k8LLMRsu8jM
/9TaqZAaO3i42EFFyKUjVtcXwKb7VqOMZhX70AA9z13yj4otuEk2/EWRW0ZEOr79
kOpLtGbMUC1dOvp31xHDVoE3PMA29ndwCr9rNZ/j7MgsIxk3MdSgWZFJlhp1dDo=
=qAxY
-----END PGP SIGNATURE-----

--ZjLa2K+dB9SFbrgo--
