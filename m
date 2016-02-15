From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160215 build: 3 failures 14 warnings (next-20160215)
Date: Mon, 15 Feb 2016 12:19:22 +0000
Message-ID: <20160215121922.GH18988@sirena.org.uk>
References: <E1aVFDg-00066P-6L@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52011 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752780AbcBOMTc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 07:19:32 -0500
Content-Disposition: inline
In-Reply-To: <E1aVFDg-00066P-6L@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 15, 2016 at 09:13:24AM +0000, Build bot for Mark Brown wrote:

Today's linux-next fails to build an arm64 allmodconfig due to recent
commits adding generic MSI and GICv3 support:

> 	arm64-allmodconfig
> ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "msi_domain_alloc_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "of_msi_get_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "irq_chip_eoi_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "msi_domain_set_affinity" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "msi_get_domain_info" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "msi_domain_free_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "alloc_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!
> ERROR: "irq_chip_unmask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] undefined!

Presumably some missing select or dependency there...

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWwcJIAAoJECTWi3JdVIfQCnsH/i5kG1WaYgJcmQdBtTzYnnh5
NWh/I2VcxjyES2p7XNBVYPpVUxmS3GX3Uhni+9YkN+yxxUjkaDUGYnBblqxmi8UL
OjX8bcoPU3mt5m1vWEKnXjscSdSfH5+SPczvx8/d8hg/tl4gdgk5bV5rcfMk9o3/
/+D+bDlB29jVLoIMlQEocErTA7hBdJqSlfQ7dCo+aMz0xhje40TxcyyTlId9SF0O
4GAnpJzc3UOMKVNW6OEOeT5WNC92E2lWKti9Qlj6YrBsDrwTrbnSHxGtBVO41OJe
ctY+p/9wa7LwyOhOMujIsTBJ1NYKfhwFb6/TcujzIv8NNgtLxUJSsdXMkfu1elc=
=gmed
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
