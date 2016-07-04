From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160704 build: 2 failures 7 warnings (next-20160704)
Date: Mon, 4 Jul 2016 14:35:25 +0200
Message-ID: <20160704123525.GA6247@sirena.org.uk>
References: <E1bK2Ok-0002jU-NX@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uQKdfr6GvE2xHbL0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40752 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753675AbcGDMfu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jul 2016 08:35:50 -0400
Content-Disposition: inline
In-Reply-To: <E1bK2Ok-0002jU-NX@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, David Airlie <airlied@linux.ie>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org


--uQKdfr6GvE2xHbL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 04, 2016 at 12:50:46PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/gpu/drm/sti/sti_hdmi.c:1250:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/sti/sti_hdmi.c:1251:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/sti/sti_hdmi.c:1252:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/sti/sti_hdmi.c:1253:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

due to adding new code which doesn't take account of the recent API
change in the HDMI CODEC.  There's another change already in DRM for
which the expectation was that the API change and an update Arnd posted
would be pulled over so I guess the same approach makes sense here:

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-hdmi-codec-pdata

for you to fetch changes up to efc9194bcff84666832c6493bafa92029ac6634c:

  ASoC: hdmi-codec: callback function will be called with private data (2016-06-27 18:53:15 +0100)

----------------------------------------------------------------
ASoC: Add private data for HDMI CODEC callbacks

Allow the HDMI CODECs to get private data passed in in callbacks.

----------------------------------------------------------------
Kuninori Morimoto (1):
      ASoC: hdmi-codec: callback function will be called with private data

 include/sound/hdmi-codec.h    | 13 ++++++++-----
 sound/soc/codecs/hdmi-codec.c | 15 ++++++++-------
 2 files changed, 16 insertions(+), 12 deletions(-)

--uQKdfr6GvE2xHbL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXelgIAAoJECTWi3JdVIfQXfoH/ilVcR5S3zq96A07sSSyEyls
t09rNPtbXxbSkqL1bXbtURJTVaOthGo0mKOk12GFy/vW2qcjd1eJ92zSvGlT1Lo0
vZ0+Bpwj+TmI7BJMULr+l153oLBRvG3zwCurLPgfiw2AXksHEvySs26frG4tP8de
tCSjWANF/T1OCC6AtuFC90yI6NDBu6g0BmDMEXkCBoj1JbMRKL4sRdIQ2xpM/3QX
1Dk6bpY7N4WrC687R5FIhnnA6rThMPdjR+qXIM6VDMHoVv+wJlaMnbGFn/bKT9CD
JMnpEsFJx3IkJkyHYtt6pJ19E+um9qge/LjBprI6g7Qd68QH6eRfu8mNpTsBD/o=
=TNtp
-----END PGP SIGNATURE-----

--uQKdfr6GvE2xHbL0--
