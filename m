From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the spi tree with the slave-dma tree
Date: Thu, 19 Mar 2015 14:48:34 +1100
Message-ID: <20150319144834.56c676f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z1DpaZL+nYfPVsaVtN1JRyj"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52582 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751813AbbCSDsl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2015 23:48:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

--Sig_/Z1DpaZL+nYfPVsaVtN1JRyj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Today's linux-next merge of the spi tree got conflicts in
drivers/dma/intel_mid_dma_regs.h and drivers/dma/intel_mid_dma.c
between commit 3b62286d0ef7 ("dmaengine: Remove FSF mailing addresses")
from the slave-dma tree and commit 36111da7838e ("dmaengine:
intel-mid-dma: remove the driver") from the spi tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Z1DpaZL+nYfPVsaVtN1JRyj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCkcXAAoJEMDTa8Ir7ZwVepcP/jykFrfOia6zpRBkLbSlefsg
XBxHWriJVxPXNpLn/D7tVhQKRFxAXp647LUjzi2uBjhvWVmniqRMZ0OH+zJg+56g
Y9av8GsvfEumhnXjKd2+2V+0dOeDdBh7/wKSbfzZtGE1qkz8OAPUf9ryXPA0fIQE
2tTKL71BYON2q/0drDVwMURZMo85wdwtjDIbrU+ljN/GBO3gmp7nF66n71PtGewR
ZF72nt4CFpeRpIWmwEbnWi8NFED3+z8NO4uEO6pwkJkHQ9iL4Hb+LVahunCUt0Tt
qtE63d6fNpo5hG1EMURT8Q50aO0e6NRWg4cb34sbftgjvp/5uhudOk9NUEIWhyRa
3KjwEB71wJo/6HcYG8uVvR1xgg2Rd/MT9KjXWgeUoG2+yNqf1YQzIeL/cHBSYUwY
K5PPOWNkXvZXrUJNoeWN7mU4N+tjOe3ED0VdGjuaSDyq5naGsYpwe5El2wW+h5Rj
fAEktyyXkIK8i6erQUXtFOIdaaYkkfYQ82ZZP+3cUCrp5rl/X8hu/1G0UkluBJ/C
uKhFAaMUoeFqJbUuuCwWm9x0hCe2l+kbOSmqHcqIGafjiI0DTnwbkLSKrtht4Tve
KpqGXbQ+MQ+Yq4jnDauFEY3eRWK2cUoSkr5ORTGj/ndsM2+pOdcFYTTuIx/L9QrZ
krL3Qu7tNdvCOZqyoeNz
=bk6i
-----END PGP SIGNATURE-----

--Sig_/Z1DpaZL+nYfPVsaVtN1JRyj--
