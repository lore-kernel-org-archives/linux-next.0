Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2BB3B5F5D;
	Mon, 10 Aug 2026 22:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401786; cv=none; b=OwJDiu6gfCRecffGFdgoPDtZcGcqiOaQJAIJvyQcnel0rGI0hlyX1zFQalSH0gr4b8079hSKiKZ7D2/oekCtLtOYsblV8EIed44GjpPdYWyXm8OfC75kW7nyDo7gPMZwp2aOZcXItvT3nGFDmX9k/OBdl4mEUdsRLhHEsNYwj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401786; c=relaxed/simple;
	bh=3RrVUZZuirBZstOnr9Ktd3KBchTkZFmvOk8+FN6U8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqpy7lSiCj8aLhqBGltZF/9edQXPON3elXpNIVxJyRaIPA0sC5G7SnVsi0q5t2PCfRSicc5dK4foXsByz4qLXOc9H7pCJ18gRcRiKZRb8n84A48qbwtBiFesO/ih8RZVTF90xq2hx7Q0UmjIji/oaun7B+0+peAZ1CEaIhbz+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzaGj2Ji; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzaGj2Ji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483B61F000E9;
	Mon, 10 Aug 2026 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401785;
	bh=+vVbfJMnbj6bAnsQ7eu7uTujM/P6SSSKbynxDGckDHE=;
	h=Date:From:To:Cc:Subject;
	b=OzaGj2JiJ14OBrEtrOjJa4D+1vLNglJgCkr9FruZkM2ItQCfMNRZs9fajxe4SPRfZ
	 5KcdJdmw5hpgW0PMqLPOKu3kvk/+Q/3nlHQ1qO288GGItouWPj8D0cGuEOeKPCW23R
	 nIhYaHpTGwO5GRLIYTXcDS6iSelL2EYACwL1fm/qu+YQyR83PJocWhxQZShmLkD8nZ
	 sm1p5MGHwzW5SbGbUVYwkzUlMSgxofheuVZsaUi/genL4QOWpzVlEmp+L7D5PN8ABa
	 wlWiv8euCFdc+cG5CUpKEfRVydwzLLgMBRl8eNtDY4MS8Oo4ShI3441iW7OW4qYmBo
	 95Mi1R3p6JWYQ==
Date: Mon, 10 Aug 2026 23:43:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2-rc7
Message-ID: <cd671cfe-eec0-4101-898f-9fd4796de7f9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gFD7XR1hzssVySDk"
Content-Disposition: inline
X-Cookie: Polymer physicists are into chains.


--gFD7XR1hzssVySDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Everything seems to be roughly on track for this point in the release
cycle, nothing jumps out as unusual.  We've lost all the allyesconfig
issues there had been for a couple of weeks.

Trees being held at old versions:

  amdgpu         	next-20260806  (long symbol name from KASAN)
  drm           	next-20260807  (amdgpu issue got sent upstream)
  pm             	next-20260807  (missing file, same issue as thermal)
  thermal        	next-20260807

Trees with signoff problems:

  arm-soc		(missing author)
  arm-soc		(missing committer)
  driver-core		(missing committer)
  gpio-brgl-fixes	(missing committer)

The driver-core and arm-soc ones are rebase issues.

Non-merge commits relative to Linus' tree: 12849
 11385 files changed, 622107 insertions(+), 203793 deletions(-)

Top trees adding commits to -next:

  1739	drm
  1134	net-next
  829	arm-soc
  531	sound-asoc
  500	mm-stable
  339	tip
  306	v4l-dvb
  262	bpf-next
  261	vfs-brauner
  232	iio

Trees adding more than one duplicate commits to -next:

 111 drm
  17 nfc
   8 hyperv-fixes
   4 drm-intel
   3 vfs-brauner
   3 iommu
   2 pinctrl
   2 mediatek
   2 drm-xe
   2 char-misc

Thanks,
Mark

--gFD7XR1hzssVySDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp6U/UACgkQJNaLcl1U
h9AIrgf9FBbgmEYuTHE3VYKlVutomoWEkRGX8kyIQdT89S2r6vRpXpqs89VRyxsU
3Po16nqmcef85NLD38ZAhkaycITh3+7N5xElB+iWtISCEb+9rSrCHHTDFYPfIFJ2
eU9Pk6fr8W19AjzF5COd7ZtyQL1tdpzqHUhgLFrgtdVlnUmu3aDFKdSB5ermhftj
/wh857RZG2U87rNoPgCvURXxniuVAf2GfzgYNJMNZalGyy06ZdB7S1ZbqAByKkGu
5d8iVlrR6XM24xR5+Gj+gkMzvLr20+Y4BBnxhh+XNes8EQN7iTI3VUIMO4HOr+Ku
bzAvczwDaTYePQnAv4QmG4UN5JDjBg==
=Jt9S
-----END PGP SIGNATURE-----

--gFD7XR1hzssVySDk--
