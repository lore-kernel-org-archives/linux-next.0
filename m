From: Mark Brown <broonie@kernel.org>
Subject: Widespread boot failures on ARM due to "mm/page_alloc.c: calculate
 zone_start_pfn at zone_spanned_pages_in_node()"
Date: Mon, 4 Jan 2016 22:42:33 +0000
Message-ID: <20160104224233.GU16023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RGwttE/plSABi47o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35970 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752055AbcADWnI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2016 17:43:08 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Taku Izumi <izumi.taku@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mel Gorman <mel@csn.ul.ie>, Xishi Qiu <qiuxishi@huawei.com>, Dave Hansen <dave.hansen@intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Kevin.Hilman@linaro.org, Tyler.Baker@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>


--RGwttE/plSABi47o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since 20151231 -next has been failing to boot on a wide range of ARM
platforms in the kernelci.org boot tests[1].  Doing bisections with
Arndale and BeagleBone Black identifies 904769ac82ebf (mm/page_alloc.c:
calculate zone_start_pfn at zone_spanned_pages_in_node()) from the akpm
tree as the first broken commit[2,3].  An example bootlog from the
failure is:

   http://storage.kernelci.org/next/next-20151231/arm-multi_v7_defconfig/lab-cambridge/boot-exynos5250-arndale.html

which shows no output on the console once we start the kernel, a brief
sampling of failing boards suggests this is the normal failure mode.
x86 and arm64 targets seem fine (juno shows up as failing but the boot
log seems fine so it's probably a false positive, Mustang was failing
already) and there are a small number of ARM platforms that boot.  I've
not yet had any time to investigate further than that (including trying
a revert of that commit), sorry.

[1] http://kernelci.org/boot/all/job/next/kernel/next-20151231/
[2] https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/135/console
[3] https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/136/console

--RGwttE/plSABi47o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWivVYAAoJECTWi3JdVIfQr4oH/j4Uxf/cSIDGWXkuc4N0IC85
ZfMY8zKa7yQZFYzXdQujaw+qVV22D1aQc4BCZvPQB/OdIEY2PXHQi6enN4tejwAZ
CkMO6J5coK3FyjEPrMkjHAMpJiJ+29YcxcnsD2HUWdz7cNRtPkMcIBY6onchgPWL
e37eDwKtNWhd0ho2BLLKtGP3+a8NU5VtqcE21ltpuCpsrhf4Fb0WWvsa4a/AMuyW
sIzT0Dd9HP2UxsUeMGSMkjiUBi4jrOhQP+PHzzbijENfdNeC1BBGJsQoESQYRiNr
jrgn/rs3SLNnTSRJByMx9xBOkbRIYHx9TDdaoExzCv4ArXZ+FhVVC22oK799bXs=
=dsnd
-----END PGP SIGNATURE-----

--RGwttE/plSABi47o--
