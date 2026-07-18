Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18138DF9;
	Sat, 18 Jul 2026 00:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332938; cv=none; b=Wd3a8uC9ZYmZrvXdPIa2BckD6ovzcGmYbHeM8iJkU5iN2GjUO5i3gNbVH5m4HwbTH/E5/wY4JcYxfRkjU9tAStdTSw+Rxo/Dsnq0xEhbABW9p8RvbwQvpZfSPxq0RwuqHxOXIWZjIndSk7Mc2jGhJwTnv1DxBvZmQ7f0tu1NJdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332938; c=relaxed/simple;
	bh=CmDUN6kQPa5COxLeckCP5fzpMmrZBD1UEHCnMd0rUxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s400fxx8B6MabHRZk2PSdRvHwiayecPzsPu4ZjkCbbFjT2ThwIhFFmtyyBqOEGXE8y1Gn1FMKLe0dMt9l8/9i5Ol2VornPeFlYGE2ygrU31OTNf+my/MRnaOM2yDoivjFxVvaQGvqVovldh4gnp08pp4gLSlitLtGiE6Ia2/MIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXBdFbTX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXBdFbTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB75F1F000E9;
	Sat, 18 Jul 2026 00:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784332937;
	bh=WdSKFj4fTN4GyWdesQHE65SPNq3CUj/xMl1sT2A1VmE=;
	h=Date:From:To:Cc:Subject;
	b=PXBdFbTXK2m57BAef6LYrFMWM/EQBke7vEKqC/dgkKyuvqMNUM6gx2+N5Hu9sX+rI
	 QScaFIUhPkGltKYrjRDsQ7pwx1wlCxCcG6oMBgzhFio/HgBBxOOWGmSn48yUql1ZKD
	 iovts2/lY+lSRQHBzIXBwyZf6aDb4ldBiVflV0GapTVOK30nGGr0Xg3UulCrF4iy3G
	 a5BLq80YxzrhkYr3cu1L1Rw8gOGzPFreASjSj5Jmf5EIcBqSpf6TGJ+F2g6GBsDvWa
	 pHA8qB4ufB26L9RLUIntsbtnJR6etru28EjMMe730lTbj9XxfHbXGCREEWicq1U9ln
	 3J1jClrI37pow==
Date: Sat, 18 Jul 2026 01:02:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Roman Vivchar <rva333@protonmail.com>
Subject: linux-next: manual merge of the nvmem tree with the iio tree
Message-ID: <alrCheoG6tP20GlC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pTEbL3mfclUFxnEj"
Content-Disposition: inline


--pTEbL3mfclUFxnEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvmem tree got a conflict in:

  MAINTAINERS

between commit:

  348ff65577603 ("dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6323=
 PMIC AUXADC")

=66rom the iio tree and commit:

  b3c090960d869 ("nvmem: add mt6323 PMIC EFUSE driver")

=66rom the nvmem tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc MAINTAINERS
index d8c06178fe7c1,36f7ee6ba3194..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -16588,13 -16560,11 +16593,18 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
  F:	drivers/mmc/host/mtk-sd.c
 =20
 +MEDIATEK MT6323 PMIC AUXADC DRIVER
 +M:	Roman Vivchar <rva333@protonmail.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	drivers/iio/adc/mt6323-auxadc.c
 +F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 +
+ MEDIATEK MT6323 PMIC NVMEM DRIVER
+ M:	Roman Vivchar <rva333@protonmail.com>
+ S:	Maintained
+ F:	drivers/nvmem/mt6323-efuse.c
+=20
  MEDIATEK MT6735 CLOCK & RESET DRIVERS
  M:	Yassine Oudjana <y.oudjana@protonmail.com>
  L:	linux-clk@vger.kernel.org

--pTEbL3mfclUFxnEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpawoQACgkQJNaLcl1U
h9AM7wf/YNnTwkEcqI/86pDTB6yGSHJbv6GwLGiPpUSI9q+ZKvZu76CHpcQLHRAY
wYCw4q0hNu1dCu+4GNdijsb3NFCL4ZquBm0BtsiWQ+olY5o/C4jo3B9FXRDwmYs3
AEZ90TzE5QH9Z4n+95AjVHZAawR0IIEiqZB8EwF46l6YQUUPZKNC3ML7HHMxrfqO
lTBZQyligWvOYROeY2qp2NVvjbpEXMzibc2b1dZgJ1gwDqyyOEKoeO/Jnr0JSX2e
KUCQMECbic2QNC7DQ0NVP7dHRtK51RRAyHUXu7VeXz/mk7dFPQk+EkUTatEGSlaB
SGUd03AJbSX4ghLnYsXnPPHONwZALg==
=iJzl
-----END PGP SIGNATURE-----

--pTEbL3mfclUFxnEj--
