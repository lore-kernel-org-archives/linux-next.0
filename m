From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170131 build: 2 failures 3 warnings (next-20170131)
Date: Tue, 31 Jan 2017 19:10:21 +0000
Message-ID: <20170131191021.ogodwklhn74o5ws5@sirena.org.uk>
References: <E1cYVke-0001Pw-1e@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fcbcqcphgec7sanl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45846 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751703AbdAaTKp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Jan 2017 14:10:45 -0500
Content-Disposition: inline
In-Reply-To: <E1cYVke-0001Pw-1e@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jiang <dave.jiang@intel.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--fcbcqcphgec7sanl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2017 at 10:33:28AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/hsi/clients/cmt_speech.c:1114:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/armada/armada_gem.c:38:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/etnaviv/etnaviv_drv.c:468:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/etnaviv/etnaviv_gem.c:178:5: error: conflicting types for 'etnaviv_gem_fault'
> ../drivers/gpu/drm/omapdrm/omap_drv.c:696:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/omapdrm/omap_gem.c:531:5: error: conflicting types for 'omap_gem_fault'

which is triggered by 25d3db7600b87 (mm, fs: reduce fault, page_mkwrite,
and pfn_mkwrite to take only vmf) which updates the signature for fault
but doesn't update all the users.


--fcbcqcphgec7sanl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliQ4RwACgkQJNaLcl1U
h9C2bAf/TaFznA3rPorVnr3k4KF5NzvI2QfFSdmloY7dlz6Tb1f8A7Sfgd2+sr82
zNDgol5GH4yUN+aFJhHfCnpAta2cLbGxB0EGY/veERvNmv/WTUKHf0juQ0+YI4jt
p6OAGLqhpW7k9gqVhioE436SVx0PeuiO2YACp/ZoGXd+SjGNOSuInzfjyNDmKN59
SaQe4gVMApJv/TnVuoXmrr+UIw0mtRiPQrNQkN5wNWn+q/bA90DvlsAnCVyyTU9h
5ka76KOcGCSCId0+lveVLlh+qGvinCNQT2dxWdBIfF1hTf0VgJOVavyGt8QW8omO
VUgFRn8A3scA11KZaigPvGuq7/CIyw==
=0cVW
-----END PGP SIGNATURE-----

--fcbcqcphgec7sanl--
