From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Fri, 26 Feb 2016 12:04:11 +0900
Message-ID: <20160226030411.GK18327@sirena.org.uk>
References: <E1aYsmb-0006qb-76@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0ZUi7uLaY0HiAqfY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37788 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbcBZDEX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2016 22:04:23 -0500
Content-Disposition: inline
In-Reply-To: <E1aYsmb-0006qb-76@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--0ZUi7uLaY0HiAqfY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 25, 2016 at 10:04:29AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
> ../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
> ../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
> ../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
> ../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]

caused by b4f596b19624 (arm64: add mvebu architecture entry) which
enables MVBEU on arm64, the commit was present for a little while and
the error cropped up but didn't get reported due to other things masking
it.  This looks like the driver needs modernization and probably ought
to have a !ARM64 dependency for now.

--0ZUi7uLaY0HiAqfY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWz8CqAAoJECTWi3JdVIfQ+CYH/1aHU4Gr6IE3itZHpHOAUCgk
sPIYGin6JKQcgN7BeoGctSk/nxFT+072eV05pOCU+S/6nKoD77w9LDX4fm7Q2BEV
pPpb+d79ZmLInfWzpXkpHAsAOk1RQM8vHUXZb4tGKBO0hLyWSiFoP9PmyeuRF5Ra
Z3dJ88RNdhz4iwBzLq+qxfIsaMkghQ5Jy+vBvSOnYotDaSkTp7TBI6owWgUxyCby
rwjGQB4XdAowzf7TCIzfAFzfQEterAuRX3zKgHFMXAsXOqS8dnGPV24c9fmThWPf
B2ohdwmTZFBxt9W9LeBCJHjMfQMLTWBRMBb0V9UH7VtfCmtIUSWW7tIcFFiVJsI=
=+Xrs
-----END PGP SIGNATURE-----

--0ZUi7uLaY0HiAqfY--
