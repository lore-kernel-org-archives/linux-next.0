From: Mark Brown <broonie@kernel.org>
Subject: Re: [slave-dma:for-linus 20/20] drivers/spi/spi-pxa2xx-pci.c:70:3:
 error: unknown field 'max_clk_rate' specified in initializer
Date: Sat, 13 Sep 2014 10:00:53 -0700
Message-ID: <20140913170053.GO7960@sirena.org.uk>
References: <5411735d.SAoL/AZyi+bJWC6n%fengguang.wu@intel.com>
 <20140911101750.GP13406@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hjg+pC/5+IEur/Yc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39390 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751733AbaIMRBE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Sep 2014 13:01:04 -0400
Content-Disposition: inline
In-Reply-To: <20140911101750.GP13406@lahna.fi.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>, kbuild-all@01.org, linux-next@vger.kernel.org


--Hjg+pC/5+IEur/Yc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2014 at 01:17:50PM +0300, Mika Westerberg wrote:

> Vinod, this has dependency to the SPI tree. I suppose right way to
> handle this is to merge Mark's topic/pxa2xx branch into this. Or
> alternatively Mark can make an immutable branch containing the missing
> commit that you can merge.

I've tagged this here, please do remember to coordinate dependencies
when making this sort of multi-tree change:

The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:

  Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-pxa2xx-clk

for you to fetch changes up to afa93c9017fd48d4d5265854c75f5fcde0871548:

  spi/pxa2xx-pci: Add common clock framework support in PCI glue layer (2014-08-16 17:19:50 -0500)

----------------------------------------------------------------
spi/pxa2xx: Add clock support

----------------------------------------------------------------
Chew, Chiau Ee (1):
      spi/pxa2xx-pci: Add common clock framework support in PCI glue layer

 drivers/spi/Kconfig          |  2 +-
 drivers/spi/spi-pxa2xx-pci.c | 21 ++++++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

--Hjg+pC/5+IEur/Yc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUFHhEAAoJECTWi3JdVIfQlU4H/20kgoP2MtYs3HIFIKo1b6O4
wtWIAptszj1/yH6QNPDILhJjdkoSjKwhZOEQtGlHF11obpz4JobErJQ+UtGxNYHO
pgiJnGtbPNLQVYOsOjfaQjlEHTV7TyIMNsAg34rgYE2OIQcfsQzSda2SjVMoQBMr
N/ppZwdO6SRdGQaSEfmzWxAVLKJVloBa/Q1qbBMQNSYR/lpOU8BqOIdFigwIg8yc
bLOF4gmHBdIhLC6GebgUmdshaUrJhomleW4UQaB5pQc7E0X+bV96kSKf3ODHAMZG
OBxNh2HsQLGCiFNHLUEELFTfyfLPGogrxTA6ag/L5TlDFiqi1Ub9YwKXFCDHnPE=
=LqIk
-----END PGP SIGNATURE-----

--Hjg+pC/5+IEur/Yc--
