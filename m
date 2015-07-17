From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] mfd: Fixup clients of multi_reg_write/register_patch
Date: Fri, 17 Jul 2015 18:57:04 +0100
Message-ID: <20150717175704.GR11162@sirena.org.uk>
References: <20150717143934.4f0ce5d7@canb.auug.org.au>
 <20150717094436.GC21939@opensource.wolfsonmicro.com>
 <20150717103450.GJ11162@sirena.org.uk>
 <20150717140926.GG21939@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6mqFCp4yUXYxk5sJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55915 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752438AbbGQR5P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2015 13:57:15 -0400
Content-Disposition: inline
In-Reply-To: <20150717140926.GG21939@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>


--6mqFCp4yUXYxk5sJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2015 at 03:09:26PM +0100, Nariman Poushin wrote:
> Introduced by:
> commit 8019ff6cfc04
> ("regmap: Use reg_sequence for multi_reg_write / register_patch")

Lee, feel free to pull the request below in to get the API update or let
me know if you want me to merge some MFD changes instead:

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-seq-delay-api

for you to fetch changes up to 8019ff6cfc0440415fcfb6352c58c3951e6ab053:

  regmap: Use reg_sequence for multi_reg_write / register_patch (2015-07-16 22:02:55 +0100)

----------------------------------------------------------------
regmap: Create a new struct reg_sequence for register sequences

In order to allow us to start adding extra annotations for sequences
without bloating register default tables duplicate the structure under
the new name reg_sequence and update the APIs to use that instead of
reg_default.

----------------------------------------------------------------
Nariman Poushin (1):
      regmap: Use reg_sequence for multi_reg_write / register_patch

 drivers/base/regmap/internal.h |  2 +-
 drivers/base/regmap/regmap.c   | 22 +++++++++++-----------
 drivers/gpu/drm/i2c/adv7511.c  |  2 +-
 drivers/input/misc/drv260x.c   |  6 +++---
 drivers/input/misc/drv2665.c   |  2 +-
 drivers/input/misc/drv2667.c   |  4 ++--
 drivers/mfd/arizona-core.c     |  2 +-
 drivers/mfd/twl6040.c          |  2 +-
 drivers/mfd/wm5102-tables.c    |  6 +++---
 drivers/mfd/wm5110-tables.c    |  6 +++---
 drivers/mfd/wm8994-core.c      |  8 ++++----
 drivers/mfd/wm8997-tables.c    |  2 +-
 include/linux/regmap.h         | 17 ++++++++++++++---
 sound/soc/codecs/arizona.c     |  2 +-
 sound/soc/codecs/cs35l32.c     |  2 +-
 sound/soc/codecs/cs42l52.c     |  2 +-
 sound/soc/codecs/da7210.c      |  4 ++--
 sound/soc/codecs/rt5640.c      |  2 +-
 sound/soc/codecs/rt5645.c      |  4 ++--
 sound/soc/codecs/rt5651.c      |  2 +-
 sound/soc/codecs/rt5670.c      |  2 +-
 sound/soc/codecs/rt5677.c      |  2 +-
 sound/soc/codecs/tlv320aic3x.c |  2 +-
 sound/soc/codecs/wm2200.c      |  2 +-
 sound/soc/codecs/wm5100.c      |  2 +-
 sound/soc/codecs/wm8962.c      |  2 +-
 sound/soc/codecs/wm8993.c      |  2 +-
 27 files changed, 62 insertions(+), 51 deletions(-)

--6mqFCp4yUXYxk5sJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVqUHvAAoJECTWi3JdVIfQm6YH/0TEouGaHqGshfGU2b6ru5sV
Q1hQ0ssSEFYBFtyv6QIvQXPXaEIid+aSqH/S8dWnSDIeJJ8LJl5qiRfg3YtWOt+h
Ot33FjnvfMVuwc/jDZaibswqoUJba4jO4K/64ZzS+CpKDOL286XwgSrZFtNC+r71
8YnCns75ULP3W/iLXHgG81lNsJ4wYwncIXcbx1gLCDPQlNr5AyGiOD4fxJoCUjZh
9o2BydgkrRHQswdqsGkJD5bzhrkqm3TGTt9aa8cSBbgO5EciTvWKlAC+KDAsYCRr
ss2r+68BNr/sysa0PtG7+P3SUivxMbnCd8fMoJx57cHz47KYK2MJgdxAR/ZhRGI=
=mjy1
-----END PGP SIGNATURE-----

--6mqFCp4yUXYxk5sJ--
