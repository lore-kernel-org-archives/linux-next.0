Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ECF376475;
	Mon, 24 Aug 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577608; cv=none; b=RCpDEwNMv8CY3tHfstzwDSifQ5sjcE/qm+Mj1pYUQ3G67Cklo3nWFVOj12u+JkLDnZIgyId7YFEdH8CT9fpuasoMQa5FWBJxYejB8psFnpB1fsSHMPgM6N0DrL1qKcw68GcRnbuLoM62DfHfhE1xCo5xDPGywnro6vJznrntiDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577608; c=relaxed/simple;
	bh=AajvA+vBW/ciRYYvOF4afhDw/DsWTxJOs1mC4aiTb3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uy9g77ueTag/q9+PbUgzAXaV8nuQWP7ZeGOHPRxY6Uff29SheBEW7B08B25Cm5Z3J6M+aqWLRsUFlBx0/QEOUZgpIsOTzflZMH7TvJJSWlgIDGxNhlnnD+qulz9V+WhmzURpQkE6777Cfqp4s58BYAdGrHd4FiVDMNLfLVhXY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqMT4zN/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqMT4zN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0621F000E9;
	Mon, 24 Aug 2026 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787577607;
	bh=JnA47twE9Czkep3DqwO5j7HBHdJmvCFVMmXePyAX2dA=;
	h=Date:From:To:Cc:Subject;
	b=MqMT4zN/2RZ3L2EPV6RUpiQzzgKyyxXsOxXdLUyrHsl2+BOKa7AePNVo2SetSUI1j
	 2gTeBG0R5Rai1szUPNR4+imIUjwI4RA6e6t81OhWLGA/8OlFpEhWHHTuacbaqIiUM2
	 TO1iRCbXpBlZLHC17/JUf6JnC0E99XAUSGBGjCT0aO8Pv6XMNuuD9QhOYmQU0iuSAG
	 NijvPbgJpMlK9lEoFv/pJrirP4F4S9kozXLkBxp8aNAYKYcEDQlxkvBPD71ZhR1lpb
	 g+/bOMa3cnGW8D2k0q0u9IYbEahSdcHbO0ji8dkcYmfHRylaR1eaNAnUp1EY5aOIYI
	 J6AwjTg2iY2TQ==
Date: Mon, 24 Aug 2026 14:20:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status half way through the v7.3 merge window
Message-ID: <baac51e0-a665-4f82-801e-6fa8d53b68c5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2U91IzkKiZz+4Rxt"
Content-Disposition: inline
X-Cookie: Accuracy, n.:


--2U91IzkKiZz+4Rxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The merge window seems to be going quite smoothly from a -next point of
view, relatively few conflicts thus far from reodrdering as you merge
things or similar.

No trees are held at old versions

Trees with signoff problems:

  arm-soc	(missing author)
  arm-soc	(missing committer)
  fbdev		(missing author)
  fbdev		(missing committer)
  risc-v-fixes	(missing author)

The fbdev one should already be fixed, the arm-soc one is the one that's
been there for a while.  The risc-v-fixes one was only introduced on
Friday.

Non-merge commits relative to Linus' tree: 3673
 3380 files changed, 177907 insertions(+), 85668 deletions(-)

Top trees adding commits to -next:

  482	char-misc
  186	staging
  175	mm-unstable
  170	kvm-x86
  161	usb
  152	drivers-x86
  150	clk
  129	pinctrl
  120	qcom
  98	net

Trees adding duplicate commits to -next:

  54 vhost
  19 nfc-fixes
  15 drm-xe
   9 clockevents
   8 hyperv-fixes
   3 kvms390
   3 fuse
   2 pinctrl
   2 mediatek
   2 drm-xe
   2 drm
   2 clk
   2 char-misc
   1 vfs-fixes
   1 usb
   1 mfd
   1 kvm-arm
   1 char-misc
   1 broadcom

Thanks,
Mark

--2U91IzkKiZz+4Rxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMRQIACgkQJNaLcl1U
h9BgLQf9FF346kHTjuZDIyxQ1H3yG9RZbWuNN/YrhaOkCDF2+TviLHHfV+Kc6Uy4
X1NGRyReHDH8qwe3ehEaX2UhgjGOotF30s5WF/kYgb6lougQ6T7zRCB2viCossSJ
8RPi9Nh2n65F3UniS4+pS0mGrniLJ0UxFUWODt9KZ8u0dcSkHsOZGyUt7zkexrdI
X29588SwW5dapkvTCK0o/QMcokWCdgxJyG944atuvxApd7m2SKxpDEqYtoTVA+F1
4CWid/kBm+8icfF0YPHroBQp2lLr/IZsbE1B0Wv0bwAedwNR4aJ5ORwaVekG0VCU
X8F9ceBL+/YY4lrmuF2Ih4V/0kKWTw==
=JghD
-----END PGP SIGNATURE-----

--2U91IzkKiZz+4Rxt--
