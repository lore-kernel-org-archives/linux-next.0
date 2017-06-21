From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170621 build: 1 failures 7 warnings (next-20170621)
Date: Wed, 21 Jun 2017 11:04:40 +0100
Message-ID: <20170621100440.vcaxagg4yjca2cv4@sirena.org.uk>
References: <E1dNcMp-0005RN-1w@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h7r4ugs5xtkgfvxs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38978 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752137AbdFUKFC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2017 06:05:02 -0400
Content-Disposition: inline
In-Reply-To: <E1dNcMp-0005RN-1w@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--h7r4ugs5xtkgfvxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2017 at 10:56:07AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/pci/host/pcie-mediatek.c:485:8: error: implicit declaration of function 'pci_register_host_bridge' [-Werror=implicit-function-declaration]

caused by eaf3023b0498a (PCI: mediatek: Add MediaTek PCIe host
controller support).

--h7r4ugs5xtkgfvxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllKRLcACgkQJNaLcl1U
h9A55gf9GWoU0Nl57Ta9i1zMX0Fzhlxsrusbd6tN8qkFLcZRjDb1i7ifDVmhezQ4
nQ7p49Al+wdQhIVMmwUk2WyOW5JDsqwCZg0j0Oy7VGUmP0LHLtDZ946WhpQeFrrn
w5IRyQEMx9v+UfvvZ81tW6AGXNhsJpbDR6WJ7sVXmjQWTJ8QgZlhimEBHXzaGSDI
dDQjQ6oVB0AGeLuUkIhpA4cu0aDwNUI9bkjJyPnNTv+ubrKPbBl9jfbo+zD9pmG4
aCZRfc6igcfxOlKxHnBZpWEYFn9eRGLv4AUT+qc7WGdbvXS2FS0C8OZ3Q3ZGpPux
G4XWNut79PaDJMlOY0rJZN6yJWbk8Q==
=wUFQ
-----END PGP SIGNATURE-----

--h7r4ugs5xtkgfvxs--
