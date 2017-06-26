From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170626 build: 1 failures 1 warnings (next-20170626)
Date: Mon, 26 Jun 2017 12:56:53 +0100
Message-ID: <20170626115653.e4xs4lk4paibuphx@sirena.org.uk>
References: <E1dPPgG-0002pe-3A@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iu7yg3gbpixrsrf6"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1dPPgG-0002pe-3A@optimist>
Sender: linux-pci-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, lorenzo.pieralisi@arm.com, Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--iu7yg3gbpixrsrf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 26, 2017 at 09:47:36AM +0100, Build bot for Mark Brown wrote:

This build failure is still present in -next:

> 	arm-allmodconfig
> ../drivers/pci/host/pcie-mediatek.c:485:8: error: implicit declaration of function 'pci_register_host_bridge' [-Werror=implicit-function-declaration]

and we're at -rc7 now.

--iu7yg3gbpixrsrf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllQ9oQACgkQJNaLcl1U
h9BgWgf/SVn12U3lkzO9oEN9+0gaMVl/QR0XjFgFD1OnVGhd+lehjZQHsOgXf87n
XxykI6WZxFgBcLg6NYKZih3tuREKT7mKsg65/luCV0fzkVwvsbk8u/6QlPIuB1mK
urhv2qQI3QD0HWn4htaUdBBhBslh5zOEV11xWRHHDHIcDdggG4h+VuRN/cJN+Fm5
eeOe/USHTCdtIerwNNbL3qpC24EN2pdbV2OQRJVu1QC3nE819kxMG+ookwQ4rI6z
BPGLg4hU5vKfgM6OXrUrVuXJcYJAVAsIBxJBii2zGDl8r/8LttnWj1j9voNrlzYk
a7oqgI8eIaoTtHMntmGndCXAhvYmeA==
=50hA
-----END PGP SIGNATURE-----

--iu7yg3gbpixrsrf6--
