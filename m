Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9837C371CE3;
	Mon, 17 Aug 2026 18:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990025; cv=none; b=hmn2E3eVa7SCCx/YNZSPai6S3Cr7S/iIFWmW7wisYC90MYPtzEl7SiQZeFDAQ0anPGN81494DrlM+h+PZwlBkGSsB0r+GlI+aEeKNzySgwVs+gSrqFMPpSUdb6xVVS4Djofw8YvkSLyVnrHoVKNuL3CY9ki69pVGLGBTKWqriS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990025; c=relaxed/simple;
	bh=DxO9k0lK8RYOjzGKy5AKe8Wi0XdeyzDub/jWQdVDA/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSJxusDk7jrUSHrdau+9ICRa7nlZM4AL/eRHzj/o0+bPNz+vJn/mvAPZbFPbCY7fqZJikvYm+VlNu16LuHVDwht6WiaZ9QxCSXjCEUUAojPxyLjw+uSbKS9ckpsSKITsg+iSlbE6ZSl7s7yQiynx4vq44RLCupdB/11P5spjSg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWuWw62n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWuWw62n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DD11F000E9;
	Mon, 17 Aug 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786990024;
	bh=fqBcRio5KXd+t1vZvpMgsBPNaA1gIvhVlKD8Ii20aNQ=;
	h=Date:From:To:Cc:Subject;
	b=UWuWw62nNk/9/zlMLACTYoVAZShhtosKzkvoBtV0lgZJ5XqZschn2byDcazle1dU2
	 wkU7AWp2eqtPFwpbe6lhm01ugImiShkYtl7qbiUmlN1qsLt6L9tP7+tiDoh3sotr81
	 LlVwPPO1xqi8WROOVVwo69YfRPIEsg8cmGlQVfMKK7ZDwQyY+2D4OtwCX59v6pd+UL
	 lXNwVc6ySpVGXi/wqxY0DID629dq9Cbdl5ViVygnsV3QqhflYOQBxWM+MvbSvco1x7
	 cuTvGT78qdqSviS4qMXarlscZ1s5H6R7FEq3sau0VluWqg2cUUvcDdVCl3GxDimWi1
	 laT/X9u65CzUQ==
Date: Mon, 17 Aug 2026 19:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2
Message-ID: <d31a7e85-41e1-4fc7-af1b-b1ca1dbbf05b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qGLyDpH0aREN+3Mx"
Content-Disposition: inline
X-Cookie: Obey all traffic laws.


--qGLyDpH0aREN+3Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Aside from an unusually large collection of signoff issues today
everything seems completely normal at the minute, hopefully that'll
translate into a smooth merge window.

Trees being held at old versions:

  clk          	next-20260814	(new driver issue found today)

Trees with signoff problems:

  arm-soc	(missing author)
  arm-soc	(missing committer)
  block		(missing committer)
  driver-core	(missing committer)
  fs-next	(missing committer)
  input-current	(missing author)
  input		(missing author)
  ksmbd		(missing committer)
  risc-v-fixes	(missing author)

Almost all of these are new today, guess people were rushing things due
to the merge window opening.

Non-merge commits relative to Linus' tree: 14621
 12628 files changed, 859191 insertions(+), 259750 deletions(-)

Top trees adding commits to -next:

  2094	drm
  1243	net-next
  1075	arm-soc
  611	sound-asoc
  501	mm-stable
  420	tip
  368	bpf-next
  308	v4l-dvb
  271	vfs-brauner
  270	block

Trees adding multiple duplicate commits to -next:

  129 drm
   11 drm-xe
    9 clockevents
    8 hyperv-fixes
    4 hwmon-staging
    4 drm-xe
    4 drm-intel
    4 drm-intel
    3 vfs-brauner
    3 thermal
    3 kvms390
    3 iommu
    2 pinctrl
    2 mediatek
    2 clk
    2 char-misc

Thanks,
Mark

--qGLyDpH0aREN+3Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDTcMACgkQJNaLcl1U
h9C5Mwf+PqPvaL6hv4/yIV6jzgqqq+FglL8o43ACp8yAiBL8pT6LPpHXIEhmgh+f
Em3zvpk9HYC5doLZm7+NQV/7bmX4EJ9vk4TsGNrkjHR8IW+3qBmj6XLKnXWY/QPI
+a4/bFs3E7Qfj9xv8hwUkV0Un/KchVTVZP19CR89rVt54C1efI0VDJRF7MlxfzEk
36Zy3nxu5nairgWIybDSr9l1VHDisgdTGIdVD9KSJlrrPpQ1wM6r4F7yJ2HW0gIY
UbrllmxRZuddXFNZnRYg/FU7TKunswQD/h8fcK/CAVoXc33tgP4DlvNdSretsg9x
OmKFGPY20qm/gtXDMNWaVBampYVZ7w==
=WZJd
-----END PGP SIGNATURE-----

--qGLyDpH0aREN+3Mx--
